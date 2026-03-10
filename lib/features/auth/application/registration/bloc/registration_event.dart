import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_event.freezed.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.firstNameChanged(String firstName) = FirstNameChanged;
  const factory RegistrationEvent.lastNameChanged(String lastName) = LastNameChanged;
  const factory RegistrationEvent.emailChanged(String email) = EmailChanged;
  const factory RegistrationEvent.passwordChanged(String password) = PasswordChanged;
  const factory RegistrationEvent.confirmPasswordChanged(String confirmPassword) = ConfirmPasswordChanged;
  const factory RegistrationEvent.referralCodeChanged(String referralCode) = ReferralCodeChanged;
  const factory RegistrationEvent.termsAcceptedChanged(bool accepted) = TermsAcceptedChanged;
  const factory RegistrationEvent.profilePhotoChanged(String? photoPath) = ProfilePhotoChanged;
  const factory RegistrationEvent.toggleShowPassword() = ToggleShowPassword;
  const factory RegistrationEvent.toggleShowConfirmPassword() = ToggleShowConfirmPassword;
  const factory RegistrationEvent.registrationSubmitted() = RegistrationSubmitted;
} 
