import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';

abstract class StaffEventAssignmentRepository {
  Future<List<StaffEventAssignmentEntity>> getStaffAssignedEvents({
    required String staffId,
  });

  Future<bool> checkStaffEventAccess({
    required String staffId,
    required String eventId,
  });

  Future<List<StaffPermission>> getStaffEventPermissions({
    required String staffId,
    required String eventId,
  });

  Future<StaffEventAssignmentEntity?> getStaffEventAssignment({
    required String staffId,
    required String eventId,
  });

  Future<void> createTestStaffAssignment({
    required String staffId,
    required String eventId,
  });
}