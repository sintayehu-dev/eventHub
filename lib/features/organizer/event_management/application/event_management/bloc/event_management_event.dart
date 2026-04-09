part of 'event_management_bloc.dart';

@freezed
class EventManagementEvent with _$EventManagementEvent {
  const factory EventManagementEvent.createEvent({
    required String organizerId,
    required CreateEventRequest request,
  }) = _CreateEvent;

  const factory EventManagementEvent.loadOrganizerEvents({
    required String organizerId,
    EventStatus? status,
    int? limit,
    String? lastEventId,
  }) = _LoadOrganizerEvents;

  const factory EventManagementEvent.loadEventById({
    required String eventId,
  }) = _LoadEventById;

  const factory EventManagementEvent.updateEvent({
    required String eventId,
    required String organizerId,
    required UpdateEventRequest request,
  }) = _UpdateEvent;

  const factory EventManagementEvent.deleteEvent({
    required String eventId,
    required String organizerId,
  }) = _DeleteEvent;

  const factory EventManagementEvent.cancelEvent({
    required String eventId,
    required String organizerId,
    required String cancellationReason,
  }) = _CancelEvent;

  const factory EventManagementEvent.duplicateEvent({
    required String eventId,
    required String organizerId,
    required String newTitle,
    required DateTime newDateTime,
  }) = _DuplicateEvent;

  const factory EventManagementEvent.searchEvents({
    required String organizerId,
    required String query,
    EventStatus? status,
    DateTime? startDate,
    DateTime? endDate,
    int? limit,
  }) = _SearchEvents;

  const factory EventManagementEvent.loadEventStatistics({
    required String eventId,
    required String organizerId,
  }) = _LoadEventStatistics;

  const factory EventManagementEvent.uploadEventBanner({
    required String eventId,
    required String imagePath,
  }) = _UploadEventBanner;

  const factory EventManagementEvent.deleteEventBanner({
    required String eventId,
    required String bannerUrl,
  }) = _DeleteEventBanner;

  const factory EventManagementEvent.refreshEvents({
    required String organizerId,
  }) = _RefreshEvents;

  const factory EventManagementEvent.clearError() = _ClearError;
}