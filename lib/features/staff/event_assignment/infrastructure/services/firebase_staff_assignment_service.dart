import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';
import 'package:eventhub/features/staff/event_assignment/domain/services/staff_assignment_service.dart';
import 'package:eventhub/features/organizer/event_management/presentation/widgets/staff_assignment_widget.dart';

@LazySingleton(as: StaffAssignmentService)
class FirebaseStaffAssignmentService implements StaffAssignmentService {
  final FirebaseFirestore _firestore;

  FirebaseStaffAssignmentService({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<void> createStaffAssignments({
    required String eventId,
    required String organizerId,
    required List<StaffAssignmentData> assignments,
  }) async {
    try {
      final batch = _firestore.batch();
      final now = Timestamp.now();

      for (final assignment in assignments) {
        if (assignment.staffEmail.isEmpty || assignment.staffName.isEmpty) {
          continue; // Skip invalid assignments
        }

        // Create a unique ID for the assignment
        final assignmentRef = _firestore.collection('staff_event_assignments').doc();
        
        final assignmentData = {
          'staffId': assignment.staffId, // Use actual staffId instead of email
          'staffName': assignment.staffName,
          'staffEmail': assignment.staffEmail,
          'eventId': eventId,
          'role': _mapRoleToString(assignment.role),
          'permissions': assignment.permissions.map((p) => _mapPermissionToString(p)).toList(),
          'assignedBy': organizerId,
          'assignedAt': now,
          'isActive': true,
          'createdAt': now,
          'updatedAt': now,
        };

        batch.set(assignmentRef, assignmentData);
      }

      await batch.commit();
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  @override
  Future<void> updateStaffAssignments({
    required String eventId,
    required String organizerId,
    required List<StaffAssignmentData> assignments,
  }) async {
    try {
      // First, deactivate all existing assignments for this event
      final existingQuery = await _firestore
          .collection('staff_event_assignments')
          .where('eventId', isEqualTo: eventId)
          .where('assignedBy', isEqualTo: organizerId)
          .get();

      final batch = _firestore.batch();
      
      // Deactivate existing assignments
      for (final doc in existingQuery.docs) {
        batch.update(doc.reference, {
          'isActive': false,
          'updatedAt': Timestamp.now(),
        });
      }

      // Create new assignments
      final now = Timestamp.now();
      for (final assignment in assignments) {
        if (assignment.staffEmail.isEmpty || assignment.staffName.isEmpty) {
          continue;
        }

        final assignmentRef = _firestore.collection('staff_event_assignments').doc();
        
        final assignmentData = {
          'staffId': assignment.staffId,
          'staffName': assignment.staffName,
          'staffEmail': assignment.staffEmail,
          'eventId': eventId,
          'role': _mapRoleToString(assignment.role),
          'permissions': assignment.permissions.map((p) => _mapPermissionToString(p)).toList(),
          'assignedBy': organizerId,
          'assignedAt': now,
          'isActive': true,
          'createdAt': now,
          'updatedAt': now,
        };

        batch.set(assignmentRef, assignmentData);
      }

      await batch.commit();
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  @override
  Future<void> removeStaffAssignment({
    required String assignmentId,
    required String organizerId,
  }) async {
    try {
      await _firestore
          .collection('staff_event_assignments')
          .doc(assignmentId)
          .update({
        'isActive': false,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
    }
  }

  @override
  Future<List<StaffEventAssignmentEntity>> getEventStaffAssignments({
    required String eventId,
    required String organizerId,
  }) async {
    try {
      final query = await _firestore
          .collection('staff_event_assignments')
          .where('eventId', isEqualTo: eventId)
          .where('assignedBy', isEqualTo: organizerId)
          .where('isActive', isEqualTo: true)
          .get();

      final assignments = <StaffEventAssignmentEntity>[];
      
      for (final doc in query.docs) {
        final data = doc.data();
        
        // Get event details from events collection
        final eventDoc = await _firestore
            .collection('events')
            .doc(eventId)
            .get();
            
        if (eventDoc.exists) {
          final eventData = eventDoc.data()!;
          assignments.add(_mapFirestoreToAssignment(doc.id, data, eventData));
        }
      }

      return assignments;
    } catch (e) {
      throw const NetworkExceptions.unexpectedError();
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

  /// Helper method to map StaffRole to string
  String _mapRoleToString(StaffRole role) {
    switch (role) {
      case StaffRole.scanner:
        return 'scanner';
      case StaffRole.supervisor:
        return 'supervisor';
      case StaffRole.manager:
        return 'manager';
    }
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

  /// Helper method to map StaffPermission to string
  String _mapPermissionToString(StaffPermission permission) {
    switch (permission) {
      case StaffPermission.scan:
        return 'scan';
      case StaffPermission.viewAttendees:
        return 'viewAttendees';
      case StaffPermission.manualCheckIn:
        return 'manualCheckIn';
      case StaffPermission.viewReports:
        return 'viewReports';
      case StaffPermission.manageStaff:
        return 'manageStaff';
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