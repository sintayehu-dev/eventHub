import 'package:injectable/injectable.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';
import 'package:eventhub/features/staff/event_assignment/domain/repositories/staff_event_assignment_repository.dart';
import 'package:eventhub/features/staff/event_assignment/infrastructure/datasources/firebase_staff_event_assignment_data_source.dart';

@LazySingleton(as: StaffEventAssignmentRepository)
class StaffEventAssignmentRepositoryImpl implements StaffEventAssignmentRepository {
  final FirebaseStaffEventAssignmentDataSource _dataSource;

  StaffEventAssignmentRepositoryImpl(this._dataSource);

  @override
  Future<List<StaffEventAssignmentEntity>> getStaffAssignedEvents({
    required String staffId,
  }) async {
    return await _dataSource.getStaffAssignedEvents(staffId: staffId);
  }

  @override
  Future<bool> checkStaffEventAccess({
    required String staffId,
    required String eventId,
  }) async {
    return await _dataSource.checkStaffEventAccess(
      staffId: staffId,
      eventId: eventId,
    );
  }

  @override
  Future<List<StaffPermission>> getStaffEventPermissions({
    required String staffId,
    required String eventId,
  }) async {
    return await _dataSource.getStaffEventPermissions(
      staffId: staffId,
      eventId: eventId,
    );
  }

  @override
  Future<StaffEventAssignmentEntity?> getStaffEventAssignment({
    required String staffId,
    required String eventId,
  }) async {
    return await _dataSource.getStaffEventAssignment(
      staffId: staffId,
      eventId: eventId,
    );
  }

  @override
  Future<void> createTestStaffAssignment({
    required String staffId,
    required String eventId,
  }) async {
    return await _dataSource.createTestStaffAssignment(
      staffId: staffId,
      eventId: eventId,
    );
  }
}