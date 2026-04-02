import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventhub/features/staff/ticket_scanner/infrastructure/datasources/firebase_ticket_scanner_data_source.dart';
import 'package:eventhub/features/staff/attendee_management/infrastructure/datasources/firebase_attendee_management_data_source.dart';

/// Debug helper to fix organizer names in existing events and create sample tickets
class DebugOrganizerHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Update all events to include organizer names
  static Future<void> updateEventOrganizerNames() async {
    try {
      log('🔄 Starting organizer name update for all events...');
      
      // Get all events
      final eventsQuery = await _firestore.collection('events').get();
      
      int updatedCount = 0;
      int totalCount = eventsQuery.docs.length;
      
      log('📊 Found $totalCount events to process');
      
      for (final eventDoc in eventsQuery.docs) {
        try {
          final eventData = eventDoc.data();
          final organizerId = eventData['organizerId'] as String?;
          
          if (organizerId == null) {
            log('⚠️ Event ${eventDoc.id} has no organizerId, skipping');
            continue;
          }
          
          // Check if organizer name already exists
          final existingOrganizerName = eventData['organizerName'] as String?;
          if (existingOrganizerName != null && existingOrganizerName != 'Unknown Organizer') {
            log('✅ Event ${eventDoc.id} already has organizer name: $existingOrganizerName');
            continue;
          }
          
          // Get organizer name from user profile
          final organizerName = await _getOrganizerName(organizerId);
          
          // Update the event document
          await eventDoc.reference.update({
            'organizerName': organizerName,
          });
          
          updatedCount++;
          log('✅ Updated event ${eventDoc.id} with organizer name: $organizerName');
          
        } catch (e) {
          log('❌ Error updating event ${eventDoc.id}: $e');
        }
      }
      
      log('🎉 Organizer name update completed!');
      log('📈 Updated $updatedCount out of $totalCount events');
      
    } catch (e) {
      log('❌ Error in updateEventOrganizerNames: $e');
    }
  }

  /// Get organizer name from user profile
  static Future<String> _getOrganizerName(String organizerId) async {
    try {
      final organizerDoc = await _firestore
          .collection('users')
          .doc(organizerId)
          .get();

      if (organizerDoc.exists) {
        final data = organizerDoc.data()!;
        
        // Check for name field first (from UserProfileEntity)
        final name = data['name'] as String?;
        if (name != null && name.isNotEmpty) {
          return name;
        }
        
        // Fallback to displayName if it exists
        final displayName = data['displayName'] as String?;
        if (displayName != null && displayName.isNotEmpty) {
          return displayName;
        }
        
        // If organizer has organizerData with organizationName, use that
        final organizerData = data['organizerData'] as Map<String, dynamic>?;
        if (organizerData != null) {
          final organizationName = organizerData['organizationName'] as String?;
          if (organizationName != null && organizationName.isNotEmpty) {
            return organizationName;
          }
        }
        
        log('⚠️ Organizer $organizerId exists but has no valid name fields');
        return 'Unknown Organizer';
      }
      
      log('⚠️ Organizer profile not found for ID: $organizerId');
      return 'Unknown Organizer';
    } catch (e) {
      log('❌ Error fetching organizer name for $organizerId: $e');
      return 'Unknown Organizer';
    }
  }

  /// Debug: List all organizers and their names
  static Future<void> listAllOrganizers() async {
    try {
      log('📋 Listing all organizers...');
      
      final usersQuery = await _firestore
          .collection('users')
          .where('role', isEqualTo: 'organizer')
          .get();
      
      log('👥 Found ${usersQuery.docs.length} organizers:');
      
      for (final userDoc in usersQuery.docs) {
        final data = userDoc.data();
        final name = data['name'] as String?;
        final email = data['email'] as String?;
        final organizerData = data['organizerData'] as Map<String, dynamic>?;
        final organizationName = organizerData?['organizationName'] as String?;
        
        log('👤 ID: ${userDoc.id}');
        log('   📧 Email: $email');
        log('   👤 Name: $name');
        log('   🏢 Organization: $organizationName');
        log('   ---');
      }
      
    } catch (e) {
      log('❌ Error listing organizers: $e');
    }
  }

  /// Debug: List events and their organizer info
  static Future<void> listEventsWithOrganizerInfo() async {
    try {
      log('📋 Listing events with organizer info...');
      
      final eventsQuery = await _firestore
          .collection('events')
          .limit(10) // Limit to first 10 for debugging
          .get();
      
      log('🎪 Found ${eventsQuery.docs.length} events:');
      
      for (final eventDoc in eventsQuery.docs) {
        final data = eventDoc.data();
        final title = data['title'] as String?;
        final organizerId = data['organizerId'] as String?;
        final organizerName = data['organizerName'] as String?;
        
        log('🎪 Event: $title');
        log('   🆔 ID: ${eventDoc.id}');
        log('   👤 Organizer ID: $organizerId');
        log('   👤 Organizer Name: $organizerName');
        log('   ---');
      }
      
    } catch (e) {
      log('❌ Error listing events: $e');
    }
  }
}

