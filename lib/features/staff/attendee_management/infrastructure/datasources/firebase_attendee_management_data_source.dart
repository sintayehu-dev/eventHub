import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';
import 'package:eventhub/features/staff/event_assignment/infrastructure/datasources/firebase_staff_event_assignment_data_source.dart';

@lazySingleton
class FirebaseAttendeeManagementDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStaffEventAssignmentDataSource _staffEventDataSource;

  FirebaseAttendeeManagementDataSource({
    FirebaseFirestore? firestore,
    required FirebaseStaffEventAssignmentDataSource staffEventDataSource,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _staffEventDataSource = staffEventDataSource;

  /// Get all attendees for an event
  Future<AttendeeSearchResult> getEventAttendees({
    required String eventId,
    required String staffId,
    AttendeeStatus? status,
    String? searchQuery,
    int limit = 20,
    String? cursor,
  }) async {
    try {
      // First check if staff has access to this event
      final hasAccess = await _staffEventDataSource.checkStaffEventAccess(
        staffId: staffId,
        eventId: eventId,
      );

      if (!hasAccess) {
        throw const NetworkExceptions.unauthorisedRequest();
      }

      print('Getting attendees for eventId: $eventId'); // Debug log
      
      Query query = _firestore
          .collection('tickets')
          .where('eventId', isEqualTo: eventId);

      // Don't filter by status in the query since not all tickets have attendeeStatus field
      // We'll filter client-side instead

      // Add search functionality
      if (searchQuery != null && searchQuery.isNotEmpty) {
        // Note: Firestore doesn't support full-text search, so we'll do basic filtering
        // In production, consider using Algolia or similar for better search
        query = query.orderBy('ticketHolderName');
      }

      // Add pagination
      if (cursor != null) {
        final cursorDoc = await _firestore.collection('tickets').doc(cursor).get();
        if (cursorDoc.exists) {
          query = query.startAfterDocument(cursorDoc);
        }
      }

      query = query.limit(limit + 1); // Get one extra to check if there are more

      final querySnapshot = await query.get();
      final docs = querySnapshot.docs;
      
      print('Found ${docs.length} tickets for eventId: $eventId'); // Debug log
      
      final hasMore = docs.length > limit;
      final attendeeDocs = hasMore ? docs.take(limit).toList() : docs;
      
      final attendees = attendeeDocs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(
            'Processing ticket: ${doc.id}, data keys: ${data.keys}'); // Debug log
        return _mapFirestoreToAttendee(doc.id, data);
      }).toList();

      // Apply client-side search filter if needed
      List<AttendeeEntity> filteredAttendees = attendees;
      if (searchQuery != null && searchQuery.isNotEmpty) {
        final lowerQuery = searchQuery.toLowerCase();
        filteredAttendees = attendees.where((attendee) {
          return attendee.name.toLowerCase().contains(lowerQuery) ||
                 attendee.email.toLowerCase().contains(lowerQuery) ||
                 attendee.ticketId.toLowerCase().contains(lowerQuery);
        }).toList();
      }

      // Apply status filter client-side if status was specified but attendeeStatus field doesn't exist
      if (status != null) {
        filteredAttendees = filteredAttendees
            .where((attendee) => attendee.status == status)
            .toList();
      }

      print(
          'Returning ${filteredAttendees.length} filtered attendees'); // Debug log

      return AttendeeSearchResult(
        attendees: filteredAttendees,
        totalCount: filteredAttendees.length,
        hasMore: hasMore,
        nextCursor: hasMore ? attendeeDocs.last.id : null,
      );
    } catch (e) {
      print('Error getting attendees: $e'); // Debug log
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Get attendee by ID
  Future<AttendeeEntity> getAttendeeById({
    required String attendeeId,
    required String eventId,
    required String staffId,
  }) async {
    try {
      // First check if staff has access to this event
      final hasAccess = await _staffEventDataSource.checkStaffEventAccess(
        staffId: staffId,
        eventId: eventId,
      );

      if (!hasAccess) {
        throw const NetworkExceptions.unauthorisedRequest();
      }

      final doc = await _firestore
          .collection('tickets')
          .doc(attendeeId)
          .get();

      if (!doc.exists) {
        throw const NetworkExceptions.notFound('Attendee not found');
      }

      final data = doc.data()!;
      
      // Verify the ticket belongs to the correct event
      if (data['eventId'] != eventId) {
        throw const NetworkExceptions.unauthorisedRequest();
      }

      return _mapFirestoreToAttendee(doc.id, data);
    } catch (e) {
      if (e is NetworkExceptions) rethrow;
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Update attendee status
  Future<AttendeeEntity> updateAttendeeStatus({
    required String attendeeId,
    required String eventId,
    required String staffId,
    required AttendeeStatus status,
    String? notes,
  }) async {
    try {
      final docRef = _firestore.collection('tickets').doc(attendeeId);
      
      final updateData = <String, dynamic>{
        'attendeeStatus': _mapStatusToFirestore(status),
        'lastUpdated': Timestamp.now(),
        'lastUpdatedBy': staffId,
      };

      if (status == AttendeeStatus.checkedIn) {
        updateData['checkInTime'] = Timestamp.now();
        updateData['checkInStaffId'] = staffId;
      }

      if (notes != null) {
        updateData['staffNotes'] = notes;
      }

      await docRef.update(updateData);

      // Get the updated document
      final updatedDoc = await docRef.get();
      return _mapFirestoreToAttendee(updatedDoc.id, updatedDoc.data()!);
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Get attendee statistics
  Future<AttendeeStats> getAttendeeStats({
    required String eventId,
    required String staffId,
  }) async {
    try {
      // First check if staff has access to this event
      final hasAccess = await _staffEventDataSource.checkStaffEventAccess(
        staffId: staffId,
        eventId: eventId,
      );

      if (!hasAccess) {
        throw const NetworkExceptions.unauthorisedRequest();
      }

      print('Getting stats for eventId: $eventId'); // Debug log
      
      final query = await _firestore
          .collection('tickets')
          .where('eventId', isEqualTo: eventId)
          .get();

      int totalRegistered = 0;
      int checkedIn = 0;
      int noShow = 0;
      int cancelled = 0;

      for (final doc in query.docs) {
        final data = doc.data();
        final status = (data['attendeeStatus'] as String? ??
                data['status'] as String? ??
                'registered')
            .toLowerCase();
        
        totalRegistered++;
        
        switch (status) {
          case 'checkedin':
          case 'checked_in':
            checkedIn++;
            break;
          case 'noshow':
          case 'no_show':
            noShow++;
            break;
          case 'cancelled':
            cancelled++;
            break;
          case 'confirmed':
          case 'registered':
          default:
            // These are registered but not checked in
            break;
        }
      }

      final checkInRate = totalRegistered > 0 ? (checkedIn / totalRegistered) * 100 : 0.0;

      print(
          'Stats: total=$totalRegistered, checkedIn=$checkedIn, noShow=$noShow, cancelled=$cancelled'); // Debug log

      return AttendeeStats(
        totalRegistered: totalRegistered,
        checkedIn: checkedIn,
        noShow: noShow,
        cancelled: cancelled,
        checkInRate: checkInRate,
        lastUpdated: DateTime.now(),
      );
    } catch (e) {
      print('Error getting stats: $e'); // Debug log
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Manual check-in attendee
  Future<AttendeeEntity> manualCheckIn({
    required String attendeeId,
    required String eventId,
    required String staffId,
    String? notes,
  }) async {
    try {
      // First verify the attendee exists and belongs to the event
      final attendee = await getAttendeeById(
        attendeeId: attendeeId,
        eventId: eventId,
        staffId: staffId,
      );

      // Check if already checked in
      if (attendee.status == AttendeeStatus.checkedIn) {
        throw const NetworkExceptions.conflict();
      }

      // Update status to checked in
      return await updateAttendeeStatus(
        attendeeId: attendeeId,
        eventId: eventId,
        staffId: staffId,
        status: AttendeeStatus.checkedIn,
        notes: notes,
      );
    } catch (e) {
      if (e is NetworkExceptions) rethrow;
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Helper method to map Firestore data to AttendeeEntity
  AttendeeEntity _mapFirestoreToAttendee(String id, Map<String, dynamic> data) {
    // Handle date parsing for different formats
    DateTime? parseDateTime(dynamic dateValue) {
      if (dateValue == null) return null;
      if (dateValue is Timestamp) return dateValue.toDate();
      if (dateValue is String) {
        try {
          return DateTime.parse(dateValue);
        } catch (e) {
          print('Error parsing date: $dateValue'); // Debug log
          return null;
        }
      }
      return null;
    }

    return AttendeeEntity(
      id: id,
      userId: data['userId'] ?? '',
      eventId: data['eventId'] ?? '',
      name: data['ticketHolderName'] ?? 'Unknown',
      email: data['ticketHolderEmail'] ?? '',
      phone: data['ticketHolderPhone'],
      ticketId: data['id'] ?? id,
      ticketType: data['ticketTypeName'] ?? 'General',
      status: _mapFirestoreToStatus(data['attendeeStatus'] as String? ??
          data['status'] as String? ??
          'registered'),
      registrationDate: parseDateTime(data['createdAt']) ??
          parseDateTime(data['purchaseDate']) ??
          DateTime.now(),
      checkInTime: parseDateTime(data['checkInTime']),
      checkInStaffId: data['checkInStaffId'],
      notes: data['staffNotes'],
      metadata: data['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Helper method to map status enum to Firestore string
  String _mapStatusToFirestore(AttendeeStatus status) {
    switch (status) {
      case AttendeeStatus.registered:
        return 'registered';
      case AttendeeStatus.checkedIn:
        return 'checkedIn';
      case AttendeeStatus.noShow:
        return 'noShow';
      case AttendeeStatus.cancelled:
        return 'cancelled';
    }
  }

  /// Helper method to map Firestore string to status enum
  AttendeeStatus _mapFirestoreToStatus(String status) {
    switch (status.toLowerCase()) {
      case 'checkedin':
      case 'checked_in':
        return AttendeeStatus.checkedIn;
      case 'noshow':
      case 'no_show':
        return AttendeeStatus.noShow;
      case 'cancelled':
        return AttendeeStatus.cancelled;
      case 'confirmed':
      case 'registered':
      default:
        return AttendeeStatus.registered;
    }
  }
}