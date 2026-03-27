import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/staff/event_assignment/domain/entities/staff_event_assignment_entity.dart';
import 'package:eventhub/features/staff/event_assignment/domain/repositories/staff_event_assignment_repository.dart';

part 'staff_event_assignment_event.dart';
part 'staff_event_assignment_state.dart';
part 'staff_event_assignment_bloc.freezed.dart';

@injectable
class StaffEventAssignmentBloc extends Bloc<StaffEventAssignmentEvent, StaffEventAssignmentState> {
  final StaffEventAssignmentRepository _repository;

  StaffEventAssignmentBloc(this._repository) : super(const StaffEventAssignmentState.initial()) {
    on<_LoadStaffEvents>(_onLoadStaffEvents);
    on<_SelectEvent>(_onSelectEvent);
    on<_CheckEventAccess>(_onCheckEventAccess);
    on<_CreateTestAssignment>(_onCreateTestAssignment);
    on<_RefreshAssignments>(_onRefreshAssignments);
  }

  Future<void> _onLoadStaffEvents(
    _LoadStaffEvents event,
    Emitter<StaffEventAssignmentState> emit,
  ) async {
    try {
      emit(const StaffEventAssignmentState.loading());
      
      final events = await _repository.getStaffAssignedEvents(
        staffId: event.staffId,
      );

      emit(StaffEventAssignmentState.eventsLoaded(events: events));
    } catch (e) {
      emit(StaffEventAssignmentState.error(message: e.toString()));
    }
  }

  Future<void> _onSelectEvent(
    _SelectEvent event,
    Emitter<StaffEventAssignmentState> emit,
  ) async {
    final currentState = state;
    if (currentState is _EventsLoaded) {
      final selectedEvent = currentState.events.firstWhere(
        (e) => e.eventId == event.eventId,
        orElse: () => currentState.events.first,
      );
      
      emit(StaffEventAssignmentState.eventSelected(
        events: currentState.events,
        selectedEvent: selectedEvent,
      ));
    } else if (currentState is _EventSelected) {
      final selectedEvent = currentState.events.firstWhere(
        (e) => e.eventId == event.eventId,
        orElse: () => currentState.events.first,
      );
      
      emit(StaffEventAssignmentState.eventSelected(
        events: currentState.events,
        selectedEvent: selectedEvent,
      ));
    } else if (currentState is _AccessGranted) {
      final selectedEvent = currentState.events.firstWhere(
        (e) => e.eventId == event.eventId,
        orElse: () => currentState.events.first,
      );
      
      emit(StaffEventAssignmentState.eventSelected(
        events: currentState.events,
        selectedEvent: selectedEvent,
      ));
    }
  }

  Future<void> _onCheckEventAccess(
    _CheckEventAccess event,
    Emitter<StaffEventAssignmentState> emit,
  ) async {
    try {
      final hasAccess = await _repository.checkStaffEventAccess(
        staffId: event.staffId,
        eventId: event.eventId,
      );

      if (!hasAccess) {
        emit(const StaffEventAssignmentState.accessDenied(
          message: 'You do not have access to this event',
        ));
        return;
      }

      final permissions = await _repository.getStaffEventPermissions(
        staffId: event.staffId,
        eventId: event.eventId,
      );

      final assignment = await _repository.getStaffEventAssignment(
        staffId: event.staffId,
        eventId: event.eventId,
      );

      if (assignment != null) {
        final currentState = state;
        List<StaffEventAssignmentEntity> events = [];
        
        if (currentState is _EventsLoaded) {
          events = currentState.events;
        } else if (currentState is _EventSelected) {
          events = currentState.events;
        } else if (currentState is _AccessGranted) {
          events = currentState.events;
        }

        emit(StaffEventAssignmentState.accessGranted(
          events: events,
          selectedEvent: assignment,
          permissions: permissions,
        ));
      }
    } catch (e) {
      emit(StaffEventAssignmentState.error(message: e.toString()));
    }
  }

  Future<void> _onCreateTestAssignment(
    _CreateTestAssignment event,
    Emitter<StaffEventAssignmentState> emit,
  ) async {
    try {
      await _repository.createTestStaffAssignment(
        staffId: event.staffId,
        eventId: event.eventId,
      );
      
      // Reload events
      add(_LoadStaffEvents(staffId: event.staffId));
    } catch (e) {
      emit(StaffEventAssignmentState.error(message: e.toString()));
    }
  }

  Future<void> _onRefreshAssignments(
    _RefreshAssignments event,
    Emitter<StaffEventAssignmentState> emit,
  ) async {
    try {
      final events = await _repository.getStaffAssignedEvents(
        staffId: event.staffId,
      );
      
      emit(StaffEventAssignmentState.assignmentsRefreshed(events: events));
    } catch (e) {
      emit(StaffEventAssignmentState.error(message: e.toString()));
    }
  }
}