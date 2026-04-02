import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/handlers/app_connectivity.dart';
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
        super(EventDiscoveryState.initial()) {
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

    final result = await _repository.getUpcomingEvents(
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
        events: events,
        isSearchResult: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadFeaturedEvents(
    _LoadFeaturedEvents event,
    Emitter<EventDiscoveryState> emit,
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

    final result = await _repository.getFeaturedEvents(limit: event.limit);

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (events) => emit(state.copyWith(
        isLoading: false,
        events: events,
        isSearchResult: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadEventsByCategory(
    _LoadEventsByCategory event,
    Emitter<EventDiscoveryState> emit,
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

    final result = await _repository.getEventsByCategory(
      category: event.category,
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
        events: events,
        isSearchResult: false,
        selectedCategory: event.category,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onSearchEvents(
    _SearchEvents event,
    Emitter<EventDiscoveryState> emit,
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

    final result = await _repository.searchEvents(
      filters: event.filters,
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
        events: events,
        isSearchResult: true,
        searchFilters: event.filters,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadEventDetails(
    _LoadEventDetails event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    // Check connectivity first
    final connected = await AppConnectivity.connectivity();
    if (!connected) {
      emit(state.copyWith(
        hasError: true,
        isLoadingDetails: false,
        errorMessage: 'No internet connection. Please check your network.',
      ));
      return;
    }

    emit(state.copyWith(
        isLoadingDetails: true, hasError: false, errorMessage: ''));

    final result = await _repository.getEventDetails(
      eventId: event.eventId,
      userId: event.userId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isLoadingDetails: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (eventDetails) => emit(state.copyWith(
        isLoadingDetails: false,
        selectedEvent: eventDetails,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onToggleFavorite(
    _ToggleFavorite event,
    Emitter<EventDiscoveryState> emit,
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

    final result = await _repository.toggleEventFavorite(
      userId: event.userId,
      eventId: event.eventId,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (isFavorite) {
        // Update the current state if we have events loaded
        if (state.events.isNotEmpty) {
          final updatedEvents = state.events.map((e) {
            if (e.id == event.eventId) {
              return e.copyWith(isFavorite: isFavorite);
            }
            return e;
          }).toList();

          emit(state.copyWith(
            events: updatedEvents,
            hasError: false,
            errorMessage: '',
          ));
        }

        // Update selected event if it matches
        if (state.selectedEvent?.id == event.eventId) {
          emit(state.copyWith(
            selectedEvent:
                state.selectedEvent!.copyWith(isFavorite: isFavorite),
            hasError: false,
            errorMessage: '',
          ));
        }
      },
    );
  }

  Future<void> _onLoadFavoriteEvents(
    _LoadFavoriteEvents event,
    Emitter<EventDiscoveryState> emit,
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

    final result = await _repository.getFavoriteEvents(userId: event.userId);

    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: NetworkExceptions.getRawErrorMessage(failure),
      )),
      (events) => emit(state.copyWith(
        isLoading: false,
        events: events,
        isSearchResult: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onLoadNearbyEvents(
    _LoadNearbyEvents event,
    Emitter<EventDiscoveryState> emit,
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

    final result = await _repository.getNearbyEvents(
      latitude: event.latitude,
      longitude: event.longitude,
      radiusKm: event.radiusKm,
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
        events: events,
        isSearchResult: false,
        hasError: false,
        errorMessage: '',
      )),
    );
  }

  Future<void> _onRefreshEvents(
    _RefreshEvents event,
    Emitter<EventDiscoveryState> emit,
  ) async {
    // Refresh the current view based on the current state
    if (state.isSearchResult && state.searchFilters != null) {
      add(EventDiscoveryEvent.searchEvents(filters: state.searchFilters!));
    } else if (state.selectedCategory != null) {
      add(EventDiscoveryEvent.loadEventsByCategory(
          category: state.selectedCategory!));
    } else {
      add(const EventDiscoveryEvent.loadUpcomingEvents());
    }
  }

  void _onClearSearch(
    _ClearSearch event,
    Emitter<EventDiscoveryState> emit,
  ) {
    add(const EventDiscoveryEvent.loadUpcomingEvents());
  }
}