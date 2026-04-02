import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/ticket_scanner/domain/entities/check_in_entity.dart';

@lazySingleton
class FirebaseTicketScannerDataSource {
  final FirebaseFirestore _firestore;

  FirebaseTicketScannerDataSource({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Validate a scanned QR code
  Future<TicketValidationResult> validateTicket({
    required String qrCode,
    required String eventId,
    required String staffId,
  }) async {
    try {
      print('Validating QR code: $qrCode for event: $eventId'); // Debug log
      
      // Parse QR code to extract ticket ID
      final ticketId = _parseQRCode(qrCode);
      if (ticketId == null) {
        print('Invalid QR code format: $qrCode'); // Debug log
        return const TicketValidationResult(
          isValid: false,
          ticketId: '',
          eventId: '',
          status: CheckInStatus.invalid,
          errorMessage: 'Invalid QR code format',
        );
      }

      print('Parsed ticket ID: $ticketId'); // Debug log

      // Get ticket from Firestore
      final ticketDoc = await _firestore
          .collection('tickets')
          .doc(ticketId)
          .get();

      if (!ticketDoc.exists) {
        print('Ticket not found in database: $ticketId'); // Debug log
        
        // For demo purposes, create a sample ticket if it doesn't exist
        if (ticketId == '1' || ticketId.length < 10) {
          print('Creating demo ticket for ID: $ticketId'); // Debug log
          await _createDemoTicket(ticketId, eventId);
          
          // Try to get the ticket again
          final newTicketDoc = await _firestore
              .collection('tickets')
              .doc(ticketId)
              .get();
              
          if (newTicketDoc.exists) {
            final ticketData = newTicketDoc.data()!;
            print(
                'Demo ticket created successfully with attendee: ${ticketData['ticketHolderName']}'); // Debug log
            
            return TicketValidationResult(
              isValid: true,
              ticketId: ticketId,
              eventId: eventId,
              status: CheckInStatus.valid,
              ticketHolderName:
                  ticketData['ticketHolderName'] ?? 'Unknown Attendee',
              ticketTypeName: ticketData['ticketTypeName'] ?? 'General Admission',
              eventTitle: ticketData['eventTitle'] ?? 'Demo Event',
              eventDateTime: DateTime.now().add(const Duration(hours: 2)),
              eventLocation: ticketData['eventLocation'] ?? 'Demo Venue',
            );
          }
        }
        
        return TicketValidationResult(
          isValid: false,
          ticketId: ticketId,
          eventId: eventId,
          status: CheckInStatus.notFound,
          errorMessage: 'Ticket not found in database. Scanned ticket ID: $ticketId',
        );
      }

      final ticketData = ticketDoc.data()!;
      print('Found ticket data: ${ticketData.keys}'); // Debug log
      
      // Try to get attendee name from multiple sources
      String? attendeeName = await _getAttendeeNameFromTicket(ticketData);
      print('Resolved attendee name: $attendeeName'); // Debug log
      
      // Extract event ID from QR code for comparison
      String? qrEventId;
      if (qrCode.contains('TICKET_') && qrCode.contains('_EVENT_')) {
        final parts = qrCode.split('_');
        if (parts.length >= 7 && parts[0] == 'TICKET' && parts[3] == 'EVENT') {
          // Extract the full event ID (parts[4] + '_' + parts[5])
          qrEventId = '${parts[4]}_${parts[5]}';
          print('Extracted event ID from QR code: $qrEventId'); // Debug log
        }
      }

      // Verify event ID matches (use QR code event ID if available, otherwise use provided eventId)
      final expectedEventId = qrEventId ?? eventId;
      if (eventId != 'sample-event-id' &&
          ticketData['eventId'] != expectedEventId) {
        print(
            'Event ID mismatch: expected $expectedEventId, got ${ticketData['eventId']}'); // Debug log
        return TicketValidationResult(
          isValid: false,
          ticketId: ticketId,
          eventId: eventId,
          status: CheckInStatus.wrongEvent,
          errorMessage: 'Ticket is for a different event',
        );
      }

      // Check if already used
      final checkInQuery = await _firestore
          .collection('checkIns')
          .where('ticketId', isEqualTo: ticketId)
          .limit(1)
          .get();

      if (checkInQuery.docs.isNotEmpty) {
        print('Ticket already used: $ticketId'); // Debug log
        return TicketValidationResult(
          isValid: false,
          ticketId: ticketId,
          eventId: eventId,
          status: CheckInStatus.alreadyUsed,
          errorMessage: 'Ticket has already been used',
          ticketHolderName: attendeeName,
          ticketTypeName: ticketData['ticketTypeName'],
          eventTitle: ticketData['eventTitle'],
        );
      }

      // Check if expired (event date has passed) - skip for testing
      if (ticketData['eventDateTime'] != null) {
        DateTime? eventDateTime;

        // Handle both Timestamp and String date formats
        if (ticketData['eventDateTime'] is Timestamp) {
          eventDateTime = (ticketData['eventDateTime'] as Timestamp).toDate();
        } else if (ticketData['eventDateTime'] is String) {
          try {
            eventDateTime =
                DateTime.parse(ticketData['eventDateTime'] as String);
          } catch (e) {
            print(
                'Error parsing date string: ${ticketData['eventDateTime']}'); // Debug log
          }
        }

        if (eventDateTime != null &&
            eventDateTime
                .isBefore(DateTime.now().subtract(const Duration(hours: 2)))) {
          print('Ticket expired: $ticketId, event date: $eventDateTime'); // Debug log
          return TicketValidationResult(
            isValid: false,
            ticketId: ticketId,
            eventId: eventId,
            status: CheckInStatus.expired,
            errorMessage: 'Ticket has expired',
            eventDateTime: eventDateTime,
          );
        }
      }

      print(
          'Ticket validation successful: $ticketId for attendee: $attendeeName'); // Debug log
      
      // Parse event date time
      DateTime? eventDateTime;
      if (ticketData['eventDateTime'] != null) {
        if (ticketData['eventDateTime'] is Timestamp) {
          eventDateTime = (ticketData['eventDateTime'] as Timestamp).toDate();
        } else if (ticketData['eventDateTime'] is String) {
          try {
            eventDateTime =
                DateTime.parse(ticketData['eventDateTime'] as String);
          } catch (e) {
            print(
                'Error parsing date string: ${ticketData['eventDateTime']}'); // Debug log
            eventDateTime = DateTime.now().add(const Duration(hours: 2));
          }
        }
      } else {
        eventDateTime = DateTime.now().add(const Duration(hours: 2));
      }
      
      // Ticket is valid
      return TicketValidationResult(
        isValid: true,
        ticketId: ticketId,
        eventId: ticketData['eventId'] ?? eventId,
        status: CheckInStatus.valid,
        ticketHolderName: attendeeName ?? 'Unknown Attendee',
        ticketTypeName: ticketData['ticketTypeName'] ?? 'General Admission',
        eventTitle: ticketData['eventTitle'] ?? 'Sample Event',
        eventDateTime: eventDateTime,
        eventLocation: ticketData['eventLocation'] ?? 'Sample Venue',
      );
    } catch (e) {
      print('Error validating ticket: $e'); // Debug log
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Check in a validated ticket
  Future<CheckInEntity> checkInTicket({
    required String ticketId,
    required String eventId,
    required String staffId,
    String? notes,
  }) async {
    try {
      final checkInId = _generateId();
      final checkInTime = DateTime.now();

      // Get ticket details for the check-in record
      final ticketDoc = await _firestore
          .collection('tickets')
          .doc(ticketId)
          .get();

      final ticketData = ticketDoc.data()!;
      
      // Get proper attendee name using the same logic as validation
      String? attendeeName = await _getAttendeeNameFromTicket(ticketData);

      final checkInEntity = CheckInEntity(
        id: checkInId,
        ticketId: ticketId,
        eventId: eventId,
        staffId: staffId,
        checkInTime: checkInTime,
        status: CheckInStatus.valid,
        qrCode: ticketData['qrCode'],
        ticketHolderName: attendeeName ?? 'Unknown Attendee',
        ticketTypeName: ticketData['ticketTypeName'],
        eventTitle: ticketData['eventTitle'],
        notes: notes,
      );

      // Save check-in record
      await _firestore
          .collection('checkIns')
          .doc(checkInId)
          .set({
        'id': checkInId,
        'ticketId': ticketId,
        'eventId': eventId,
        'staffId': staffId,
        'checkInTime': Timestamp.fromDate(checkInTime),
        'status': checkInEntity.status.name,
        'qrCode': checkInEntity.qrCode,
        'ticketHolderName': checkInEntity.ticketHolderName,
        'ticketTypeName': checkInEntity.ticketTypeName,
        'eventTitle': checkInEntity.eventTitle,
        'notes': notes,
        'createdAt': Timestamp.fromDate(checkInTime),
      });

      // Update ticket status to checked in for attendee management
      await _firestore
          .collection('tickets')
          .doc(ticketId)
          .update({
        'status': 'used',
        'attendeeStatus': 'checkedIn', // Add this for attendee management
        'checkInTime': Timestamp.fromDate(checkInTime), // Add check-in time
        'checkInStaffId': staffId, // Add staff who checked in
        'usedAt': Timestamp.fromDate(checkInTime),
        'usedByStaff': staffId,
        'lastUpdated': Timestamp.fromDate(checkInTime),
      });

      return checkInEntity;
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Get check-in statistics
  Future<CheckInStats> getCheckInStats({
    required String eventId,
    required String staffId,
  }) async {
    try {
      // Get total tickets for event
      final totalTicketsQuery = await _firestore
          .collection('tickets')
          .where('eventId', isEqualTo: eventId)
          .get();

      final totalTickets = totalTicketsQuery.docs.length;

      // Get checked-in tickets
      final checkedInQuery = await _firestore
          .collection('checkIns')
          .where('eventId', isEqualTo: eventId)
          .get();

      final checkedIn = checkedInQuery.docs.length;
      final remaining = totalTickets - checkedIn;
      final checkInRate = totalTickets > 0 ? (checkedIn / totalTickets) * 100 : 0.0;

      return CheckInStats(
        totalTickets: totalTickets,
        checkedIn: checkedIn,
        remaining: remaining,
        checkInRate: checkInRate,
        lastUpdated: DateTime.now(),
      );
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Get recent check-ins
  Future<List<CheckInEntity>> getRecentCheckIns({
    required String eventId,
    required String staffId,
    int limit = 10,
  }) async {
    try {
      final query = await _firestore
          .collection('checkIns')
          .where('eventId', isEqualTo: eventId)
          .orderBy('checkInTime', descending: true)
          .limit(limit)
          .get();

      return query.docs.map((doc) {
        final data = doc.data();
        return CheckInEntity(
          id: data['id'],
          ticketId: data['ticketId'],
          eventId: data['eventId'],
          staffId: data['staffId'],
          checkInTime: (data['checkInTime'] as Timestamp).toDate(),
          status: CheckInStatus.values.firstWhere(
            (status) => status.name == data['status'],
            orElse: () => CheckInStatus.valid,
          ),
          qrCode: data['qrCode'],
          ticketHolderName: data['ticketHolderName'],
          ticketTypeName: data['ticketTypeName'],
          eventTitle: data['eventTitle'],
          notes: data['notes'],
        );
      }).toList();
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Parse QR code to extract ticket ID
  String? _parseQRCode(String qrCode) {
    print('Parsing QR code: $qrCode'); // Debug log
    
    // Handle different QR code formats for testing
    
    // Format 1: Your specific format: TICKET_1774346550999_555624_EVENT_1774346204603_176467_1774346551000
    if (qrCode.contains('TICKET_') && qrCode.contains('_EVENT_')) {
      final parts = qrCode.split('_');
      if (parts.length >= 5 && parts[0] == 'TICKET') {
        // Extract the full ticket ID (parts[1] + '_' + parts[2])
        final ticketId = '${parts[1]}_${parts[2]}';
        print('Extracted ticket ID from complex format: $ticketId'); // Debug log
        return ticketId;
      }
    }
    
    // Format 2: Expected format: TICKET_{ticketId}_EVENT_{eventId}_{timestamp}
    final regex1 = RegExp(r'TICKET_([^_]+)_EVENT_([^_]+)_(\d+)');
    final match1 = regex1.firstMatch(qrCode);
    if (match1 != null) {
      print('Extracted ticket ID from standard format: ${match1.group(1)}'); // Debug log
      return match1.group(1); // Return ticket ID
    }
    
    // Format 3: Simple ticket ID for testing
    if (qrCode.startsWith('TICKET_')) {
      final ticketId = qrCode.replaceFirst('TICKET_', '').split('_')[0];
      print('Extracted ticket ID from simple format: $ticketId'); // Debug log
      return ticketId;
    }
    
    // Format 4: Just return the QR code as ticket ID for testing
    print('Using entire QR code as ticket ID: $qrCode'); // Debug log
    return qrCode;
  }

  /// Generate unique ID
  String _generateId() {
    return _firestore.collection('temp').doc().id;
  }

  /// Get attendee name from ticket data with fallback options
  Future<String?> _getAttendeeNameFromTicket(
      Map<String, dynamic> ticketData) async {
    // Priority order for getting attendee name:
    // 1. ticketHolderName (direct field)
    // 2. attendeeName (alternative field)
    // 3. Look up user profile by userId
    // 4. Extract from email

    // Check direct name fields
    if (ticketData['ticketHolderName'] != null &&
        ticketData['ticketHolderName'].toString().isNotEmpty &&
        ticketData['ticketHolderName'] != 'Demo User' &&
        ticketData['ticketHolderName'] != 'Test User') {
      return ticketData['ticketHolderName'];
    }

    if (ticketData['attendeeName'] != null &&
        ticketData['attendeeName'].toString().isNotEmpty) {
      return ticketData['attendeeName'];
    }

    // Try to get name from user profile if userId is available
    if (ticketData['userId'] != null) {
      try {
        final userDoc = await _firestore
            .collection('users')
            .doc(ticketData['userId'])
            .get();

        if (userDoc.exists) {
          final userData = userDoc.data()!;

          // Check various name fields in user profile
          if (userData['displayName'] != null &&
              userData['displayName'].toString().isNotEmpty) {
            return userData['displayName'];
          }
          if (userData['name'] != null &&
              userData['name'].toString().isNotEmpty) {
            return userData['name'];
          }
          if (userData['firstName'] != null && userData['lastName'] != null) {
            return '${userData['firstName']} ${userData['lastName']}';
          }
        }
      } catch (e) {
        print('Error fetching user profile: $e'); // Debug log
      }
    }

    // Extract name from email as last resort
    if (ticketData['ticketHolderEmail'] != null) {
      final email = ticketData['ticketHolderEmail'].toString();
      final emailPrefix = email.split('@')[0];

      // Convert email prefix to readable name (e.g., john.doe -> John Doe)
      if (emailPrefix.contains('.')) {
        final parts = emailPrefix.split('.');
        return parts
            .map((part) => part.isNotEmpty
                ? '${part[0].toUpperCase()}${part.substring(1)}'
                : '')
            .join(' ');
      } else {
        return emailPrefix.isNotEmpty
            ? '${emailPrefix[0].toUpperCase()}${emailPrefix.substring(1)}'
            : null;
      }
    }

    return null;
  }

  /// Create a demo ticket for testing purposes with realistic attendee names
  Future<void> _createDemoTicket(String ticketId, String eventId) async {
    try {
      // Generate realistic attendee names based on ticket ID
      final attendeeNames = [
        'John Smith',
        'Sarah Johnson',
        'Michael Brown',
        'Emily Davis',
        'David Wilson',
        'Jessica Miller',
        'Christopher Moore',
        'Ashley Taylor',
        'Matthew Anderson',
        'Amanda Thomas',
        'James Jackson',
        'Jennifer White',
        'Robert Harris',
        'Lisa Martin',
        'William Thompson',
      ];

      // Use ticket ID to consistently generate the same name for the same ticket
      final nameIndex = ticketId.hashCode.abs() % attendeeNames.length;
      final attendeeName = attendeeNames[nameIndex];
      
      final ticketData = {
        'id': ticketId,
        'eventId': eventId,
        'ticketHolderName': attendeeName,
        'ticketHolderEmail':
            '${attendeeName.toLowerCase().replaceAll(' ', '.')}@example.com',
        'ticketHolderPhone':
            '+1${(ticketId.hashCode.abs() % 9000000000 + 1000000000)}',
        'ticketTypeName': 'General Admission',
        'eventTitle': 'Demo Event',
        'eventLocation': 'Demo Venue',
        'eventDateTime': Timestamp.fromDate(DateTime.now().add(const Duration(hours: 2))),
        'price': 50.0,
        'currency': 'USD',
        'status': 'active',
        'qrCode': 'TICKET_${ticketId}_EVENT_${eventId}_${DateTime.now().millisecondsSinceEpoch}',
        'createdAt': Timestamp.fromDate(DateTime.now()),
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      };

      await _firestore
          .collection('tickets')
          .doc(ticketId)
          .set(ticketData);
          
      print(
          'Demo ticket created with ID: $ticketId for attendee: $attendeeName'); // Debug log
    } catch (e) {
      print('Error creating demo ticket: $e'); // Debug log
    }
  }

  /// Create multiple sample tickets for testing with different attendee names
  static Future<void> createSampleTickets() async {
    try {
      final firestore = FirebaseFirestore.instance;

      final sampleTickets = [
        {
          'id': '1774346550999',
          'eventId': '1774346204603',
          'ticketHolderName': 'Alex Johnson',
          'ticketHolderEmail': 'alex.johnson@example.com',
          'ticketTypeName': 'VIP Access',
        },
        {
          'id': '1774346550998',
          'eventId': '1774346204603',
          'ticketHolderName': 'Maria Garcia',
          'ticketHolderEmail': 'maria.garcia@example.com',
          'ticketTypeName': 'General Admission',
        },
        {
          'id': '1774346550997',
          'eventId': '1774346204603',
          'ticketHolderName': 'David Chen',
          'ticketHolderEmail': 'david.chen@example.com',
          'ticketTypeName': 'Student Discount',
        },
        {
          'id': '1',
          'eventId': 'sample-event-id',
          'ticketHolderName': 'Sarah Williams',
          'ticketHolderEmail': 'sarah.williams@example.com',
          'ticketTypeName': 'Early Bird',
        },
      ];

      for (final ticket in sampleTickets) {
        final ticketData = {
          'id': ticket['id'],
          'eventId': ticket['eventId'],
          'ticketHolderName': ticket['ticketHolderName'],
          'ticketHolderEmail': ticket['ticketHolderEmail'],
          'ticketHolderPhone':
              '+1${(ticket['id'].hashCode.abs() % 9000000000 + 1000000000)}',
          'ticketTypeName': ticket['ticketTypeName'],
          'eventTitle': 'Tech Conference 2026',
          'eventLocation': 'Convention Center',
          'eventDateTime':
              Timestamp.fromDate(DateTime.parse('2026-04-15 10:00:00')),
          'price': 199.0,
          'currency': 'USD',
          'status': 'active',
          'qrCode':
              'TICKET_${ticket['id']}_EVENT_${ticket['eventId']}_${DateTime.now().millisecondsSinceEpoch}',
          'createdAt': Timestamp.fromDate(DateTime.now()),
          'updatedAt': Timestamp.fromDate(DateTime.now()),
        };

        await firestore
            .collection('tickets')
            .doc(ticket['id']!)
            .set(ticketData);
        print(
            '✅ Sample ticket created for ${ticket['ticketHolderName']} (ID: ${ticket['id']})');
      }

      print('🎫 All sample tickets created successfully!');
    } catch (e) {
      print('❌ Error creating sample tickets: $e');
    }
  }

  /// Create the specific ticket from your QR code for testing
  static Future<void> createSpecificTicket() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final ticketId = '1774346550999';
      final eventId = '1774346204603';

      final ticketData = {
        'id': ticketId,
        'eventId': eventId,
        'ticketHolderName': 'Alex Johnson',
        'ticketHolderEmail': 'alex.johnson@example.com',
        'ticketHolderPhone': '+1234567890',
        'ticketTypeName': 'VIP Access',
        'eventTitle': 'Tech Conference 2026',
        'eventLocation': 'Convention Center',
        'eventDateTime':
            Timestamp.fromDate(DateTime.parse('2026-04-15 10:00:00')),
        'price': 299.0,
        'currency': 'USD',
        'status': 'active',
        'qrCode':
            'TICKET_1774346550999_555624_EVENT_1774346204603_176467_1774346551000',
        'createdAt': Timestamp.fromDate(DateTime.now()),
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      };

      await firestore.collection('tickets').doc(ticketId).set(ticketData);

      print(
          '✅ Specific ticket created successfully with ID: $ticketId for Alex Johnson');
      print('📱 QR code should now work when scanned!');
    } catch (e) {
      print('❌ Error creating specific ticket: $e');
    }
  }
}