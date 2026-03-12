import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:eventhub/core/value_object/value_objects.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    EmailAddress? email,
    Password? password,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
    @Default(false) bool isLoginError,
    @Default(false) bool showErrorMessages,
    @Default(false) bool showPassword,
    @Default(false) bool isPasswordResetSent,
    @Default('') String successMessage,
    @Default(false) bool isLoginSuccessful,
    String? routeName,
  }) = _LoginState;

  const LoginState._();

  /// Returns the first invalid field and its error message, or empty map if all valid
  Map<String, String> get firstInvalidField {
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
    return {};
  }

  bool get isFormValid =>
      email != null &&
      password != null &&
      email!.isValid() &&
      password!.isValid();
} 
