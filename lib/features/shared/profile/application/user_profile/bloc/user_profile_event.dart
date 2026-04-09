part of 'user_profile_bloc.dart';

@freezed
class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.loadUserProfile({
    required String userId,
  }) = _LoadUserProfile;

  const factory UserProfileEvent.updateUserProfile({
    required String userId,
    required UserProfileEntity profile,
  }) = _UpdateUserProfile;

  const factory UserProfileEvent.updateUserPreferences({
    required String userId,
    required UserPreferences preferences,
  }) = _UpdateUserPreferences;

  const factory UserProfileEvent.updateProfileImage({
    required String userId,
    required String imagePath,
  }) = _UpdateProfileImage;

  const factory UserProfileEvent.updateUserStatus({
    required String userId,
    required UserProfileStatus status,
  }) = _UpdateUserStatus;

  const factory UserProfileEvent.loadCurrentEventAssignment({
    required String staffId,
  }) = _LoadCurrentEventAssignment;

  const factory UserProfileEvent.updateStaffData({
    required String userId,
    required StaffProfileData staffData,
  }) = _UpdateStaffData;

  const factory UserProfileEvent.updateOrganizerData({
    required String userId,
    required OrganizerProfileData organizerData,
  }) = _UpdateOrganizerData;

  const factory UserProfileEvent.updateAttendeeData({
    required String userId,
    required AttendeeProfileData attendeeData,
  }) = _UpdateAttendeeData;

  const factory UserProfileEvent.refreshProfile({
    required String userId,
  }) = _RefreshProfile;
}