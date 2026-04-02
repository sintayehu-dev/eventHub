part of 'attendee_management_bloc.dart';

@freezed
class AttendeeManagementEvent with _$AttendeeManagementEvent {
  const factory AttendeeManagementEvent.loadEventAttendees({
    required String eventId,
    AttendeeStatus? status,
    int? limit,
    String? lastAttendeeId,
  }) = _LoadEventAttendees;

  const factory AttendeeManagementEvent.loadOrganizerAttendees({
    required String organizerId,
    int? limit,
    String? lastAttendeeId,
  }) = _LoadOrganizerAttendees;

  const factory AttendeeManagementEvent.searchAttendees({
    required String query,
    String? eventId,
    String? organizerId,
    AttendeeStatus? status,
    int? limit,
  }) = _SearchAttendees;

  const factory AttendeeManagementEvent.loadAttendeeDetails({
    required String attendeeId,
    required String eventId,
  }) = _LoadAttendeeDetails;

  const factory AttendeeManagementEvent.updateAttendeeStatus({
    required String attendeeId,
    required String eventId,
    required AttendeeStatus status,
    String? reason,
  }) = _UpdateAttendeeStatus;

  const factory AttendeeManagementEvent.sendMessageToAttendee({
    required String attendeeId,
    required String eventId,
    required String message,
    required MessageType messageType,
  }) = _SendMessageToAttendee;

  const factory AttendeeManagementEvent.sendBulkMessage({
    required List<String> attendeeIds,
    required String eventId,
    required String message,
    required MessageType messageType,
  }) = _SendBulkMessage;

  const factory AttendeeManagementEvent.exportAttendeeList({
    required String eventId,
    required ExportFormat format,
    @Default(false) bool includePersonalInfo,
  }) = _ExportAttendeeList;

  const factory AttendeeManagementEvent.refreshAttendees() = _RefreshAttendees;

  const factory AttendeeManagementEvent.clearError() = _ClearError;
}