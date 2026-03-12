import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadProfile() = LoadProfile;
  const factory ProfileEvent.updateDisplayName(String displayName) = UpdateDisplayName;
  const factory ProfileEvent.updateProfilePhoto(String? photoPath) = UpdateProfilePhoto;
  const factory ProfileEvent.updateEmail(String email) = UpdateEmail;
  const factory ProfileEvent.updatePassword(String currentPassword, String newPassword) = UpdatePassword;
  const factory ProfileEvent.deleteAccount() = DeleteAccount;
  const factory ProfileEvent.refreshProfile() = RefreshProfile;
}