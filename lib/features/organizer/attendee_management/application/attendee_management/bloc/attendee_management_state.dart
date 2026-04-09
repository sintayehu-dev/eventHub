part of 'attendee_management_bloc.dart';

@freezed
class AttendeeManagementState with _$AttendeeManagementState {
  const factory AttendeeManagementState({
    @Default([]) List<AttendeeEntity> attendees,
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    @Default(false) bool isSendingMessage,
    @Default(false) bool isExporting,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    AttendeeEntity? selectedAttendee,
    @Default('') String searchQuery,
    String? selectedEventId,
    String? organizerId,
    AttendeeStatus? filterStatus,
    String? exportUrl,
  }) = _AttendeeManagementState;

  factory AttendeeManagementState.initial() => const AttendeeManagementState();
}