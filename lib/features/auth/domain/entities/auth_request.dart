import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/core/value_object/value_objects.dart';

part 'auth_request.freezed.dart';

@freezed
class SignInRequest with _$SignInRequest {
  const factory SignInRequest({
    required EmailAddress email,
    required Password password,
  }) = _SignInRequest;

  const SignInRequest._();

  bool isValid() {
    return email.isValid() && password.isValid();
  }

  String get emailValue => email.getOrCrash();
  String get passwordValue => password.getOrCrash();
}

@freezed
class RegisterRequest with _$RegisterRequest {
  const factory RegisterRequest({
    required EmailAddress email,
    required Password password,
  }) = _RegisterRequest;

  const RegisterRequest._();

  bool isValid() {
    return email.isValid() && password.isValid();
  }

  String get emailValue => email.getOrCrash();
  String get passwordValue => password.getOrCrash();
}

@freezed
class PasswordResetRequest with _$PasswordResetRequest {
  const factory PasswordResetRequest({
    required EmailAddress email,
  }) = _PasswordResetRequest;

  const PasswordResetRequest._();

  bool isValid() {
    return email.isValid();
  }

  String get emailValue => email.getOrCrash();
}