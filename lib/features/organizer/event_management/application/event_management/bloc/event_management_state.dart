part of 'event_management_bloc.dart';

@freezed
class EventManagementState with _$EventManagementState {
  const factory EventManagementState.initial() = _Initial;
  
  const factory EventManagementState.loading() = _Loading;
  
  const factory EventManagementState.eventCreated(EventEntity event) = _EventCreated;
  
  const factory EventManagementState.eventsLoaded(List<EventEntity> events) = _EventsLoaded;
  
  const factory EventManagementState.eventLoaded(EventEntity event) = _EventLoaded;
  
  const factory EventManagementState.eventUpdated(EventEntity event) = _EventUpdated;
  
  const factory EventManagementState.eventDeleted() = _EventDeleted;
  
  const factory EventManagementState.eventCancelled(EventEntity event) = _EventCancelled;
  
  const factory EventManagementState.eventDuplicated(EventEntity event) = _EventDuplicated;
  
  const factory EventManagementState.eventsSearched(List<EventEntity> events) = _EventsSearched;
  
  const factory EventManagementState.statisticsLoaded(EventStatistics statistics) = _StatisticsLoaded;
  
  const factory EventManagementState.bannerUploaded(String bannerUrl) = _BannerUploaded;
  
  const factory EventManagementState.bannerDeleted() = _BannerDeleted;
  
  const factory EventManagementState.error(String message) = _Error;
}