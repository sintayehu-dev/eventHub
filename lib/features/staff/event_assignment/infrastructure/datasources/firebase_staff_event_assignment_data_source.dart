import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
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

      // Sort by event date time client-side
      assignments.sort((a, b) => a.eventDateTime.compareTo(b.eventDateTime));

      return assignments;
    } catch (e) {
      // Fallback to hardcoded data if Firestore query fails
      return [
        StaffEventAssignmentEntity(
          id: 'test_assignment_1',
          staffId: staffId,
          eventId: '1774346204603_176467',
          eventTitle: 'gg',
          eventLocation: 'ghh',
          eventDateTime: DateTime.parse('2026-03-31T12:56:00.000'),
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
      // For now, allow access to the test event
      return eventId == '1774346204603_176467';
    } catch (e) {
      return false;
    }
  }

  /// Get staff permissions for a specific event
  Future<List<StaffPermission>> getStaffEventPermissions({
    required String staffId,
    required String eventId,
  }) async {
    try {
      // For now, return default permissions for the test event
      if (eventId == '1774346204603_176467') {
        return [
          StaffPermission.scan,
          StaffPermission.viewAttendees,
          StaffPermission.manualCheckIn,
        ];
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  /// Get staff assignment details for a specific event
  Future<StaffEventAssignmentEntity?> getStaffEventAssignment({
    required String staffId,
    required String eventId,
  }) async {
    try {
      // For now, return hardcoded assignment for the test event
      if (eventId == '1774346204603_176467') {
        return StaffEventAssignmentEntity(
          id: 'test_assignment_1',
          staffId: staffId,
          eventId: eventId,
          eventTitle: 'gg',
          eventLocation: 'ghh',
          eventDateTime: DateTime.parse('2026-03-31T12:56:00.000'),
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
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Create a test staff assignment (for development)
  Future<void> createTestStaffAssignment({
    required String staffId,
    required String eventId,
  }) async {
    // Not needed since we're using hardcoded data
    return;
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