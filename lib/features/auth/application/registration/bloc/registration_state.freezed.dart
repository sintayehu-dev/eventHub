// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationState {
  Name get firstName => throw _privateConstructorUsedError;
  Name get lastName => throw _privateConstructorUsedError;
  EmailAddress get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  ConfirmPassword get confirmPassword => throw _privateConstructorUsedError;
  TermsAcceptance get termsAcceptance => throw _privateConstructorUsedError;
  ProfilePhoto get profilePhoto => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRegistrationError => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get showPassword => throw _privateConstructorUsedError;
  bool get showConfirmPassword => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  bool get verificationSent => throw _privateConstructorUsedError;
  RegistrationResponse? get registrationResponse =>
      throw _privateConstructorUsedError;
  VerificationCodeResponse? get verificationResponse =>
      throw _privateConstructorUsedError;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationStateCopyWith<RegistrationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res, RegistrationState>;
  @useResult
  $Res call(
      {Name firstName,
      Name lastName,
      EmailAddress email,
      Password password,
      ConfirmPassword confirmPassword,
      TermsAcceptance termsAcceptance,
      ProfilePhoto profilePhoto,
      bool isLoading,
      bool isRegistrationError,
      bool showErrorMessages,
      bool showPassword,
      bool showConfirmPassword,
      String errorMessage,
      bool verificationSent,
      RegistrationResponse? registrationResponse,
      VerificationCodeResponse? verificationResponse});

  $RegistrationResponseCopyWith<$Res>? get registrationResponse;
  $VerificationCodeResponseCopyWith<$Res>? get verificationResponse;
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res, $Val extends RegistrationState>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? termsAcceptance = null,
    Object? profilePhoto = null,
    Object? isLoading = null,
    Object? isRegistrationError = null,
    Object? showErrorMessages = null,
    Object? showPassword = null,
    Object? showConfirmPassword = null,
    Object? errorMessage = null,
    Object? verificationSent = null,
    Object? registrationResponse = freezed,
    Object? verificationResponse = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Name,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Name,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPassword,
      termsAcceptance: null == termsAcceptance
          ? _value.termsAcceptance
          : termsAcceptance // ignore: cast_nullable_to_non_nullable
              as TermsAcceptance,
      profilePhoto: null == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as ProfilePhoto,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegistrationError: null == isRegistrationError
          ? _value.isRegistrationError
          : isRegistrationError // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPassword: null == showConfirmPassword
          ? _value.showConfirmPassword
          : showConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      verificationSent: null == verificationSent
          ? _value.verificationSent
          : verificationSent // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationResponse: freezed == registrationResponse
          ? _value.registrationResponse
          : registrationResponse // ignore: cast_nullable_to_non_nullable
              as RegistrationResponse?,
      verificationResponse: freezed == verificationResponse
          ? _value.verificationResponse
          : verificationResponse // ignore: cast_nullable_to_non_nullable
              as VerificationCodeResponse?,
    ) as $Val);
  }

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RegistrationResponseCopyWith<$Res>? get registrationResponse {
    if (_value.registrationResponse == null) {
      return null;
    }

    return $RegistrationResponseCopyWith<$Res>(_value.registrationResponse!,
        (value) {
      return _then(_value.copyWith(registrationResponse: value) as $Val);
    });
  }

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerificationCodeResponseCopyWith<$Res>? get verificationResponse {
    if (_value.verificationResponse == null) {
      return null;
    }

    return $VerificationCodeResponseCopyWith<$Res>(_value.verificationResponse!,
        (value) {
      return _then(_value.copyWith(verificationResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RegistrationStateImplCopyWith<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  factory _$$RegistrationStateImplCopyWith(_$RegistrationStateImpl value,
          $Res Function(_$RegistrationStateImpl) then) =
      __$$RegistrationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Name firstName,
      Name lastName,
      EmailAddress email,
      Password password,
      ConfirmPassword confirmPassword,
      TermsAcceptance termsAcceptance,
      ProfilePhoto profilePhoto,
      bool isLoading,
      bool isRegistrationError,
      bool showErrorMessages,
      bool showPassword,
      bool showConfirmPassword,
      String errorMessage,
      bool verificationSent,
      RegistrationResponse? registrationResponse,
      VerificationCodeResponse? verificationResponse});

  @override
  $RegistrationResponseCopyWith<$Res>? get registrationResponse;
  @override
  $VerificationCodeResponseCopyWith<$Res>? get verificationResponse;
}

/// @nodoc
class __$$RegistrationStateImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$RegistrationStateImpl>
    implements _$$RegistrationStateImplCopyWith<$Res> {
  __$$RegistrationStateImplCopyWithImpl(_$RegistrationStateImpl _value,
      $Res Function(_$RegistrationStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? termsAcceptance = null,
    Object? profilePhoto = null,
    Object? isLoading = null,
    Object? isRegistrationError = null,
    Object? showErrorMessages = null,
    Object? showPassword = null,
    Object? showConfirmPassword = null,
    Object? errorMessage = null,
    Object? verificationSent = null,
    Object? registrationResponse = freezed,
    Object? verificationResponse = freezed,
  }) {
    return _then(_$RegistrationStateImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Name,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Name,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPassword,
      termsAcceptance: null == termsAcceptance
          ? _value.termsAcceptance
          : termsAcceptance // ignore: cast_nullable_to_non_nullable
              as TermsAcceptance,
      profilePhoto: null == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as ProfilePhoto,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRegistrationError: null == isRegistrationError
          ? _value.isRegistrationError
          : isRegistrationError // ignore: cast_nullable_to_non_nullable
              as bool,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      showPassword: null == showPassword
          ? _value.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmPassword: null == showConfirmPassword
          ? _value.showConfirmPassword
          : showConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      verificationSent: null == verificationSent
          ? _value.verificationSent
          : verificationSent // ignore: cast_nullable_to_non_nullable
              as bool,
      registrationResponse: freezed == registrationResponse
          ? _value.registrationResponse
          : registrationResponse // ignore: cast_nullable_to_non_nullable
              as RegistrationResponse?,
      verificationResponse: freezed == verificationResponse
          ? _value.verificationResponse
          : verificationResponse // ignore: cast_nullable_to_non_nullable
              as VerificationCodeResponse?,
    ));
  }
}

/// @nodoc

class _$RegistrationStateImpl extends _RegistrationState {
  const _$RegistrationStateImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.termsAcceptance,
      required this.profilePhoto,
      this.isLoading = false,
      this.isRegistrationError = false,
      this.showErrorMessages = false,
      this.showPassword = false,
      this.showConfirmPassword = false,
      this.errorMessage = '',
      this.verificationSent = false,
      this.registrationResponse,
      this.verificationResponse})
      : super._();

  @override
  final Name firstName;
  @override
  final Name lastName;
  @override
  final EmailAddress email;
  @override
  final Password password;
  @override
  final ConfirmPassword confirmPassword;
  @override
  final TermsAcceptance termsAcceptance;
  @override
  final ProfilePhoto profilePhoto;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isRegistrationError;
  @override
  @JsonKey()
  final bool showErrorMessages;
  @override
  @JsonKey()
  final bool showPassword;
  @override
  @JsonKey()
  final bool showConfirmPassword;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final bool verificationSent;
  @override
  final RegistrationResponse? registrationResponse;
  @override
  final VerificationCodeResponse? verificationResponse;

  @override
  String toString() {
    return 'RegistrationState(firstName: $firstName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword, termsAcceptance: $termsAcceptance, profilePhoto: $profilePhoto, isLoading: $isLoading, isRegistrationError: $isRegistrationError, showErrorMessages: $showErrorMessages, showPassword: $showPassword, showConfirmPassword: $showConfirmPassword, errorMessage: $errorMessage, verificationSent: $verificationSent, registrationResponse: $registrationResponse, verificationResponse: $verificationResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationStateImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.termsAcceptance, termsAcceptance) ||
                other.termsAcceptance == termsAcceptance) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRegistrationError, isRegistrationError) ||
                other.isRegistrationError == isRegistrationError) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.showConfirmPassword, showConfirmPassword) ||
                other.showConfirmPassword == showConfirmPassword) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.verificationSent, verificationSent) ||
                other.verificationSent == verificationSent) &&
            (identical(other.registrationResponse, registrationResponse) ||
                other.registrationResponse == registrationResponse) &&
            (identical(other.verificationResponse, verificationResponse) ||
                other.verificationResponse == verificationResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      password,
      confirmPassword,
      termsAcceptance,
      profilePhoto,
      isLoading,
      isRegistrationError,
      showErrorMessages,
      showPassword,
      showConfirmPassword,
      errorMessage,
      verificationSent,
      registrationResponse,
      verificationResponse);

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationStateImplCopyWith<_$RegistrationStateImpl> get copyWith =>
      __$$RegistrationStateImplCopyWithImpl<_$RegistrationStateImpl>(
          this, _$identity);
}

