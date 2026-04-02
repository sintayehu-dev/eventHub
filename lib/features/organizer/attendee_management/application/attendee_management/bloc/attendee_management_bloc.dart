import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/entities/attendee_entity.dart';
import 'package:eventhub/features/organizer/attendee_management/domain/repositories/attendee_management_repository.dart';

part 'attendee_management_event.dart';
part 'attendee_management_state.dart';
part 'attendee_management_bloc.freezed.dart';

@injectable
class AttendeeManagementBloc extends Bloc<AttendeeManagementEvent, AttendeeManagementState> {
  final AttendeeManagementRepository _repository;

  AttendeeManagementBloc(this._repository) : super(AttendeeManagementState.initial()) {
    on<_LoadEventAttendees>(_onLoadEventAttendees);
    on<_LoadOrganizerAttendees>(_onLoadOrganizerAttendees);
    on<_SearchAttendees>(_onSearchAttendees);
    on<_LoadAttendeeDetails>(_onLoadAttendeeDetails);
    on<_UpdateAttendeeStatus>(_onUpdateAttendeeStatus);
    on<_SendMessageToAttendee>(_onSendMessageToAttendee);
    on<_SendBulkMessage>(_onSendBulkMessage);
    on<_ExportAttendeeList>(_onExportAttendeeList);
    on<_RefreshAttendees>(_onRefreshAttendees);
    on<_ClearError>(_onClearError);
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

    final result = await _repository.getEventAttendees(
      eventId: event.eventId,
      status: event.status,
      limit: event.limit,
      lastAttendeeId: event.lastAttendeeId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (attendees) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        attendees: attendees,
        selectedEventId: event.eventId,
        filterStatus: event.status,
      )),
    );
  }

  Future<void> _onLoadOrganizerAttendees(
    _LoadOrganizerAttendees event,
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

    final result = await _repository.getOrganizerAttendees(
      organizerId: event.organizerId,
      limit: event.limit,
      lastAttendeeId: event.lastAttendeeId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (attendees) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        attendees: attendees,
        organizerId: event.organizerId,
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

    emit(state.copyWith(
      isLoading: true, 
      hasError: false, 
      errorMessage: '',
      searchQuery: event.query,
    ));

    final result = await _repository.searchAttendees(
      query: event.query,
      eventId: event.eventId,
      organizerId: event.organizerId,
      status: event.status,
      limit: event.limit,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (attendees) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        attendees: attendees,
      )),
    );
  }

  Future<void> _onLoadAttendeeDetails(
    _LoadAttendeeDetails event,
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

    final result = await _repository.getAttendeeDetails(
      attendeeId: event.attendeeId,
      eventId: event.eventId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (attendee) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        selectedAttendee: attendee,
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
        isUpdating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isUpdating: true, hasError: false, errorMessage: ''));

    final result = await _repository.updateAttendeeStatus(
      attendeeId: event.attendeeId,
      eventId: event.eventId,
      status: event.status,
      reason: event.reason,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isUpdating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (updatedAttendee) {
        final updatedAttendees = state.attendees.map((a) => 
          a.id == updatedAttendee.id ? updatedAttendee : a
        ).toList();
        emit(state.copyWith(
          isUpdating: false,
          hasError: false,
          errorMessage: '',
          attendees: updatedAttendees,
          selectedAttendee: updatedAttendee,
        ));
      },
    );
  }

  Future<void> _onSendMessageToAttendee(
    _SendMessageToAttendee event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isSendingMessage: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isSendingMessage: true, hasError: false, errorMessage: ''));

    final result = await _repository.sendMessageToAttendee(
      attendeeId: event.attendeeId,
      eventId: event.eventId,
      message: event.message,
      messageType: event.messageType,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isSendingMessage: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (_) => emit(state.copyWith(
        isSendingMessage: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onSendBulkMessage(
    _SendBulkMessage event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isSendingMessage: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isSendingMessage: true, hasError: false, errorMessage: ''));

    final result = await _repository.sendBulkMessage(
      attendeeIds: event.attendeeIds,
      eventId: event.eventId,
      message: event.message,
      messageType: event.messageType,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isSendingMessage: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (_) => emit(state.copyWith(
        isSendingMessage: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onExportAttendeeList(
    _ExportAttendeeList event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isExporting: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isExporting: true, hasError: false, errorMessage: ''));

    final result = await _repository.exportAttendeeList(
      eventId: event.eventId,
      format: event.format,
      includePersonalInfo: event.includePersonalInfo,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isExporting: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (exportUrl) => emit(state.copyWith(
        isExporting: false,
        hasError: false,
        errorMessage: '',
        exportUrl: exportUrl,
      )),
    );
  }

  Future<void> _onRefreshAttendees(
    _RefreshAttendees event,
    Emitter<AttendeeManagementState> emit,
  ) async {
    if (state.selectedEventId != null) {
      add(AttendeeManagementEvent.loadEventAttendees(
        eventId: state.selectedEventId!,
        status: state.filterStatus,
      ));
    } else if (state.organizerId != null) {
      add(AttendeeManagementEvent.loadOrganizerAttendees(
        organizerId: state.organizerId!,
      ));
    }
  }

  void _onClearError(
    _ClearError event,
    Emitter<AttendeeManagementState> emit,
  ) {
    emit(state.copyWith(hasError: false, errorMessage: ''));
  }
}