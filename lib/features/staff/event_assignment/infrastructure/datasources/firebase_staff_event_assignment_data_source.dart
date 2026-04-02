import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';

@lazySingleton
class FirebaseStaffEventAssignmentDataSource {
  final FirebaseFirestore _firestore;

  FirebaseStaffEventAssignmentDataSource({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Get all events assigned to a staff member
  Future<List<StaffEventAssignmentEntity>> getStaffAssignedEvents({
    required String staffId,
  }) async {
    try {
      final query = await _firestore
          .collection('staff_event_assignments')
          .where('staffId', isEqualTo: staffId)
          .where('isActive', isEqualTo: true)
          .get();

      final assignments = <StaffEventAssignmentEntity>[];
      
      for (final doc in query.docs) {
        final data = doc.data();
        
        // Get event details from events collection
        final eventDoc = await _firestore
            .collection('events')
            .doc(data['eventId'])
            .get();
            
        if (eventDoc.exists) {
          final eventData = eventDoc.data()!;
          assignments.add(_mapFirestoreToAssignment(doc.id, data, eventData));
        }
      }

      // If no assignments found in Firestore, create a test assignment
      if (assignments.isEmpty) {
        // Check if there are any events in the system
        final eventsQuery = await _firestore
            .collection('events')
            .where('status', isEqualTo: 'active')
            .limit(1)
            .get();

        if (eventsQuery.docs.isNotEmpty) {
          final eventDoc = eventsQuery.docs.first;
          final eventData = eventDoc.data();

          // Create a test assignment for this staff member
          final testAssignment = StaffEventAssignmentEntity(
            id: 'test_assignment_${staffId}_${eventDoc.id}',
            staffId: staffId,
            eventId: eventDoc.id,
            eventTitle: eventData['title'] ?? 'Test Event',
            eventLocation: eventData['location'] ?? 'Test Location',
            eventDateTime: _parseDateTime(eventData['dateTime']) ??
                DateTime.now().add(const Duration(days: 1)),
            role: StaffRole.scanner,
            permissions: [
              StaffPermission.scan,
              StaffPermission.viewAttendees,
              StaffPermission.manualCheckIn,
            ],
            assignedBy: 'system',
            assignedAt: DateTime.now(),
            isActive: true,
          );

          assignments.add(testAssignment);
        } else {
          // No events in system, create a completely test event assignment
          assignments.add(StaffEventAssignmentEntity(
            id: 'test_assignment_${staffId}_default',
            staffId: staffId,
            eventId: 'test_event_001',
            eventTitle: 'Sample Event',
            eventLocation: 'Sample Venue',
            eventDateTime: DateTime.now().add(const Duration(days: 1)),
            role: StaffRole.scanner,
            permissions: [
              StaffPermission.scan,
              StaffPermission.viewAttendees,
              StaffPermission.manualCheckIn,
            ],
            assignedBy: 'system',
            assignedAt: DateTime.now(),
            isActive: true,
          ));
        }
      }

      // Sort by event date time client-side
      assignments.sort((a, b) => a.eventDateTime.compareTo(b.eventDateTime));

      return assignments;
    } catch (e) {
      // Fallback to hardcoded data if Firestore query fails
      return [
        StaffEventAssignmentEntity(
          id: 'fallback_assignment_${staffId}',
          staffId: staffId,
          eventId: 'fallback_event_001',
          eventTitle: 'Fallback Event',
          eventLocation: 'Fallback Location',
          eventDateTime: DateTime.now().add(const Duration(days: 1)),
          role: StaffRole.scanner,
          permissions: [
            StaffPermission.scan,
            StaffPermission.viewAttendees,
            StaffPermission.manualCheckIn,
          ],
          assignedBy: 'system',
          assignedAt: DateTime.now(),
          isActive: true,
        ),
      ];
    }
  }

  /// Check if staff has access to a specific event
  Future<bool> checkStaffEventAccess({
    required String staffId,
    required String eventId,
  }) async {
    try {
      // Check if there's an active assignment for this staff and event
      final query = await _firestore
          .collection('staff_event_assignments')
          .where('staffId', isEqualTo: staffId)
          .where('eventId', isEqualTo: eventId)
          .where('isActive', isEqualTo: true)
          .get();

      if (query.docs.isNotEmpty) {
        return true;
      }

      // For development, allow access to test events
      if (eventId.startsWith('test_') || eventId.startsWith('fallback_')) {
        return true;
      }

      // Check if the event exists and allow access for development
      final eventDoc = await _firestore.collection('events').doc(eventId).get();
      return eventDoc.exists;
    } catch (e) {
      // For development, allow access by default
      return true;
    }
  }

  /// Get staff permissions for a specific event
  Future<List<StaffPermission>> getStaffEventPermissions({
    required String staffId,
    required String eventId,
  }) async {
    try {
      // Check for existing assignment
      final query = await _firestore
          .collection('staff_event_assignments')
          .where('staffId', isEqualTo: staffId)
          .where('eventId', isEqualTo: eventId)
          .where('isActive', isEqualTo: true)
          .get();

      if (query.docs.isNotEmpty) {
        final data = query.docs.first.data();
        return (data['permissions'] as List<dynamic>?)
                ?.map((p) => _mapStringToPermission(p.toString()))
                .where((p) => p != null)
                .cast<StaffPermission>()
                .toList() ??
            _getDefaultPermissions();
      }

      // Return default permissions for development
      return _getDefaultPermissions();
    } catch (e) {
      return _getDefaultPermissions();
    }
  }

  List<StaffPermission> _getDefaultPermissions() {
    return [
      StaffPermission.scan,
      StaffPermission.viewAttendees,
      StaffPermission.manualCheckIn,
    ];
  }

  /// Get staff assignment details for a specific event
  Future<StaffEventAssignmentEntity?> getStaffEventAssignment({
    required String staffId,
    required String eventId,
  }) async {
    try {
      // Check for existing assignment
      final query = await _firestore
          .collection('staff_event_assignments')
          .where('staffId', isEqualTo: staffId)
          .where('eventId', isEqualTo: eventId)
          .where('isActive', isEqualTo: true)
          .get();

      if (query.docs.isNotEmpty) {
        final doc = query.docs.first;
        final data = doc.data();

        // Get event details
        final eventDoc =
            await _firestore.collection('events').doc(eventId).get();
        if (eventDoc.exists) {
          final eventData = eventDoc.data()!;
          return _mapFirestoreToAssignment(doc.id, data, eventData);
        }
      }

      // For development, create a dynamic assignment
      return StaffEventAssignmentEntity(
        id: 'dynamic_assignment_${staffId}_$eventId',
        staffId: staffId,
        eventId: eventId,
        eventTitle: 'Dynamic Event',
        eventLocation: 'Dynamic Location',
        eventDateTime: DateTime.now().add(const Duration(days: 1)),
        role: StaffRole.scanner,
        permissions: _getDefaultPermissions(),
        assignedBy: 'system',
        assignedAt: DateTime.now(),
        isActive: true,
      );
    } catch (e) {
      return null;
    }
  }

  /// Create a test staff assignment (for development)
  Future<void> createTestStaffAssignment({
    required String staffId,
    required String eventId,
  }) async {
    try {
      // Check if assignment already exists
      final existingQuery = await _firestore
          .collection('staff_event_assignments')
          .where('staffId', isEqualTo: staffId)
          .where('eventId', isEqualTo: eventId)
          .get();

      if (existingQuery.docs.isNotEmpty) {
        return; // Assignment already exists
      }

      // Create new assignment
      await _firestore.collection('staff_event_assignments').add({
        'staffId': staffId,
        'eventId': eventId,
        'role': 'scanner',
        'permissions': ['scan', 'viewAttendees', 'manualCheckIn'],
        'assignedBy': 'system',
        'assignedAt': FieldValue.serverTimestamp(),
        'isActive': true,
      });
    } catch (e) {
      // Ignore errors for now - this is just for development
    }
  }

  /// Helper method to map Firestore data to StaffEventAssignmentEntity
  StaffEventAssignmentEntity _mapFirestoreToAssignment(
    String id,
    Map<String, dynamic> assignmentData,
    Map<String, dynamic> eventData,
  ) {
    return StaffEventAssignmentEntity(
      id: id,
      staffId: assignmentData['staffId'] ?? '',
      eventId: assignmentData['eventId'] ?? '',
      eventTitle: eventData['title'] ?? 'Unknown Event',
      eventLocation: eventData['location'] ?? 'Unknown Location',
      eventDateTime: _parseDateTime(eventData['dateTime']) ?? DateTime.now(),
      role: _mapStringToRole(assignmentData['role'] ?? 'scanner'),
      permissions: (assignmentData['permissions'] as List<dynamic>?)
              ?.map((p) => _mapStringToPermission(p.toString()))
              .where((p) => p != null)
              .cast<StaffPermission>()
              .toList() ??
          [],
      assignedBy: assignmentData['assignedBy'] ?? '',
      assignedAt: _parseDateTime(assignmentData['assignedAt']) ?? DateTime.now(),
      eventBannerUrl: eventData['bannerUrl'],
      isActive: assignmentData['isActive'] ?? true,
    );
  }

  /// Helper method to parse DateTime from various formats
  DateTime? _parseDateTime(dynamic dateValue) {
    if (dateValue == null) return null;
    if (dateValue is Timestamp) return dateValue.toDate();
    if (dateValue is String) {
      try {
        return DateTime.parse(dateValue);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Helper method to map string to StaffRole
  StaffRole _mapStringToRole(String role) {
    switch (role.toLowerCase()) {
      case 'supervisor':
        return StaffRole.supervisor;
      case 'manager':
        return StaffRole.manager;
      case 'scanner':
      default:
        return StaffRole.scanner;
    }
  }

  /// Helper method to map string to StaffPermission
  StaffPermission? _mapStringToPermission(String permission) {
    switch (permission.toLowerCase()) {
      case 'scan':
        return StaffPermission.scan;
      case 'viewattendees':
      case 'view_attendees':
        return StaffPermission.viewAttendees;
      case 'manualcheckin':
      case 'manual_check_in':
        return StaffPermission.manualCheckIn;
      case 'viewreports':
      case 'view_reports':
        return StaffPermission.viewReports;
      case 'managestaff':
      case 'manage_staff':
        return StaffPermission.manageStaff;
      default:
        return null;
    }
  }

}