/// Quick function to fix organizer names from anywhere in your app
Future<void> fixOrganizerNames() async {
  await DebugOrganizerHelper.updateEventOrganizerNames();
}

/// Quick function to list organizers for debugging
Future<void> listOrganizers() async {
  await DebugOrganizerHelper.listAllOrganizers();
}

/// Quick function to update all events with organizer names
Future<void> updateEventOrganizerNames() async {
  await DebugOrganizerHelper.updateEventOrganizerNames();
}

/// Quick function to create test users with proper names
Future<void> createTestUsers() async {
  try {
    final firestore = FirebaseFirestore.instance;
    
    final testUsers = [
      {
        'id': 'user_sarah_johnson',
        'email': 'sarah.johnson@example.com',
        'displayName': 'Sarah Johnson',
        'name': 'Sarah Johnson',
        'firstName': 'Sarah',
        'lastName': 'Johnson',
        'role': 'attendee',
      },
      {
        'id': 'user_michael_chen',
        'email': 'michael.chen@example.com',
        'displayName': 'Michael Chen',
        'name': 'Michael Chen',
        'firstName': 'Michael',
        'lastName': 'Chen',
        'role': 'attendee',
      },
      {
        'id': 'user_emily_rodriguez',
        'email': 'emily.rodriguez@example.com',
        'displayName': 'Emily Rodriguez',
        'name': 'Emily Rodriguez',
        'firstName': 'Emily',
        'lastName': 'Rodriguez',
        'role': 'attendee',
      },
      {
        'id': 'user_david_thompson',
        'email': 'david.thompson@example.com',
        'displayName': 'David Thompson',
        'name': 'David Thompson',
        'firstName': 'David',
        'lastName': 'Thompson',
        'role': 'attendee',
      },
    ];
    
    for (final user in testUsers) {
      final userData = Map<String, dynamic>.from(user);
      userData.remove('id');
      userData['createdAt'] = Timestamp.now();
      userData['updatedAt'] = Timestamp.now();
      
      await firestore.collection('users').doc(user['id']!).set(userData);
      print('✅ Created test user: ${user['displayName']} (${user['id']})');
    }
    
    print('👥 All test users created successfully!');
  } catch (e) {
    print('❌ Error creating test users: $e');
  }
}

