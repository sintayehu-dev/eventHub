import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_statistics_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/repositories/event_repository.dart';

part 'event_management_event.dart';
part 'event_management_state.dart';
part 'event_management_bloc.freezed.dart';

@injectable
class EventManagementBloc extends Bloc<EventManagementEvent, EventManagementState> {
  final EventRepository _eventRepository;

  EventManagementBloc(this._eventRepository)
      : super(EventManagementState.initial()) {
    on<_CreateEvent>(_onCreateEvent);
    on<_LoadOrganizerEvents>(_onLoadOrganizerEvents);
    on<_LoadEventById>(_onLoadEventById);
    on<_UpdateEvent>(_onUpdateEvent);
    on<_DeleteEvent>(_onDeleteEvent);
    on<_CancelEvent>(_onCancelEvent);
    on<_DuplicateEvent>(_onDuplicateEvent);
    on<_SearchEvents>(_onSearchEvents);
    on<_LoadEventStatistics>(_onLoadEventStatistics);
    on<_UploadEventBanner>(_onUploadEventBanner);
    on<_DeleteEventBanner>(_onDeleteEventBanner);
    on<_RefreshEvents>(_onRefreshEvents);
    on<_ClearError>(_onClearError);
  }

  Future<void> _onCreateEvent(
    _CreateEvent event,
    Emitter<EventManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isCreating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isCreating: true, hasError: false, errorMessage: ''));
    
    final result = await _eventRepository.createEvent(
      organizerId: event.organizerId,
      request: event.request,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isCreating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (createdEvent) {
        final updatedEvents = [createdEvent, ...state.events];
        emit(state.copyWith(
          isCreating: false,
          hasError: false,
          errorMessage: '',
          events: updatedEvents,
          selectedEvent: createdEvent,
        ));
      },
    );
  }

  Future<void> _onLoadOrganizerEvents(
    _LoadOrganizerEvents event,
    Emitter<EventManagementState> emit,
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
    
    final result = await _eventRepository.getOrganizerEvents(
      organizerId: event.organizerId,
      status: event.status,
      limit: event.limit,
      lastEventId: event.lastEventId,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (events) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        events: events,
        filterStatus: event.status,
      )),
    );
  }

  Future<void> _onLoadEventById(
    _LoadEventById event,
    Emitter<EventManagementState> emit,
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
    
    final result = await _eventRepository.getEventById(event.eventId);
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (eventEntity) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        selectedEvent: eventEntity,
      )),
    );
  }

  Future<void> _onUpdateEvent(
    _UpdateEvent event,
    Emitter<EventManagementState> emit,
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
    
    final result = await _eventRepository.updateEvent(
      eventId: event.eventId,
      organizerId: event.organizerId,
      request: event.request,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isUpdating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (updatedEvent) {
        final updatedEvents = state.events
            .map((e) => e.id == updatedEvent.id ? updatedEvent : e)
            .toList();
        emit(state.copyWith(
          isUpdating: false,
          hasError: false,
          errorMessage: '',
          events: updatedEvents,
          selectedEvent: updatedEvent,
        ));
      },
    );
  }

  Future<void> _onDeleteEvent(
    _DeleteEvent event,
    Emitter<EventManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isDeleting: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isDeleting: true, hasError: false, errorMessage: ''));
    
    final result = await _eventRepository.deleteEvent(
      eventId: event.eventId,
      organizerId: event.organizerId,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isDeleting: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (_) {
        final updatedEvents =
            state.events.where((e) => e.id != event.eventId).toList();
        emit(state.copyWith(
          isDeleting: false,
          hasError: false,
          errorMessage: '',
          events: updatedEvents,
          selectedEvent: state.selectedEvent?.id == event.eventId
              ? null
              : state.selectedEvent,
        ));
      },
    );
  }

  Future<void> _onCancelEvent(
    _CancelEvent event,
    Emitter<EventManagementState> emit,
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
    
    final result = await _eventRepository.cancelEvent(
      eventId: event.eventId,
      organizerId: event.organizerId,
      cancellationReason: event.cancellationReason,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isUpdating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (cancelledEvent) {
        final updatedEvents = state.events
            .map((e) => e.id == cancelledEvent.id ? cancelledEvent : e)
            .toList();
        emit(state.copyWith(
          isUpdating: false,
          hasError: false,
          errorMessage: '',
          events: updatedEvents,
          selectedEvent: cancelledEvent,
        ));
      },
    );
  }

  Future<void> _onDuplicateEvent(
    _DuplicateEvent event,
    Emitter<EventManagementState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isCreating: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(isCreating: true, hasError: false, errorMessage: ''));
    
    final result = await _eventRepository.duplicateEvent(
      eventId: event.eventId,
      organizerId: event.organizerId,
      newTitle: event.newTitle,
      newDateTime: event.newDateTime,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isCreating: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (duplicatedEvent) {
        final updatedEvents = [duplicatedEvent, ...state.events];
        emit(state.copyWith(
          isCreating: false,
          hasError: false,
          errorMessage: '',
          events: updatedEvents,
          selectedEvent: duplicatedEvent,
        ));
      },
    );
  }

  Future<void> _onSearchEvents(
    _SearchEvents event,
    Emitter<EventManagementState> emit,
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
      filterStartDate: event.startDate,
      filterEndDate: event.endDate,
    ));
    
    final result = await _eventRepository.searchEvents(
      organizerId: event.organizerId,
      query: event.query,
      status: event.status,
      startDate: event.startDate,
      endDate: event.endDate,
      limit: event.limit,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (events) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        events: events,
      )),
    );
  }

  Future<void> _onLoadEventStatistics(
    _LoadEventStatistics event,
    Emitter<EventManagementState> emit,
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
    
    final result = await _eventRepository.getEventStatistics(
      eventId: event.eventId,
      organizerId: event.organizerId,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (statistics) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        statistics: statistics,
      )),
    );
  }

  Future<void> _onUploadEventBanner(
    _UploadEventBanner event,
    Emitter<EventManagementState> emit,
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
    
    final result = await _eventRepository.uploadEventBanner(
      eventId: event.eventId,
      imagePath: event.imagePath,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (bannerUrl) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        uploadedBannerUrl: bannerUrl,
      )),
    );
  }

  Future<void> _onDeleteEventBanner(
    _DeleteEventBanner event,
    Emitter<EventManagementState> emit,
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
    
    final result = await _eventRepository.deleteEventBanner(
      eventId: event.eventId,
      bannerUrl: event.bannerUrl,
    );
    
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (_) => emit(state.copyWith(
        isLoading: false,
        hasError: false,
        errorMessage: '',
        uploadedBannerUrl: '',
      )),
    );
  }

  Future<void> _onRefreshEvents(
    _RefreshEvents event,
    Emitter<EventManagementState> emit,
  ) async {
    // Reload events with current filters
    add(EventManagementEvent.loadOrganizerEvents(
      organizerId: event.organizerId,
      status: state.filterStatus,
    ));
  }

  void _onClearError(
    _ClearError event,
    Emitter<EventManagementState> emit,
  ) {
    emit(state.copyWith(hasError: false, errorMessage: ''));
  }
}