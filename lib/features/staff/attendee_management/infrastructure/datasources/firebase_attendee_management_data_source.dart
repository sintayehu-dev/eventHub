import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';

@lazySingleton
class FirebaseAttendeeManagementDataSource {
  final FirebaseFirestore _firestore;

  FirebaseAttendeeManagementDataSource({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

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
      Query query = _firestore
          .collection('tickets')
          .where('eventId', isEqualTo: eventId);

      // Filter by status if provided
      if (status != null) {
        String statusFilter = _mapStatusToFirestore(status);
        query = query.where('attendeeStatus', isEqualTo: statusFilter);
      }

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
      
      final hasMore = docs.length > limit;
      final attendeeDocs = hasMore ? docs.take(limit).toList() : docs;
      
      final attendees = attendeeDocs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
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

      return AttendeeSearchResult(
        attendees: filteredAttendees,
        totalCount: filteredAttendees.length,
        hasMore: hasMore,
        nextCursor: hasMore ? attendeeDocs.last.id : null,
      );
    } catch (e) {
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
        final status = data['attendeeStatus'] as String? ?? 'registered';
        
        totalRegistered++;
        
        switch (status) {
          case 'checkedIn':
            checkedIn++;
            break;
          case 'noShow':
            noShow++;
            break;
          case 'cancelled':
            cancelled++;
            break;
        }
      }

      final checkInRate = totalRegistered > 0 ? (checkedIn / totalRegistered) * 100 : 0.0;

      return AttendeeStats(
        totalRegistered: totalRegistered,
        checkedIn: checkedIn,
        noShow: noShow,
        cancelled: cancelled,
        checkInRate: checkInRate,
        lastUpdated: DateTime.now(),
      );
    } catch (e) {
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
    return AttendeeEntity(
      id: id,
      userId: data['userId'] ?? '',
      eventId: data['eventId'] ?? '',
      name: data['ticketHolderName'] ?? 'Unknown',
      email: data['ticketHolderEmail'] ?? '',
      phone: data['ticketHolderPhone'],
      ticketId: data['id'] ?? id,
      ticketType: data['ticketTypeName'] ?? 'General',
      status: _mapFirestoreToStatus(data['attendeeStatus'] as String? ?? 'registered'),
      registrationDate: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      checkInTime: (data['checkInTime'] as Timestamp?)?.toDate(),
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
    switch (status) {
      case 'checkedIn':
        return AttendeeStatus.checkedIn;
      case 'noShow':
        return AttendeeStatus.noShow;
      case 'cancelled':
        return AttendeeStatus.cancelled;
      default:
        return AttendeeStatus.registered;
    }
  }
}