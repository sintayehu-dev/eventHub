import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/entities/event_discovery_entity.dart';
import 'package:eventhub/features/attendee/event_discovery/domain/repositories/event_discovery_repository.dart';
import 'package:eventhub/features/organizer/event_management/domain/entities/event_entity.dart';

part 'event_discovery_event.dart';
part 'event_discovery_state.dart';
part 'event_discovery_bloc.freezed.dart';

@injectable
class EventDiscoveryBloc extends Bloc<EventDiscoveryEvent, EventDiscoveryState> {
  final EventDiscoveryRepository _repository;

  EventDiscoveryBloc({
    required EventDiscoveryRepository repository,
  })  : _repository = repository,
        super(const EventDiscoveryState.initial()) {
    on<_LoadUpcomingEvents>(_onLoadUpcomingEvents);
    on<_LoadFeaturedEvents>(_onLoadFeaturedEvents);
    on<_LoadEventsByCategory>(_onLoadEventsByCategory);
    on<_SearchEvents>(_onSearchEvents);
    on<_LoadEventDetails>(_onLoadEventDetails);
    on<_ToggleFavorite>(_onToggleFavorite);
    on<_LoadFavoriteEvents>(_onLoadFavoriteEvents);
    on<_LoadNearbyEvents>(_onLoadNearbyEvents);
    on<_RefreshEvents>(_onRefreshEvents);
    on<_ClearSearch>(_onClearSearch);
  }

  Future<void> _onLoadUpcomingEvents(
    _LoadUpcomingEvents event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    emit(const EventDiscoveryState.loading());

    final result = await _repository.getUpcomingEvents(
      limit: event.limit,
      lastEventId: event.lastEventId,
    );

    result.fold(
      (failure) => emit(EventDiscoveryState.error(message: failure)),
      (events) => emit(EventDiscoveryState.loaded(
        events: events,
        isSearchResult: false,
      )),
    );
  }

  Future<void> _onLoadFeaturedEvents(
    _LoadFeaturedEvents event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    emit(const EventDiscoveryState.loading());

    final result = await _repository.getFeaturedEvents(limit: event.limit);

    result.fold(
      (failure) => emit(EventDiscoveryState.error(message: failure)),
      (events) => emit(EventDiscoveryState.loaded(
        events: events,
        isSearchResult: false,
      )),
    );
  }

  Future<void> _onLoadEventsByCategory(
    _LoadEventsByCategory event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    emit(const EventDiscoveryState.loading());

    final result = await _repository.getEventsByCategory(
      category: event.category,
      limit: event.limit,
    );

    result.fold(
      (failure) => emit(EventDiscoveryState.error(message: failure)),
      (events) => emit(EventDiscoveryState.loaded(
        events: events,
        isSearchResult: false,
        selectedCategory: event.category,
      )),
    );
  }

  Future<void> _onSearchEvents(
    _SearchEvents event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    emit(const EventDiscoveryState.loading());

    final result = await _repository.searchEvents(
      filters: event.filters,
      limit: event.limit,
    );

    result.fold(
      (failure) => emit(EventDiscoveryState.error(message: failure)),
      (events) => emit(EventDiscoveryState.loaded(
        events: events,
        isSearchResult: true,
        searchFilters: event.filters,
      )),
    );
  }

  Future<void> _onLoadEventDetails(
    _LoadEventDetails event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    emit(const EventDiscoveryState.loadingDetails());

    final result = await _repository.getEventDetails(
      eventId: event.eventId,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(EventDiscoveryState.error(message: failure)),
      (eventDetails) => emit(EventDiscoveryState.eventDetailsLoaded(
        event: eventDetails,
      )),
    );
  }

  Future<void> _onToggleFavorite(
    _ToggleFavorite event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    final result = await _repository.toggleEventFavorite(
      userId: event.userId,
      eventId: event.eventId,
    );

    result.fold(
      (failure) => emit(EventDiscoveryState.error(message: failure)),
      (isFavorite) {
        // Update the current state if we have events loaded
        state.maybeWhen(
          loaded: (events, isSearchResult, selectedCategory, searchFilters) {
            final updatedEvents = events.map((e) {
              if (e.id == event.eventId) {
                return e.copyWith(isFavorite: isFavorite);
              }
              return e;
            }).toList();

            emit(EventDiscoveryState.loaded(
              events: updatedEvents,
              isSearchResult: isSearchResult,
              selectedCategory: selectedCategory,
              searchFilters: searchFilters,
            ));
          },
          eventDetailsLoaded: (eventDetails) {
            if (eventDetails.id == event.eventId) {
              emit(EventDiscoveryState.eventDetailsLoaded(
                event: eventDetails.copyWith(isFavorite: isFavorite),
              ));
            }
          },
          orElse: () {},
        );
      },
    );
  }

  Future<void> _onLoadFavoriteEvents(
    _LoadFavoriteEvents event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    emit(const EventDiscoveryState.loading());

    final result = await _repository.getFavoriteEvents(userId: event.userId);

    result.fold(
      (failure) => emit(EventDiscoveryState.error(message: failure)),
      (events) => emit(EventDiscoveryState.loaded(
        events: events,
        isSearchResult: false,
      )),
    );
  }

  Future<void> _onLoadNearbyEvents(
    _LoadNearbyEvents event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    emit(const EventDiscoveryState.loading());

    final result = await _repository.getNearbyEvents(
      latitude: event.latitude,
      longitude: event.longitude,
      radiusKm: event.radiusKm,
      limit: event.limit,
    );

    result.fold(
      (failure) => emit(EventDiscoveryState.error(message: failure)),
      (events) => emit(EventDiscoveryState.loaded(
        events: events,
        isSearchResult: false,
      )),
    );
  }

  Future<void> _onRefreshEvents(
    _RefreshEvents event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    // Refresh the current view based on the current state
    state.maybeWhen(
      loaded: (events, isSearchResult, selectedCategory, searchFilters) {
        if (isSearchResult && searchFilters != null) {
          add(EventDiscoveryEvent.searchEvents(filters: searchFilters));
        } else if (selectedCategory != null) {
          add(EventDiscoveryEvent.loadEventsByCategory(category: selectedCategory));
        } else {
          add(const EventDiscoveryEvent.loadUpcomingEvents());
        }
      },
      orElse: () {
        add(const EventDiscoveryEvent.loadUpcomingEvents());
      },
    );
  }

  void _onClearSearch(
    _ClearSearch event,
    Emitter<EventDiscoveryState> emit,
  ) {
    add(const EventDiscoveryEvent.loadUpcomingEvents());
  }
}