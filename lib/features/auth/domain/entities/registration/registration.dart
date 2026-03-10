import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/core/value_object/value_objects.dart';

part 'registration.freezed.dart';

@freezed
class RegistrationRequest with _$RegistrationRequest {
  const factory RegistrationRequest({
    required Name firstName,
    required Name lastName,
    required EmailAddress email,
    required Password password,
    required ConfirmPassword confirmPassword,
    required TermsAcceptance termsAcceptance,
    required ProfilePhoto profilePhoto,
  }) = _Registration;

  const RegistrationRequest._();

  factory RegistrationRequest.empty() => RegistrationRequest(
        firstName: Name(''),
        lastName: Name(''),
        email: EmailAddress(''),
        password: Password(''),
        confirmPassword: ConfirmPassword('', ''),
        termsAcceptance: TermsAcceptance(false),
        profilePhoto: ProfilePhoto(null),
      );

  bool isValid() {
    return firstName.isValid() &&
        lastName.isValid() &&
        email.isValid() &&
        password.isValid() &&
        confirmPassword.isValid() &&
        termsAcceptance.isValid() &&
        (profilePhoto.value.getOrElse(() => null) == null || profilePhoto.isValid());
  }
} 
