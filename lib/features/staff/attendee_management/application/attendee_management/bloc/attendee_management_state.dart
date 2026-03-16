part of 'attendee_management_bloc.dart';

@freezed
class AttendeeManagementState with _$AttendeeManagementState {
  const factory AttendeeManagementState.initial() = _Initial;
  
  const factory AttendeeManagementState.loading() = _Loading;
  
  const factory AttendeeManagementState.attendeesLoaded(AttendeeSearchResult result) = _AttendeesLoaded;
  
  const factory AttendeeManagementState.attendeeLoaded(AttendeeEntity attendee) = _AttendeeLoaded;
  
  const factory AttendeeManagementState.attendeesSearched(AttendeeSearchResult result) = _AttendeesSearched;
  
  const factory AttendeeManagementState.attendeeStatusUpdated(AttendeeEntity attendee) = _AttendeeStatusUpdated;
  
  const factory AttendeeManagementState.attendeeStatsLoaded(AttendeeStats stats) = _AttendeeStatsLoaded;
  
  const factory AttendeeManagementState.attendeeCheckedIn(AttendeeEntity attendee) = _AttendeeCheckedIn;
  
  const factory AttendeeManagementState.attendeesRefreshed(AttendeeSearchResult result) = _AttendeesRefreshed;
  
  const factory AttendeeManagementState.error(String message) = _Error;
}