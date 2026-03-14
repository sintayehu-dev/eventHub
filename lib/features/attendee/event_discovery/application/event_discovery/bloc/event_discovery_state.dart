part of 'event_discovery_bloc.dart';

@freezed
class EventDiscoveryState with _$EventDiscoveryState {
  const factory EventDiscoveryState.initial() = _Initial;
  
  const factory EventDiscoveryState.loading() = _Loading;
  
  const factory EventDiscoveryState.loadingDetails() = _LoadingDetails;
  
  const factory EventDiscoveryState.loaded({
    required List<EventDiscoveryEntity> events,
    required bool isSearchResult,
    EventCategory? selectedCategory,
    EventSearchFilters? searchFilters,
  }) = _Loaded;
  
  const factory EventDiscoveryState.eventDetailsLoaded({
    required EventDiscoveryEntity event,
  }) = _EventDetailsLoaded;
  
  const factory EventDiscoveryState.error({
    required NetworkExceptions message,
  }) = _Error;
}