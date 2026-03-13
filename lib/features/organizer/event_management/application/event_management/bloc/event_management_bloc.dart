import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_statistics_entity.dart';
import 'package:eventhub/features/organizer/event_management/domain/repositories/event_repository.dart';

part 'event_management_event.dart';
part 'event_management_state.dart';
part 'event_management_bloc.freezed.dart';

@injectable
class EventManagementBloc extends Bloc<EventManagementEvent, EventManagementState> {
  final EventRepository _eventRepository;

  EventManagementBloc(this._eventRepository) : super(const EventManagementState.initial()) {
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
  }

  Future<void> _onCreateEvent(
    _CreateEvent event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.createEvent(
      organizerId: event.organizerId,
      request: event.request,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (createdEvent) => emit(EventManagementState.eventCreated(createdEvent)),
    );
  }

  Future<void> _onLoadOrganizerEvents(
    _LoadOrganizerEvents event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.getOrganizerEvents(
      organizerId: event.organizerId,
      status: event.status,
      limit: event.limit,
      lastEventId: event.lastEventId,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (events) => emit(EventManagementState.eventsLoaded(events)),
    );
  }

  Future<void> _onLoadEventById(
    _LoadEventById event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.getEventById(event.eventId);
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (eventEntity) => emit(EventManagementState.eventLoaded(eventEntity)),
    );
  }

  Future<void> _onUpdateEvent(
    _UpdateEvent event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.updateEvent(
      eventId: event.eventId,
      organizerId: event.organizerId,
      request: event.request,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (updatedEvent) => emit(EventManagementState.eventUpdated(updatedEvent)),
    );
  }

  Future<void> _onDeleteEvent(
    _DeleteEvent event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.deleteEvent(
      eventId: event.eventId,
      organizerId: event.organizerId,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (_) => emit(const EventManagementState.eventDeleted()),
    );
  }

  Future<void> _onCancelEvent(
    _CancelEvent event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.cancelEvent(
      eventId: event.eventId,
      organizerId: event.organizerId,
      cancellationReason: event.cancellationReason,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (cancelledEvent) => emit(EventManagementState.eventCancelled(cancelledEvent)),
    );
  }

  Future<void> _onDuplicateEvent(
    _DuplicateEvent event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.duplicateEvent(
      eventId: event.eventId,
      organizerId: event.organizerId,
      newTitle: event.newTitle,
      newDateTime: event.newDateTime,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (duplicatedEvent) => emit(EventManagementState.eventDuplicated(duplicatedEvent)),
    );
  }

  Future<void> _onSearchEvents(
    _SearchEvents event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.searchEvents(
      organizerId: event.organizerId,
      query: event.query,
      status: event.status,
      startDate: event.startDate,
      endDate: event.endDate,
      limit: event.limit,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (events) => emit(EventManagementState.eventsSearched(events)),
    );
  }

  Future<void> _onLoadEventStatistics(
    _LoadEventStatistics event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.getEventStatistics(
      eventId: event.eventId,
      organizerId: event.organizerId,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (statistics) => emit(EventManagementState.statisticsLoaded(statistics)),
    );
  }

  Future<void> _onUploadEventBanner(
    _UploadEventBanner event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.uploadEventBanner(
      eventId: event.eventId,
      imagePath: event.imagePath,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (bannerUrl) => emit(EventManagementState.bannerUploaded(bannerUrl)),
    );
  }

  Future<void> _onDeleteEventBanner(
    _DeleteEventBanner event,
    Emitter<EventManagementState> emit,
  ) async {
    emit(const EventManagementState.loading());
    
    final result = await _eventRepository.deleteEventBanner(
      eventId: event.eventId,
      bannerUrl: event.bannerUrl,
    );
    
    result.fold(
      (failure) => emit(EventManagementState.error(failure.toString())),
      (_) => emit(const EventManagementState.bannerDeleted()),
    );
  }
}