part of 'attendee_management_bloc.dart';

@freezed
class AttendeeManagementState with _$AttendeeManagementState {
  const factory AttendeeManagementState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingAttendee,
    @Default(false) bool isUpdatingStatus,
    @Default(false) bool isCheckingIn,
    @Default(false) bool isLoadingStats,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default([]) List<AttendeeEntity> attendees,
    AttendeeEntity? selectedAttendee,
    AttendeeStats? stats,
    @Default(false) bool isSearchResult,
    String? searchQuery,
    AttendeeStatus? filterStatus,
    String? nextCursor,
    @Default(false) bool hasMoreData,
  }) = _AttendeeManagementState;

  factory AttendeeManagementState.initial() => const AttendeeManagementState();
}