abstract class _RegistrationState extends RegistrationState {
  const factory _RegistrationState(
          {required final Name firstName,
          required final Name lastName,
          required final EmailAddress email,
          required final Password password,
          required final ConfirmPassword confirmPassword,
          required final TermsAcceptance termsAcceptance,
          required final ProfilePhoto profilePhoto,
          final bool isLoading,
          final bool isRegistrationError,
          final bool showErrorMessages,
          final bool showPassword,
          final bool showConfirmPassword,
          final String errorMessage,
          final bool verificationSent,
          final RegistrationResponse? registrationResponse,
          final VerificationCodeResponse? verificationResponse}) =
      _$RegistrationStateImpl;
  const _RegistrationState._() : super._();

  @override
  Name get firstName;
  @override
  Name get lastName;
  @override
  EmailAddress get email;
  @override
  Password get password;
  @override
  ConfirmPassword get confirmPassword;
  @override
  TermsAcceptance get termsAcceptance;
  @override
  ProfilePhoto get profilePhoto;
  @override
  bool get isLoading;
  @override
  bool get isRegistrationError;
  @override
  bool get showErrorMessages;
  @override
  bool get showPassword;
  @override
  bool get showConfirmPassword;
  @override
  String get errorMessage;
  @override
  bool get verificationSent;
  @override
  RegistrationResponse? get registrationResponse;
  @override
  VerificationCodeResponse? get verificationResponse;

  /// Create a copy of RegistrationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationStateImplCopyWith<_$RegistrationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
