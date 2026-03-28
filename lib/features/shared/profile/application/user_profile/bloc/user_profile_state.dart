part of 'user_profile_bloc.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.initial() = _Initial;

  const factory UserProfileState.loading() = _Loading;

  const factory UserProfileState.loaded({
    required UserProfileEntity profile,
  }) = _Loaded;

  const factory UserProfileState.profileUpdated({
    required UserProfileEntity profile,
  }) = _ProfileUpdated;

  const factory UserProfileState.preferencesUpdated({
    required UserPreferences preferences,
  }) = _PreferencesUpdated;

  const factory UserProfileState.profileImageUpdated({
    required String imageUrl,
  }) = _ProfileImageUpdated;

  const factory UserProfileState.statusUpdated() = _StatusUpdated;

  const factory UserProfileState.eventAssignmentLoaded({
    CurrentEventAssignment? assignment,
  }) = _EventAssignmentLoaded;

  const factory UserProfileState.staffDataUpdated({
    required StaffProfileData staffData,
  }) = _StaffDataUpdated;

  const factory UserProfileState.organizerDataUpdated({
    required OrganizerProfileData organizerData,
  }) = _OrganizerDataUpdated;

  const factory UserProfileState.attendeeDataUpdated({
    required AttendeeProfileData attendeeData,
  }) = _AttendeeDataUpdated;

  const factory UserProfileState.profileRefreshed({
    required UserProfileEntity profile,
  }) = _ProfileRefreshed;

  const factory UserProfileState.error({
    required String message,
  }) = _Error;
}