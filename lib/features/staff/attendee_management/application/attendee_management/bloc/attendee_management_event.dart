part of 'attendee_management_bloc.dart';

@freezed
class AttendeeManagementEvent with _$AttendeeManagementEvent {
  const factory AttendeeManagementEvent.loadEventAttendees({
    required String eventId,
    required String staffId,
    AttendeeStatus? status,
    String? searchQuery,
    @Default(20) int limit,
    String? cursor,
  }) = _LoadEventAttendees;

  const factory AttendeeManagementEvent.loadAttendeeById({
    required String attendeeId,
    required String eventId,
    required String staffId,
  }) = _LoadAttendeeById;

  const factory AttendeeManagementEvent.searchAttendees({
    required String eventId,
    required String staffId,
    required String query,
    AttendeeStatus? status,
    @Default(20) int limit,
  }) = _SearchAttendees;

  const factory AttendeeManagementEvent.updateAttendeeStatus({
    required String attendeeId,
    required String eventId,
    required String staffId,
    required AttendeeStatus status,
    String? notes,
  }) = _UpdateAttendeeStatus;

  const factory AttendeeManagementEvent.loadAttendeeStats({
    required String eventId,
    required String staffId,
  }) = _LoadAttendeeStats;

  const factory AttendeeManagementEvent.manualCheckIn({
    required String attendeeId,
    required String eventId,
    required String staffId,
    String? notes,
  }) = _ManualCheckIn;

  const factory AttendeeManagementEvent.refreshAttendees({
    required String eventId,
    required String staffId,
  }) = _RefreshAttendees;
}