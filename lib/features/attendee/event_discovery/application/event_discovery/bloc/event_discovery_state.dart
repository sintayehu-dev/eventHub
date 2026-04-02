part of 'event_discovery_bloc.dart';

@freezed
class EventDiscoveryState with _$EventDiscoveryState {
  const factory EventDiscoveryState({
    @Default([]) List<EventDiscoveryEntity> events,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingDetails,
    @Default(false) bool hasError,
    @Default('') String errorMessage,
    @Default(false) bool isSearchResult,
    EventCategory? selectedCategory,
    EventSearchFilters? searchFilters,
    EventDiscoveryEntity? selectedEvent,
  }) = _EventDiscoveryState;

  factory EventDiscoveryState.initial() => const EventDiscoveryState();
}