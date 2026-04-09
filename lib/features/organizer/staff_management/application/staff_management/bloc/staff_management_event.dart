part of 'staff_management_bloc.dart';

@freezed
class StaffManagementEvent with _$StaffManagementEvent {
  const factory StaffManagementEvent.loadEventStaff({
    required String eventId,
    StaffRole? role,
    int? limit,
    String? lastStaffId,
  }) = _LoadEventStaff;

  const factory StaffManagementEvent.loadOrganizerStaff({
    required String organizerId,
    StaffStatus? status,
    int? limit,
    String? lastStaffId,
  }) = _LoadOrganizerStaff;

  const factory StaffManagementEvent.searchStaff({
    required String query,
    required String organizerId,
    String? eventId,
    StaffRole? role,
    StaffStatus? status,
    int? limit,
  }) = _SearchStaff;

  const factory StaffManagementEvent.loadStaffDetails({
    required String staffId,
    required String organizerId,
  }) = _LoadStaffDetails;

  const factory StaffManagementEvent.inviteStaff({
    required String organizerId,
    required String email,
    required StaffRole role,
    required List<String> permissions,
    List<String>? eventIds,
  }) = _InviteStaff;

  const factory StaffManagementEvent.updateStaffRole({
    required String staffId,
    required String organizerId,
    required StaffRole newRole,
  }) = _UpdateStaffRole;

  const factory StaffManagementEvent.assignStaffToEvent({
    required String staffId,
    required String eventId,
    required StaffRole role,
    required List<String> permissions,
  }) = _AssignStaffToEvent;

  const factory StaffManagementEvent.removeStaffFromEvent({
    required String staffId,
    required String eventId,
    String? reason,
  }) = _RemoveStaffFromEvent;

  const factory StaffManagementEvent.updateStaffPermissions({
    required String staffId,
    required String organizerId,
    required List<String> permissions,
  }) = _UpdateStaffPermissions;

  const factory StaffManagementEvent.deactivateStaff({
    required String staffId,
    required String organizerId,
    String? reason,
  }) = _DeactivateStaff;

  const factory StaffManagementEvent.refreshStaff() = _RefreshStaff;

  const factory StaffManagementEvent.clearError() = _ClearError;
}