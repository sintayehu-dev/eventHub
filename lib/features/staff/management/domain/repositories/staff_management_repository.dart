import 'package:eventhub/features/staff/management/domain/entities/staff_entity.dart';

abstract class StaffManagementRepository {
  Future<List<StaffEntity>> getOrganizerStaff({
    required String organizerId,
  });

  Future<StaffEntity> addStaffMember({
    required String organizerId,
    required String email,
    required String name,
    required String phone,
  });

  Future<void> updateStaffStatus({
    required String staffId,
    required StaffStatus status,
  });
}