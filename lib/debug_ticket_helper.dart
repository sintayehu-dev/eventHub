import 'package:cloud_firestore/cloud_firestore.dart';

/// Debug helper to create test tickets in Firebase
class DebugTicketHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Create a test ticket with ID "1" for the QR code you scanned
  static Future<void> createTestTicket() async {
    try {
      final ticketData = {
        'id': '1',
        'eventId': 'sample-event-id',
        'ticketHolderName': 'John Doe',
        'ticketHolderEmail': 'john.doe@example.com',
        'ticketHolderPhone': '+1234567890',
        'ticketTypeName': 'VIP',
        'eventTitle': 'Sample Event',
        'eventLocation': 'Sample Venue',
        'eventDateTime': Timestamp.fromDate(DateTime.now().add(const Duration(hours: 2))),
        'price': 100.0,
        'currency': 'USD',
        'status': 'active',
        'qrCode': 'TICKET_1_7238C0036924_*35562_EVENT_*_7734*022_AKAALT7AH7C_LT73BAC036924',
        'createdAt': Timestamp.fromDate(DateTime.now()),
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      };

      await _firestore
          .collection('tickets')
          .doc('1')
          .set(ticketData);
          
      print('✅ Test ticket created successfully with ID: 1');
      print('📱 You can now scan the QR code and it should work!');
    } catch (e) {
      print('❌ Error creating test ticket: $e');
    }
  }

  /// Create multiple test tickets
  static Future<void> createMultipleTestTickets() async {
    final tickets = [
      {
        'id': '1',
        'name': 'John Doe',
        'email': 'john.doe@example.com',
        'type': 'VIP',
      },
      {
        'id': '2', 
        'name': 'Jane Smith',
        'email': 'jane.smith@example.com',
        'type': 'General',
      },
      {
        'id': '3',
        'name': 'Bob Johnson', 
        'email': 'bob.johnson@example.com',
        'type': 'Premium',
      },
    ];

    for (final ticket in tickets) {
      try {
        final ticketData = {
          'id': ticket['id'],
          'eventId': 'sample-event-id',
          'ticketHolderName': ticket['name'],
          'ticketHolderEmail': ticket['email'],
          'ticketHolderPhone': '+1234567890',
          'ticketTypeName': ticket['type'],
          'eventTitle': 'Sample Event',
          'eventLocation': 'Sample Venue',
          'eventDateTime': Timestamp.fromDate(DateTime.now().add(const Duration(hours: 2))),
          'price': ticket['type'] == 'VIP' ? 100.0 : (ticket['type'] == 'Premium' ? 75.0 : 50.0),
          'currency': 'USD',
          'status': 'active',
          'qrCode': 'TICKET_${ticket['id']}_EVENT_sample-event-id_${DateTime.now().millisecondsSinceEpoch}',
          'createdAt': Timestamp.fromDate(DateTime.now()),
          'updatedAt': Timestamp.fromDate(DateTime.now()),
        };

        await _firestore
            .collection('tickets')
            .doc(ticket['id']!)
            .set(ticketData);
            
        print('✅ Created ticket ${ticket['id']} for ${ticket['name']}');
      } catch (e) {
        print('❌ Error creating ticket ${ticket['id']}: $e');
      }
    }
  }

  /// Check if ticket exists
  static Future<void> checkTicket(String ticketId) async {
    try {
      final doc = await _firestore
          .collection('tickets')
          .doc(ticketId)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        print('✅ Ticket $ticketId exists:');
        print('   Name: ${data['ticketHolderName']}');
        print('   Type: ${data['ticketTypeName']}');
        print('   Event: ${data['eventTitle']}');
      } else {
        print('❌ Ticket $ticketId does not exist');
      }
    } catch (e) {
      print('❌ Error checking ticket: $e');
    }
  }
}

/// Quick function to call from anywhere in your app for testing
Future<void> createTestTicketForQR() async {
  await DebugTicketHelper.createTestTicket();
}