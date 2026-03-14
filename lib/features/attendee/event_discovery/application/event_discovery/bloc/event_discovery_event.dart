part of 'event_discovery_bloc.dart';

@freezed
class EventDiscoveryEvent with _$EventDiscoveryEvent {
  const factory EventDiscoveryEvent.loadUpcomingEvents({
    int? limit,
    String? lastEventId,
  }) = _LoadUpcomingEvents;

  const factory EventDiscoveryEvent.loadFeaturedEvents({
    int? limit,
  }) = _LoadFeaturedEvents;

  const factory EventDiscoveryEvent.loadEventsByCategory({
    required EventCategory category,
    int? limit,
  }) = _LoadEventsByCategory;

  const factory EventDiscoveryEvent.searchEvents({
    required EventSearchFilters filters,
    int? limit,
  }) = _SearchEvents;

  const factory EventDiscoveryEvent.loadEventDetails({
    required String eventId,
    String? userId,
  }) = _LoadEventDetails;

  const factory EventDiscoveryEvent.toggleFavorite({
    required String userId,
    required String eventId,
  }) = _ToggleFavorite;

  const factory EventDiscoveryEvent.loadFavoriteEvents({
    required String userId,
  }) = _LoadFavoriteEvents;

  const factory EventDiscoveryEvent.loadNearbyEvents({
    required double latitude,
    required double longitude,
    double? radiusKm,
    int? limit,
  }) = _LoadNearbyEvents;

  const factory EventDiscoveryEvent.refreshEvents() = _RefreshEvents;

  const factory EventDiscoveryEvent.clearSearch() = _ClearSearch;
}