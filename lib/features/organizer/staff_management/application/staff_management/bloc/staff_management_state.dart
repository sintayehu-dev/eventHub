part of 'staff_management_bloc.dart';

@freezed
class StaffManagementState with _$StaffManagementState {
  const factory StaffManagementState({
    @Default([]) List<StaffMemberEntity> staffMembers,
    @Default(false) bool isLoading,
    @Default(false) bool isInviting,
    @Default(false) bool isUpdating,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    StaffMemberEntity? selectedStaff,
    StaffInvitation? pendingInvitation,
    @Default('') String searchQuery,
    String? selectedEventId,
    String? organizerId,
    StaffRole? filterRole,
    StaffStatus? filterStatus,
  }) = _StaffManagementState;

  factory StaffManagementState.initial() => const StaffManagementState();
}