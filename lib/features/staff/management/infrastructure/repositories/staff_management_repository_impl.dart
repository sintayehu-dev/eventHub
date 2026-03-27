import 'package:injectable/injectable.dart';
import 'package:eventhub/features/staff/management/domain/entities/staff_entity.dart';
import 'package:eventhub/features/staff/management/domain/repositories/staff_management_repository.dart';
import 'package:eventhub/features/staff/management/infrastructure/datasources/firebase_staff_management_data_source.dart';

@LazySingleton(as: StaffManagementRepository)
class StaffManagementRepositoryImpl implements StaffManagementRepository {
  final FirebaseStaffManagementDataSource _dataSource;

  StaffManagementRepositoryImpl(this._dataSource);

  @override
  Future<List<StaffEntity>> getOrganizerStaff({
    required String organizerId,
  }) async {
    return await _dataSource.getOrganizerStaff(organizerId: organizerId);
  }

  @override
  Future<StaffEntity> addStaffMember({
    required String organizerId,
    required String email,
    required String name,
    required String phone,
  }) async {
    return await _dataSource.addStaffMember(
      organizerId: organizerId,
      email: email,
      name: name,
      phone: phone,
    );
  }

  @override
  Future<void> updateStaffStatus({
    required String staffId,
    required StaffStatus status,
  }) async {
    return await _dataSource.updateStaffStatus(
      staffId: staffId,
      status: status,
    );
  }
}