/// Quick function to create tickets linked to test users
Future<void> createTicketsWithUsers(String eventId) async {
  try {
    final firestore = FirebaseFirestore.instance;
    
    final ticketsWithUsers = [
      {
        'ticketId': 'ticket_with_user_1',
        'userId': 'user_sarah_johnson',
        'ticketHolderName': 'Sarah Johnson',
        'ticketHolderEmail': 'sarah.johnson@example.com',
        'ticketTypeName': 'VIP Access',
      },
      {
        'ticketId': 'ticket_with_user_2',
        'userId': 'user_michael_chen',
        'ticketHolderName': 'Michael Chen',
        'ticketHolderEmail': 'michael.chen@example.com',
        'ticketTypeName': 'General Admission',
      },
      {
        'ticketId': 'ticket_with_user_3',
        'userId': 'user_emily_rodriguez',
        'ticketHolderName': 'Emily Rodriguez',
        'ticketHolderEmail': 'emily.rodriguez@example.com',
        'ticketTypeName': 'Student Discount',
      },
      {
        'ticketId': 'ticket_with_user_4',
        'userId': 'user_david_thompson',
        'ticketHolderName': 'David Thompson',
        'ticketHolderEmail': 'david.thompson@example.com',
        'ticketTypeName': 'Early Bird',
      },
    ];
    
    for (final ticket in ticketsWithUsers) {
      final ticketData = {
        'id': ticket['ticketId'],
        'eventId': eventId,
        'userId': ticket['userId'],
        'ticketHolderName': ticket['ticketHolderName'],
        'ticketHolderEmail': ticket['ticketHolderEmail'],
        'ticketHolderPhone': '+1234567890',
        'ticketTypeName': ticket['ticketTypeName'],
        'eventTitle': 'Tech Conference 2026',
        'eventLocation': 'Convention Center',
        'eventDateTime': Timestamp.fromDate(DateTime.parse('2026-04-15 10:00:00')),
        'price': 199.0,
        'currency': 'USD',
        'status': 'active',
        'attendeeStatus': 'registered',
        'qrCode': 'TICKET_${ticket['ticketId']}_EVENT_${eventId}_${DateTime.now().millisecondsSinceEpoch}',
        'createdAt': Timestamp.fromDate(DateTime.now()),
        'updatedAt': Timestamp.fromDate(DateTime.now()),
      };

      await firestore.collection('tickets').doc(ticket['ticketId']!).set(ticketData);
      print('✅ Created ticket for ${ticket['ticketHolderName']} (${ticket['ticketId']})');
    }
    
    print('🎫 All tickets with users created successfully!');
  } catch (e) {
    print('❌ Error creating tickets with users: $e');
  }
}

/// Quick function to fix existing ticket names by looking up user profiles
Future<void> fixExistingTicketNames({String? eventId}) async {
  await FirebaseAttendeeManagementDataSource.fixExistingTicketNames(eventId: eventId);
}

/// Quick function to create sample attendees for testing
Future<void> createSampleAttendees(String eventId) async {
  await FirebaseAttendeeManagementDataSource.createSampleAttendees(eventId);
}

/// Quick function to create sample tickets for testing scanner
Future<void> createSampleTickets() async {
  await FirebaseTicketScannerDataSource.createSampleTickets();
}

/// Quick function to create the specific ticket from QR code
Future<void> createSpecificTicket() async {
  await FirebaseTicketScannerDataSource.createSpecificTicket();
}

/// Quick function to test organizer name fetching
Future<void> testOrganizerNames() async {
  final firestore = FirebaseFirestore.instance;
  
  try {
    print('🔍 Testing organizer name fetching...');
    
    // Get a few events to test
    final eventsQuery = await firestore
        .collection('events')
        .limit(3)
        .get();
    
    for (final eventDoc in eventsQuery.docs) {
      final data = eventDoc.data();
      final organizerId = data['organizerId'] as String?;
      final eventTitle = data['title'] as String?;
      
      if (organizerId != null) {
        // Test organizer lookup
        final organizerDoc = await firestore
            .collection('users')
            .doc(organizerId)
            .get();
        
        print('📋 Event: $eventTitle');
        print('   👤 Organizer ID: $organizerId');
        
        if (organizerDoc.exists) {
          final organizerData = organizerDoc.data()!;
          final name = organizerData['name'] as String?;
          final organizerDataMap = organizerData['organizerData'] as Map<String, dynamic>?;
          final organizationName = organizerDataMap?['organizationName'] as String?;
          
          print('   ✅ Organizer exists');
          print('   👤 Name: $name');
          print('   🏢 Organization: $organizationName');
        } else {
          print('   ❌ Organizer not found');
        }
        print('   ---');
      }
    }
  } catch (e) {
    print('❌ Error testing organizer names: $e');
  }
}