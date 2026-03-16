import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';
import 'package:eventhub/features/staff/attendee_management/domain/repositories/attendee_management_repository.dart';

part 'attendee_management_event.dart';
part 'attendee_management_state.dart';
part 'attendee_management_bloc.freezed.dart';

@injectable
class AttendeeManagementBloc extends Bloc<AttendeeManagementEvent, AttendeeManagementState> {
  final AttendeeManagementRepository _attendeeRepository;

  AttendeeManagementBloc(this._attendeeRepository) : super(const AttendeeManagementState.initial()) {
    on<_LoadEventAttendees>(_onLoadEventAttendees);
    on<_LoadAttendeeById>(_onLoadAttendeeById);
    on<_SearchAttendees>(_onSearchAttendees);
    on<_UpdateAttendeeStatus>(_onUpdateAttendeeStatus);
    on<_LoadAttendeeStats>(_onLoadAttendeeStats);
    on<_ManualCheckIn>(_onManualCheckIn);
    on<_RefreshAttendees>(_onRefreshAttendees);
  }

  Future<void> _onLoadEventAttendees(
    _LoadEventAttendees event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    emit(const AttendeeManagementState.loading());
    
    final result = await _attendeeRepository.getEventAttendees(
      eventId: event.eventId,
      staffId: event.staffId,
      status: event.status,
      searchQuery: event.searchQuery,
      limit: event.limit,
      cursor: event.cursor,
    );
    
    result.fold(
      (failure) => emit(AttendeeManagementState.error(failure.toString())),
      (attendeeResult) => emit(AttendeeManagementState.attendeesLoaded(attendeeResult)),
    );
  }

  Future<void> _onLoadAttendeeById(
    _LoadAttendeeById event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    emit(const AttendeeManagementState.loading());
    
    final result = await _attendeeRepository.getAttendeeById(
      attendeeId: event.attendeeId,
      eventId: event.eventId,
      staffId: event.staffId,
    );
    
    result.fold(
      (failure) => emit(AttendeeManagementState.error(failure.toString())),
      (attendee) => emit(AttendeeManagementState.attendeeLoaded(attendee)),
    );
  }

  Future<void> _onSearchAttendees(
    _SearchAttendees event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    emit(const AttendeeManagementState.loading());
    
    final result = await _attendeeRepository.searchAttendees(
      eventId: event.eventId,
      staffId: event.staffId,
      query: event.query,
      status: event.status,
      limit: event.limit,
    );
    
    result.fold(
      (failure) => emit(AttendeeManagementState.error(failure.toString())),
      (attendeeResult) => emit(AttendeeManagementState.attendeesSearched(attendeeResult)),
    );
  }

  Future<void> _onUpdateAttendeeStatus(
    _UpdateAttendeeStatus event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    emit(const AttendeeManagementState.loading());
    
    final result = await _attendeeRepository.updateAttendeeStatus(
      attendeeId: event.attendeeId,
      eventId: event.eventId,
      staffId: event.staffId,
      status: event.status,
      notes: event.notes,
    );
    
    result.fold(
      (failure) => emit(AttendeeManagementState.error(failure.toString())),
      (attendee) => emit(AttendeeManagementState.attendeeStatusUpdated(attendee)),
    );
  }

  Future<void> _onLoadAttendeeStats(
    _LoadAttendeeStats event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    emit(const AttendeeManagementState.loading());
    
    final result = await _attendeeRepository.getAttendeeStats(
      eventId: event.eventId,
      staffId: event.staffId,
    );
    
    result.fold(
      (failure) => emit(AttendeeManagementState.error(failure.toString())),
      (stats) => emit(AttendeeManagementState.attendeeStatsLoaded(stats)),
    );
  }

  Future<void> _onManualCheckIn(
    _ManualCheckIn event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    emit(const AttendeeManagementState.loading());
    
    final result = await _attendeeRepository.manualCheckIn(
      attendeeId: event.attendeeId,
      eventId: event.eventId,
      staffId: event.staffId,
      notes: event.notes,
    );
    
    result.fold(
      (failure) => emit(AttendeeManagementState.error(failure.toString())),
      (attendee) => emit(AttendeeManagementState.attendeeCheckedIn(attendee)),
    );
  }

  Future<void> _onRefreshAttendees(
    _RefreshAttendees event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    final result = await _attendeeRepository.getEventAttendees(
      eventId: event.eventId,
      staffId: event.staffId,
    );
    
    result.fold(
      (failure) => emit(AttendeeManagementState.error(failure.toString())),
      (attendeeResult) => emit(AttendeeManagementState.attendeesRefreshed(attendeeResult)),
    );
  }
}