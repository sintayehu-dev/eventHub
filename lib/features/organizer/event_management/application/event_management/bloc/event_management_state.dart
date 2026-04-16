part of 'event_management_bloc.dart';

@freezed
class EventManagementState with _$EventManagementState {
  const factory EventManagementState({
    @Default([]) List<EventEntity> events,
    @Default(false) bool isLoading,
    @Default(false) bool isCreating,
    @Default(false) bool isUpdating,
    @Default(false) bool isDeleting,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    EventEntity? selectedEvent,
    EventStatistics? statistics,
    @Default('') String searchQuery,
    EventStatus? filterStatus,
    DateTime? filterStartDate,
    DateTime? filterEndDate,
    String? uploadedBannerUrl,
    @Default(false) bool showValidationErrors,
    @Default({}) Map<String, String> validationErrors,
  }) = _EventManagementState;

  factory EventManagementState.initial() => const EventManagementState();
}