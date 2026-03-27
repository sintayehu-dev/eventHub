part of 'staff_event_assignment_bloc.dart';

@freezed
class StaffEventAssignmentState with _$StaffEventAssignmentState {
  const factory StaffEventAssignmentState.initial() = _Initial;
  
  const factory StaffEventAssignmentState.loading() = _Loading;
  
  const factory StaffEventAssignmentState.eventsLoaded({
    required List<StaffEventAssignmentEntity> events,
    StaffEventAssignmentEntity? selectedEvent,
  }) = _EventsLoaded;
  
  const factory StaffEventAssignmentState.eventSelected({
    required List<StaffEventAssignmentEntity> events,
    required StaffEventAssignmentEntity selectedEvent,
  }) = _EventSelected;
  
  const factory StaffEventAssignmentState.accessGranted({
    required List<StaffEventAssignmentEntity> events,
    required StaffEventAssignmentEntity selectedEvent,
    required List<StaffPermission> permissions,
  }) = _AccessGranted;
  
  const factory StaffEventAssignmentState.accessDenied({
    required String message,
  }) = _AccessDenied;
  
  const factory StaffEventAssignmentState.assignmentsRefreshed({
    required List<StaffEventAssignmentEntity> events,
    StaffEventAssignmentEntity? selectedEvent,
  }) = _AssignmentsRefreshed;
  
  const factory StaffEventAssignmentState.error({
    required String message,
  }) = _Error;
}