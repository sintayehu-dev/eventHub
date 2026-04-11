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
      
      final attendees = <AttendeeEntity>[];

      for (final doc in attendeeDocs) {
        final data = doc.data() as Map<String, dynamic>;
        print(
            'Processing ticket: ${doc.id}, data keys: ${data.keys}'); // Debug log

        final attendee = await _mapFirestoreToAttendeeAsync(doc.id, data);
        attendees.add(attendee);
      }

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

      return _mapFirestoreToAttendeeAsync(doc.id, data);
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
      return _mapFirestoreToAttendeeAsync(updatedDoc.id, updatedDoc.data()!);
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

  /// Get attendee name from user profile with fallback options
  Future<String?> _getAttendeeNameFromUserProfile(String? userId) async {
    if (userId == null || userId.isEmpty) {
      print('❌ No userId provided for profile lookup'); // Debug log
      return null;
    }

    try {
      print('🔍 Fetching user profile for userId: $userId'); // Debug log
      final userDoc = await _firestore.collection('users').doc(userId).get();

      if (userDoc.exists) {
        final userData = userDoc.data()!;
        print('✅ User profile found, data keys: ${userData.keys}'); // Debug log

        // Check various name fields in user profile
        if (userData['displayName'] != null &&
            userData['displayName'].toString().isNotEmpty) {
          print('✅ Found displayName: ${userData['displayName']}'); // Debug log
          return userData['displayName'];
        }
        if (userData['name'] != null &&
            userData['name'].toString().isNotEmpty) {
          print('✅ Found name: ${userData['name']}'); // Debug log
          return userData['name'];
        }
        if (userData['firstName'] != null && userData['lastName'] != null) {
          final fullName = '${userData['firstName']} ${userData['lastName']}';
          print('✅ Found firstName + lastName: $fullName'); // Debug log
          return fullName;
        }

        // Try email-based name extraction from user profile
        if (userData['email'] != null) {
          final email = userData['email'].toString();
          if (email.isNotEmpty && email.contains('@')) {
            final emailPrefix = email.split('@')[0];
            if (emailPrefix.contains('.')) {
              final parts = emailPrefix.split('.');
              final name = parts
                  .map((part) => part.isNotEmpty
                      ? '${part[0].toUpperCase()}${part.substring(1)}'
                      : '')
                  .join(' ');
              if (name.isNotEmpty) {
                print('✅ Generated name from user email: $name'); // Debug log
                return name;
              }
            }
          }
        }

        print(
            '⚠️ User profile exists but no usable name fields found'); // Debug log
      } else {
        print('❌ User profile not found for userId: $userId'); // Debug log
      }
    } catch (e) {
      print('❌ Error fetching user profile for $userId: $e'); // Debug log
    }

    return null;
  }

  /// Async helper method to map Firestore data to AttendeeEntity with enhanced name resolution
  Future<AttendeeEntity> _mapFirestoreToAttendeeAsync(
      String id, Map<String, dynamic> data) async {
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

    // Enhanced name resolution with multiple fallback options including user profile lookup
    Future<String> resolveAttendeeNameAsync(
        Map<String, dynamic> ticketData) async {
      // Priority order for getting attendee name:
      // 1. ticketHolderName (direct field) - if not generic
      // 2. attendeeName (alternative field)
      // 3. Look up user profile by userId (MOST IMPORTANT)
      // 4. Extract from email
      // 5. Use a more user-friendly fallback

      print(
          '🔍 Resolving name for ticket data keys: ${ticketData.keys}'); // Debug log
      print(
          '📋 ticketHolderName: ${ticketData['ticketHolderName']}'); // Debug log
      print('📋 userId: ${ticketData['userId']}'); // Debug log
      print('📋 email: ${ticketData['ticketHolderEmail']}'); // Debug log

      // Check direct name fields (but skip generic names)
      if (ticketData['ticketHolderName'] != null &&
          ticketData['ticketHolderName'].toString().isNotEmpty &&
          ticketData['ticketHolderName'] != 'Demo User' &&
          ticketData['ticketHolderName'] != 'Test User' &&
          ticketData['ticketHolderName'] != 'Unknown') {
        print(
            '✅ Found ticketHolderName: ${ticketData['ticketHolderName']}'); // Debug log
        return ticketData['ticketHolderName'];
      }

      if (ticketData['attendeeName'] != null &&
          ticketData['attendeeName'].toString().isNotEmpty) {
        print(
            '✅ Found attendeeName: ${ticketData['attendeeName']}'); // Debug log
        return ticketData['attendeeName'];
      }

      // Try to get name from user profile if userId is available
      // Check multiple possible userId fields
      final userId = ticketData['userId'] ??
          ticketData['purchasedBy'] ??
          ticketData['ownerId'] ??
          ticketData['buyerId'];

      if (userId != null && userId.toString().isNotEmpty) {
        print('🔍 Looking up user profile for userId: $userId'); // Debug log
        final userProfileName =
            await _getAttendeeNameFromUserProfile(userId.toString());
        if (userProfileName != null) {
          print('✅ Found user profile name: $userProfileName'); // Debug log
          return userProfileName;
        } else {
          print('❌ No user profile found for userId: $userId'); // Debug log
        }
      } else {
        print('❌ No userId found in ticket data'); // Debug log
      }

      // Extract name from email as fallback
      if (ticketData['ticketHolderEmail'] != null) {
        final email = ticketData['ticketHolderEmail'].toString();
        if (email.isNotEmpty && email.contains('@')) {
          final emailPrefix = email.split('@')[0];

          // Convert email prefix to readable name (e.g., john.doe -> John Doe)
          if (emailPrefix.contains('.')) {
            final parts = emailPrefix.split('.');
            final name = parts
                .map((part) => part.isNotEmpty
                    ? '${part[0].toUpperCase()}${part.substring(1)}'
                    : '')
                .join(' ');
            if (name.isNotEmpty) {
              print('✅ Generated name from email: $name'); // Debug log
              return name;
            }
          } else if (emailPrefix.isNotEmpty) {
            final name =
                '${emailPrefix[0].toUpperCase()}${emailPrefix.substring(1)}';
            print('✅ Generated name from email prefix: $name'); // Debug log
            return name;
          }
        }
      }

      // Better fallback: use "Guest" instead of ticket ID
      print('⚠️ Using fallback name: Guest Attendee'); // Debug log
      return 'Guest Attendee';
    }

    final resolvedName = await resolveAttendeeNameAsync(data);

    return AttendeeEntity(
      id: id,
      userId: data['userId'] ?? '',
      eventId: data['eventId'] ?? '',
      name: resolvedName,
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

  /// Fix existing tickets by populating proper attendee names from user profiles
  static Future<void> fixExistingTicketNames({String? eventId}) async {
    try {
      final firestore = FirebaseFirestore.instance;

      print('🔧 Starting to fix existing ticket names...');

      Query query = firestore.collection('tickets');

      // If eventId is provided, only fix tickets for that event
      if (eventId != null) {
        query = query.where('eventId', isEqualTo: eventId);
        print('🎯 Fixing tickets for event: $eventId');
      }

      final ticketsSnapshot = await query.get();
      print('📋 Found ${ticketsSnapshot.docs.length} tickets to process');

      int updatedCount = 0;

      for (final ticketDoc in ticketsSnapshot.docs) {
        final ticketData = ticketDoc.data() as Map<String, dynamic>;
        final ticketId = ticketDoc.id;

        // Skip if ticket already has a proper name
        final currentName = ticketData['ticketHolderName'];
        if (currentName != null &&
            currentName.toString().isNotEmpty &&
            currentName != 'Demo User' &&
            currentName != 'Test User' &&
            currentName != 'Unknown' &&
            !currentName.toString().startsWith('Attendee ')) {
          print('✅ Ticket $ticketId already has proper name: $currentName');
          continue;
        }

        print('🔍 Processing ticket: $ticketId');

        // Try to get name from user profile
        final userId = ticketData['userId'] ??
            ticketData['purchasedBy'] ??
            ticketData['ownerId'] ??
            ticketData['buyerId'];

        String? resolvedName;

        if (userId != null) {
          try {
            final userDoc = await firestore
                .collection('users')
                .doc(userId.toString())
                .get();
            if (userDoc.exists) {
              final userData = userDoc.data()!;

              // Try different name fields
              if (userData['displayName'] != null &&
                  userData['displayName'].toString().isNotEmpty) {
                resolvedName = userData['displayName'];
              } else if (userData['name'] != null &&
                  userData['name'].toString().isNotEmpty) {
                resolvedName = userData['name'];
              } else if (userData['firstName'] != null &&
                  userData['lastName'] != null) {
                resolvedName =
                    '${userData['firstName']} ${userData['lastName']}';
              }
            }
          } catch (e) {
            print('❌ Error fetching user $userId: $e');
          }
        }

        // Fallback to email-based name
        if (resolvedName == null && ticketData['ticketHolderEmail'] != null) {
          final email = ticketData['ticketHolderEmail'].toString();
          if (email.isNotEmpty && email.contains('@')) {
            final emailPrefix = email.split('@')[0];
            if (emailPrefix.contains('.')) {
              final parts = emailPrefix.split('.');
              resolvedName = parts
                  .map((part) => part.isNotEmpty
                      ? '${part[0].toUpperCase()}${part.substring(1)}'
                      : '')
                  .join(' ');
            } else if (emailPrefix.isNotEmpty) {
              resolvedName =
                  '${emailPrefix[0].toUpperCase()}${emailPrefix.substring(1)}';
            }
          }
        }

        // Update ticket if we found a name
        if (resolvedName != null && resolvedName.isNotEmpty) {
          await ticketDoc.reference.update({
            'ticketHolderName': resolvedName,
            'updatedAt': Timestamp.now(),
          });

          print('✅ Updated ticket $ticketId with name: $resolvedName');
          updatedCount++;
        } else {
          print('⚠️ Could not resolve name for ticket $ticketId');
        }
      }

      print(
          '🎉 Fixed $updatedCount out of ${ticketsSnapshot.docs.length} tickets');
    } catch (e) {
      print('❌ Error fixing ticket names: $e');
    }
  }

  /// Create sample attendees for testing with proper names
  static Future<void> createSampleAttendees(String eventId) async {
    try {
      final firestore = FirebaseFirestore.instance;

      final sampleAttendees = [
        {
          'ticketHolderName': 'Sarah Johnson',
          'ticketHolderEmail': 'sarah.johnson@example.com',
          'ticketHolderPhone': '+1234567890',
          'ticketTypeName': 'VIP Access',
        },
        {
          'ticketHolderName': 'Michael Chen',
          'ticketHolderEmail': 'michael.chen@example.com',
          'ticketHolderPhone': '+1234567891',
          'ticketTypeName': 'General Admission',
        },
        {
          'ticketHolderName': 'Emily Rodriguez',
          'ticketHolderEmail': 'emily.rodriguez@example.com',
          'ticketHolderPhone': '+1234567892',
          'ticketTypeName': 'Student Discount',
        },
        {
          'ticketHolderName': 'David Thompson',
          'ticketHolderEmail': 'david.thompson@example.com',
          'ticketHolderPhone': '+1234567893',
          'ticketTypeName': 'Early Bird',
        },
        {
          'ticketHolderName': 'Lisa Wang',
          'ticketHolderEmail': 'lisa.wang@example.com',
          'ticketHolderPhone': '+1234567894',
          'ticketTypeName': 'General Admission',
        },
      ];

      for (int i = 0; i < sampleAttendees.length; i++) {
        final attendee = sampleAttendees[i];
        final ticketId = 'sample_ticket_${eventId}_$i';

        final ticketData = {
          'id': ticketId,
          'eventId': eventId,
          'ticketHolderName': attendee['ticketHolderName'],
          'ticketHolderEmail': attendee['ticketHolderEmail'],
          'ticketHolderPhone': attendee['ticketHolderPhone'],
          'ticketTypeName': attendee['ticketTypeName'],
          'eventTitle': 'Tech Conference 2026',
          'eventLocation': 'Convention Center',
          'eventDateTime':
              Timestamp.fromDate(DateTime.parse('2026-04-15 10:00:00')),
          'price': 199.0,
          'currency': 'ETB',
          'status': 'active',
          'attendeeStatus':
              i < 2 ? 'checkedIn' : 'registered', // First 2 are checked in
          'qrCode':
              'TICKET_${ticketId}_EVENT_${eventId}_${DateTime.now().millisecondsSinceEpoch}',
          'createdAt': Timestamp.fromDate(
              DateTime.now().subtract(Duration(days: i + 1))),
          'updatedAt': Timestamp.fromDate(DateTime.now()),
        };

        // Add check-in data for checked-in attendees
        if (i < 2) {
          ticketData['checkInTime'] = Timestamp.fromDate(
              DateTime.now().subtract(Duration(hours: i + 1)));
          ticketData['checkInStaffId'] = 'staff123';
        }

        await firestore.collection('tickets').doc(ticketId).set(ticketData);
        print(
            '✅ Sample attendee created: ${attendee['ticketHolderName']} (ID: $ticketId)');
      }

      print('👥 All sample attendees created successfully for event: $eventId');
    } catch (e) {
      print('❌ Error creating sample attendees: $e');
    }
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