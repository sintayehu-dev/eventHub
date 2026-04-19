import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/core/value_object/value_objects.dart';

part 'registration_state.freezed.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState({
    FullName? fullName,
    EmailAddress? email,
    Password? password,
    ConfirmPassword? confirmPassword,
    UserRole? userRole,
    TermsAcceptance? termsAcceptance,
    @Default(false) bool isLoading,
    @Default(false) bool isRegistrationError,
    @Default(false) bool showErrorMessages,
    @Default(false) bool showPassword,
    @Default(false) bool showConfirmPassword,
    @Default('') String errorMessage,
    @Default(false) bool isRegistrationSuccessful,
    String? routeName,
  }) = _RegistrationState;

  const RegistrationState._();

  bool get isPasswordValid => password?.isValid() ?? false;
  bool get isFormValid => 
      fullName != null &&
      email != null &&
      password != null &&
      userRole != null &&
      fullName!.isValid() &&
      email!.isValid() &&
      password!.isValid() &&
      userRole!.isValid();

  /// Returns the first invalid field and its error message, or empty map if all valid
  Map<String, String> get firstInvalidField {
    if (fullName != null && !fullName!.isValid()) {
      return {
        'key': 'fullName',
        'error': fullName!.value.fold((f) => f.failedValue, (_) => '')
      };
    }
    if (email != null && !email!.isValid()) {
      return {
        'key': 'email',
        'error': email!.value.fold((f) => f.failedValue, (_) => '')
      };
    }
    if (password != null && !password!.isValid()) {
      return {
        'key': 'password',
        'error': password!.value.fold((f) => f.failedValue, (_) => '')
      };
    }
    if (userRole != null && !userRole!.isValid()) {
      return {
        'key': 'userRole',
        'error': userRole!.value.fold((f) => f.failedValue, (_) => '')
      };
    }
    if (termsAcceptance != null && !termsAcceptance!.isValid()) {
      return {
        'key': 'termsAcceptance',
        'error': 'You must accept the Terms of Service and Privacy Policy'
      };
    }
    return {};
  }
} 
