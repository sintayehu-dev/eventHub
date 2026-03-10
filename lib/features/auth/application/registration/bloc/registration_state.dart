import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/core/value_object/value_objects.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration_response.dart';
import 'package:eventhub/features/auth/domain/verification/entities/verification_code_response.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    required Name firstName,
    required Name lastName,
    required EmailAddress email,
    required Password password,
    required ConfirmPassword confirmPassword,
    required TermsAcceptance termsAcceptance,
    required ProfilePhoto profilePhoto,
    @Default(false) bool isLoading,
    @Default(false) bool isRegistrationError,
    @Default(false) bool showErrorMessages,
    @Default(false) bool showPassword,
    @Default(false) bool showConfirmPassword,
    @Default('') String errorMessage,
    @Default(false) bool verificationSent,
    RegistrationResponse? registrationResponse,
    VerificationCodeResponse? verificationResponse,
  }) = _RegistrationState;

  const RegistrationState._();

  bool get isPasswordValid => password.isValid();
  bool get isFormValid => 
    firstName.isValid() &&
    lastName.isValid() &&
    email.isValid() &&
    password.isValid() &&
    confirmPassword.isValid() &&
    termsAcceptance.isValid() &&
    (profilePhoto.value.getOrElse(() => null) == null || profilePhoto.isValid());

  /// Returns a map with the first invalid field's key and error message
  Map<String, String?> get firstInvalidField {
    final fields = [
      {
        'key': 'firstName',
        'isValid': firstName.isValid(),
        'error': firstName.value.fold(
          (failure) => failure.maybeMap(
            empty: (_) => 'Please enter your first name',
            invalidName: (f) => f.failedValue,
            orElse: () => 'Invalid first name',
          ),
          (_) => null,
        ),
      },
      {
        'key': 'lastName',
        'isValid': lastName.isValid(),
        'error': lastName.value.fold(
          (failure) => failure.maybeMap(
            empty: (_) => 'Please enter your last name',
            invalidName: (f) => f.failedValue,
            orElse: () => 'Invalid last name',
          ),
          (_) => null,
        ),
      },
      {
        'key': 'email',
        'isValid': email.isValid(),
        'error': email.value.fold(
          (failure) => failure.maybeMap(
            invalidEmail: (f) => f.failedValue,
            empty: (_) => 'Please enter your email address',
            orElse: () => 'Invalid email',
          ),
          (_) => null,
        ),
      },
      {
        'key': 'password',
        'isValid': password.isValid(),
        'error': password.value.fold(
          (failure) => failure.maybeMap(
            shortPassword: (f) => f.failedValue,
            empty: (_) => 'Please enter a password',
            orElse: () => 'Invalid password',
          ),
          (_) => null,
        ),
      },
      {
        'key': 'confirmPassword',
        'isValid': confirmPassword.isValid(),
        'error': confirmPassword.value.fold(
          (failure) => failure.maybeMap(
            passwordMismatch: (f) => f.failedValue,
            empty: (_) => 'Please confirm your password',
            orElse: () => 'Passwords do not match',
          ),
          (_) => null,
        ),
      },
    ];
    for (final field in fields) {
      if (!(field['isValid'] as bool)) {
        return {'key': field['key'] as String, 'error': field['error'] as String?};
      }
    }
    return {};
  }
} 
