import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/features/staff/attendee_management/domain/entities/attendee_entity.dart';
import 'package:eventhub/features/staff/attendee_management/domain/repositories/attendee_management_repository.dart';

part 'attendee_management_event.dart';
part 'attendee_management_state.dart';
part 'attendee_management_bloc.freezed.dart';

@injectable
class AttendeeManagementBloc extends Bloc<AttendeeManagementEvent, AttendeeManagementState> {
  final AttendeeManagementRepository _attendeeRepository;

  AttendeeManagementBloc(this._attendeeRepository)
      : super(AttendeeManagementState.initial()) {
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
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));
    
    final result = await _attendeeRepository.getEventAttendees(
      eventId: event.eventId,
      staffId: event.staffId,
      status: event.status,
      searchQuery: event.searchQuery,
      limit: event.limit,
      cursor: event.cursor,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (attendeeResult) => emit(state.copyWith(
        isLoading: false,
        attendees: attendeeResult.attendees,
        nextCursor: attendeeResult.nextCursor,
        hasMoreData: attendeeResult.hasMore,
        isSearchResult: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadAttendeeById(
    _LoadAttendeeById event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoadingAttendee: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
        isLoadingAttendee: true, hasError: false, errorMessage: ''));
    
    final result = await _attendeeRepository.getAttendeeById(
      attendeeId: event.attendeeId,
      eventId: event.eventId,
      staffId: event.staffId,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingAttendee: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (attendee) => emit(state.copyWith(
        isLoadingAttendee: false,
        selectedAttendee: attendee,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onSearchAttendees(
    _SearchAttendees event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, hasError: false, errorMessage: ''));
    
    final result = await _attendeeRepository.searchAttendees(
      eventId: event.eventId,
      staffId: event.staffId,
      query: event.query,
      status: event.status,
      limit: event.limit,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (attendeeResult) => emit(state.copyWith(
        isLoading: false,
        attendees: attendeeResult.attendees,
        nextCursor: attendeeResult.nextCursor,
        hasMoreData: attendeeResult.hasMore,
        isSearchResult: true,
        searchQuery: event.query,
        filterStatus: event.status,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onUpdateAttendeeStatus(
    _UpdateAttendeeStatus event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isUpdatingStatus: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
        isUpdatingStatus: true, hasError: false, errorMessage: ''));
    
    final result = await _attendeeRepository.updateAttendeeStatus(
      attendeeId: event.attendeeId,
      eventId: event.eventId,
      staffId: event.staffId,
      status: event.status,
      notes: event.notes,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isUpdatingStatus: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (updatedAttendee) {
        // Update the attendee in the list
        final updatedAttendees = state.attendees.map((attendee) {
          if (attendee.id == event.attendeeId) {
            return updatedAttendee;
          }
          return attendee;
        }).toList();

        emit(state.copyWith(
          isUpdatingStatus: false,
          attendees: updatedAttendees,
          selectedAttendee: state.selectedAttendee?.id == event.attendeeId
              ? updatedAttendee
              : state.selectedAttendee,
          hasError: false,
          errorMessage: '',
        ));
      },
    );
  }

  Future<void> _onLoadAttendeeStats(
    _LoadAttendeeStats event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoadingStats: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
        isLoadingStats: true, hasError: false, errorMessage: ''));
    
    final result = await _attendeeRepository.getAttendeeStats(
      eventId: event.eventId,
      staffId: event.staffId,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingStats: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (stats) => emit(state.copyWith(
        isLoadingStats: false,
        stats: stats,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onManualCheckIn(
    _ManualCheckIn event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isCheckingIn: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isCheckingIn: true, hasError: false, errorMessage: ''));
    
    final result = await _attendeeRepository.manualCheckIn(
      attendeeId: event.attendeeId,
      eventId: event.eventId,
      staffId: event.staffId,
      notes: event.notes,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isCheckingIn: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (checkedInAttendee) {
        // Update the attendee in the list
        final updatedAttendees = state.attendees.map((attendee) {
          if (attendee.id == event.attendeeId) {
            return checkedInAttendee;
          }
          return attendee;
        }).toList();

        emit(state.copyWith(
          isCheckingIn: false,
          attendees: updatedAttendees,
          selectedAttendee: state.selectedAttendee?.id == event.attendeeId
              ? checkedInAttendee
              : state.selectedAttendee,
          hasError: false,
          errorMessage: '',
        ));
      },
    );
  }

  Future<void> _onRefreshAttendees(
    _RefreshAttendees event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    final result = await _attendeeRepository.getEventAttendees(
      eventId: event.eventId,
      staffId: event.staffId,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (attendeeResult) => emit(state.copyWith(
        attendees: attendeeResult.attendees,
        nextCursor: attendeeResult.nextCursor,
        hasMoreData: attendeeResult.hasMore,
        isSearchResult: false,
        searchQuery: null,
        filterStatus: null,
        hasError: false,
        errorMessage: '',
      )),
    );
  }
}