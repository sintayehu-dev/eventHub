part of 'staff_event_assignment_bloc.dart';

@freezed
class StaffEventAssignmentEvent with _$StaffEventAssignmentEvent {
  const factory StaffEventAssignmentEvent.loadStaffEvents({
    required String staffId,
  }) = _LoadStaffEvents;

  const factory StaffEventAssignmentEvent.selectEvent({
    required String eventId,
  }) = _SelectEvent;

  const factory StaffEventAssignmentEvent.checkEventAccess({
    required String staffId,
    required String eventId,
  }) = _CheckEventAccess;

  const factory StaffEventAssignmentEvent.createTestAssignment({
    required String staffId,
    required String eventId,
  }) = _CreateTestAssignment;

  const factory StaffEventAssignmentEvent.refreshAssignments({
    required String staffId,
  }) = _RefreshAssignments;
}