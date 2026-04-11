import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/organizer/staff_management/domain/entities/staff_user_entity.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';

@lazySingleton
class FirebaseStaffManagementDataSource {
  final FirebaseFirestore _firestore;

  FirebaseStaffManagementDataSource({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Get all available staff users
  Future<List<StaffUserEntity>> getAvailableStaff() async {
    try {
      final query = await _firestore
          .collection('staff_users')
          .where('status', isEqualTo: 'active')
          .orderBy('name')
          .get();

      return query.docs.map((doc) {
        final data = doc.data();
        return _mapFirestoreToStaffUser(doc.id, data);
      }).toList();
    } catch (e) {
      // Return hardcoded staff for development
      return [
        StaffUserEntity(
          id: 'staff123',
          name: 'John Scanner',
          email: 'john.scanner@example.com',
          phone: '+1234567890',
          status: StaffUserStatus.active,
          createdAt: DateTime.now().subtract(const Duration(days: 30)),
          lastActiveAt: DateTime.now().subtract(const Duration(hours: 2)),
          specializations: ['ticket_scanning', 'crowd_control'],
        ),
        StaffUserEntity(
          id: 'staff456',
          name: 'Sarah Supervisor',
          email: 'sarah.supervisor@example.com',
          phone: '+1234567891',
          status: StaffUserStatus.active,
          createdAt: DateTime.now().subtract(const Duration(days: 45)),
          lastActiveAt: DateTime.now().subtract(const Duration(minutes: 30)),
          specializations: ['ticket_scanning', 'vip_services', 'management'],
        ),
        StaffUserEntity(
          id: 'staff789',
          name: 'Mike Manager',
          email: 'mike.manager@example.com',
          phone: '+1234567892',
          status: StaffUserStatus.active,
          createdAt: DateTime.now().subtract(const Duration(days: 60)),
          lastActiveAt: DateTime.now().subtract(const Duration(hours: 1)),
          specializations: ['management', 'ticket_scanning', 'crowd_control'],
        ),
      ];
    }
  }

  /// Assign staff to an event
  Future<void> assignStaffToEvent({
    required String eventId,
    required List<StaffAssignmentRequest> staffAssignments,
    required String organizerId,
  }) async {
    try {
      final batch = _firestore.batch();

      for (final assignment in staffAssignments) {
        final assignmentRef = _firestore.collection('staff_event_assignments').doc();
        
        batch.set(assignmentRef, {
          'staffId': assignment.staffId,
          'eventId': eventId,
          'role': assignment.role.name,
          'permissions': assignment.permissions.map((p) => p.name).toList(),
          'assignedBy': organizerId,
          'assignedAt': Timestamp.now(),
          'isActive': true,
          'createdAt': Timestamp.now(),
          'notes': assignment.notes,
        });
      }

      await batch.commit();
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Get staff assignments for an event
  Future<List<StaffEventAssignmentEntity>> getEventStaffAssignments({
    required String eventId,
  }) async {
    try {
      final query = await _firestore
          .collection('staff_event_assignments')
          .where('eventId', isEqualTo: eventId)
          .where('isActive', isEqualTo: true)
          .get();

      final assignments = <StaffEventAssignmentEntity>[];
      
      for (final doc in query.docs) {
        final data = doc.data();
        
        // Get staff user details
        final staffDoc = await _firestore
            .collection('staff_users')
            .doc(data['staffId'])
            .get();
            
        if (staffDoc.exists) {
          final staffData = staffDoc.data()!;
          assignments.add(_mapFirestoreToAssignment(doc.id, data, staffData));
        }
      }

      return assignments;
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Remove staff assignment from event
  Future<void> removeStaffFromEvent({
    required String eventId,
    required String staffId,
  }) async {
    try {
      final query = await _firestore
          .collection('staff_event_assignments')
          .where('eventId', isEqualTo: eventId)
          .where('staffId', isEqualTo: staffId)
          .where('isActive', isEqualTo: true)
          .get();

      final batch = _firestore.batch();
      for (final doc in query.docs) {
        batch.update(doc.reference, {'isActive': false});
      }
      
      await batch.commit();
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  /// Helper method to map Firestore data to StaffUserEntity
  StaffUserEntity _mapFirestoreToStaffUser(String id, Map<String, dynamic> data) {
    return StaffUserEntity(
      id: id,
      name: data['name'] ?? 'Unknown Staff',
      email: data['email'] ?? '',
      phone: data['phone'],
      profileImageUrl: data['profileImageUrl'],
      status: _mapStringToStatus(data['status'] ?? 'active'),
      createdAt: _parseDateTime(data['createdAt']) ?? DateTime.now(),
      lastActiveAt: _parseDateTime(data['lastActiveAt']),
      specializations: List<String>.from(data['specializations'] ?? []),
    );
  }

  /// Helper method to map Firestore data to StaffEventAssignmentEntity
  StaffEventAssignmentEntity _mapFirestoreToAssignment(
    String id,
    Map<String, dynamic> assignmentData,
    Map<String, dynamic> staffData,
  ) {
    return StaffEventAssignmentEntity(
      id: id,
      staffId: assignmentData['staffId'] ?? '',
      eventId: assignmentData['eventId'] ?? '',
      eventTitle: 'Event', // This would come from event data in real implementation
      eventLocation: 'Location',
      eventDateTime: DateTime.now(),
      role: _mapStringToRole(assignmentData['role'] ?? 'scanner'),
      permissions: (assignmentData['permissions'] as List<dynamic>?)
              ?.map((p) => _mapStringToPermission(p.toString()))
              .where((p) => p != null)
              .cast<StaffPermission>()
              .toList() ??
          [],
      assignedBy: assignmentData['assignedBy'] ?? '',
      assignedAt: _parseDateTime(assignmentData['assignedAt']) ?? DateTime.now(),
      isActive: assignmentData['isActive'] ?? true,
    );
  }

  /// Helper methods
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

  StaffUserStatus _mapStringToStatus(String status) {
    switch (status.toLowerCase()) {
      case 'inactive':
        return StaffUserStatus.inactive;
      case 'suspended':
        return StaffUserStatus.suspended;
      case 'active':
      default:
        return StaffUserStatus.active;
    }
  }

  StaffRole _mapStringToRole(String role) {
    // All roles map to staff now
    return StaffRole.staff;
  }

  StaffPermission? _mapStringToPermission(String permission) {
    switch (permission.toLowerCase()) {
      case 'scan':
        return StaffPermission.scan;
      case 'viewattendees':
        return StaffPermission.viewAttendees;
      case 'manualcheckin':
        return StaffPermission.manualCheckIn;
      case 'viewreports':
        return StaffPermission.viewReports;
      case 'managestaff':
        return StaffPermission.manageStaff;
      default:
        return null;
    }
  }
}

/// Request model for staff assignment
class StaffAssignmentRequest {
  final String staffId;
  final StaffRole role;
  final List<StaffPermission> permissions;
  final String? notes;

  StaffAssignmentRequest({
    required this.staffId,
    required this.role,
    required this.permissions,
    this.notes,
  });
}