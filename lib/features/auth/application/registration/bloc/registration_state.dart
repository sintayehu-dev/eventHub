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
} 
