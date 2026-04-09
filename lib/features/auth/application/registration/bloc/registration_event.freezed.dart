// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String role) userRoleChanged,
    required TResult Function(bool accepted) termsAcceptedChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() toggleShowConfirmPassword,
    required TResult Function() registrationSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String role)? userRoleChanged,
    TResult? Function(bool accepted)? termsAcceptedChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? toggleShowConfirmPassword,
    TResult? Function()? registrationSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String role)? userRoleChanged,
    TResult Function(bool accepted)? termsAcceptedChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? toggleShowConfirmPassword,
    TResult Function()? registrationSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserRoleChanged value) userRoleChanged,
    required TResult Function(TermsAcceptedChanged value) termsAcceptedChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(ToggleShowConfirmPassword value)
        toggleShowConfirmPassword,
    required TResult Function(RegistrationSubmitted value)
        registrationSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserRoleChanged value)? userRoleChanged,
    TResult? Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult? Function(RegistrationSubmitted value)? registrationSubmitted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserRoleChanged value)? userRoleChanged,
    TResult Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult Function(RegistrationSubmitted value)? registrationSubmitted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationEventCopyWith<$Res> {
  factory $RegistrationEventCopyWith(
          RegistrationEvent value, $Res Function(RegistrationEvent) then) =
      _$RegistrationEventCopyWithImpl<$Res, RegistrationEvent>;
}

/// @nodoc
class _$RegistrationEventCopyWithImpl<$Res, $Val extends RegistrationEvent>
    implements $RegistrationEventCopyWith<$Res> {
  _$RegistrationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EmailChangedImplCopyWith<$Res> {
  factory _$$EmailChangedImplCopyWith(
          _$EmailChangedImpl value, $Res Function(_$EmailChangedImpl) then) =
      __$$EmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailChangedImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$EmailChangedImpl>
    implements _$$EmailChangedImplCopyWith<$Res> {
  __$$EmailChangedImplCopyWithImpl(
      _$EmailChangedImpl _value, $Res Function(_$EmailChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailChangedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChangedImpl implements EmailChanged {
  const _$EmailChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'RegistrationEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      __$$EmailChangedImplCopyWithImpl<_$EmailChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String role) userRoleChanged,
    required TResult Function(bool accepted) termsAcceptedChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() toggleShowConfirmPassword,
    required TResult Function() registrationSubmitted,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String role)? userRoleChanged,
    TResult? Function(bool accepted)? termsAcceptedChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? toggleShowConfirmPassword,
    TResult? Function()? registrationSubmitted,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String role)? userRoleChanged,
    TResult Function(bool accepted)? termsAcceptedChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? toggleShowConfirmPassword,
    TResult Function()? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserRoleChanged value) userRoleChanged,
    required TResult Function(TermsAcceptedChanged value) termsAcceptedChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(ToggleShowConfirmPassword value)
        toggleShowConfirmPassword,
    required TResult Function(RegistrationSubmitted value)
        registrationSubmitted,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserRoleChanged value)? userRoleChanged,
    TResult? Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult? Function(RegistrationSubmitted value)? registrationSubmitted,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserRoleChanged value)? userRoleChanged,
    TResult Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult Function(RegistrationSubmitted value)? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements RegistrationEvent {
  const factory EmailChanged(final String email) = _$EmailChangedImpl;

  String get email;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordChangedImplCopyWith<$Res> {
  factory _$$PasswordChangedImplCopyWith(_$PasswordChangedImpl value,
          $Res Function(_$PasswordChangedImpl) then) =
      __$$PasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$PasswordChangedImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$PasswordChangedImpl>
    implements _$$PasswordChangedImplCopyWith<$Res> {
  __$$PasswordChangedImplCopyWithImpl(
      _$PasswordChangedImpl _value, $Res Function(_$PasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$PasswordChangedImpl(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordChangedImpl implements PasswordChanged {
  const _$PasswordChangedImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'RegistrationEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordChangedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      __$$PasswordChangedImplCopyWithImpl<_$PasswordChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String role) userRoleChanged,
    required TResult Function(bool accepted) termsAcceptedChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() toggleShowConfirmPassword,
    required TResult Function() registrationSubmitted,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String role)? userRoleChanged,
    TResult? Function(bool accepted)? termsAcceptedChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? toggleShowConfirmPassword,
    TResult? Function()? registrationSubmitted,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String role)? userRoleChanged,
    TResult Function(bool accepted)? termsAcceptedChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? toggleShowConfirmPassword,
    TResult Function()? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserRoleChanged value) userRoleChanged,
    required TResult Function(TermsAcceptedChanged value) termsAcceptedChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(ToggleShowConfirmPassword value)
        toggleShowConfirmPassword,
    required TResult Function(RegistrationSubmitted value)
        registrationSubmitted,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserRoleChanged value)? userRoleChanged,
    TResult? Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult? Function(RegistrationSubmitted value)? registrationSubmitted,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserRoleChanged value)? userRoleChanged,
    TResult Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult Function(RegistrationSubmitted value)? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements RegistrationEvent {
  const factory PasswordChanged(final String password) = _$PasswordChangedImpl;

  String get password;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmPasswordChangedImplCopyWith<$Res> {
  factory _$$ConfirmPasswordChangedImplCopyWith(
          _$ConfirmPasswordChangedImpl value,
          $Res Function(_$ConfirmPasswordChangedImpl) then) =
      __$$ConfirmPasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String confirmPassword});
}

/// @nodoc
class __$$ConfirmPasswordChangedImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$ConfirmPasswordChangedImpl>
    implements _$$ConfirmPasswordChangedImplCopyWith<$Res> {
  __$$ConfirmPasswordChangedImplCopyWithImpl(
      _$ConfirmPasswordChangedImpl _value,
      $Res Function(_$ConfirmPasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmPassword = null,
  }) {
    return _then(_$ConfirmPasswordChangedImpl(
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConfirmPasswordChangedImpl implements ConfirmPasswordChanged {
  const _$ConfirmPasswordChangedImpl(this.confirmPassword);

  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'RegistrationEvent.confirmPasswordChanged(confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmPasswordChangedImpl &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confirmPassword);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmPasswordChangedImplCopyWith<_$ConfirmPasswordChangedImpl>
      get copyWith => __$$ConfirmPasswordChangedImplCopyWithImpl<
          _$ConfirmPasswordChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String role) userRoleChanged,
    required TResult Function(bool accepted) termsAcceptedChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() toggleShowConfirmPassword,
    required TResult Function() registrationSubmitted,
  }) {
    return confirmPasswordChanged(confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String role)? userRoleChanged,
    TResult? Function(bool accepted)? termsAcceptedChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? toggleShowConfirmPassword,
    TResult? Function()? registrationSubmitted,
  }) {
    return confirmPasswordChanged?.call(confirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String role)? userRoleChanged,
    TResult Function(bool accepted)? termsAcceptedChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? toggleShowConfirmPassword,
    TResult Function()? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (confirmPasswordChanged != null) {
      return confirmPasswordChanged(confirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserRoleChanged value) userRoleChanged,
    required TResult Function(TermsAcceptedChanged value) termsAcceptedChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(ToggleShowConfirmPassword value)
        toggleShowConfirmPassword,
    required TResult Function(RegistrationSubmitted value)
        registrationSubmitted,
  }) {
    return confirmPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserRoleChanged value)? userRoleChanged,
    TResult? Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult? Function(RegistrationSubmitted value)? registrationSubmitted,
  }) {
    return confirmPasswordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserRoleChanged value)? userRoleChanged,
    TResult Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult Function(RegistrationSubmitted value)? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (confirmPasswordChanged != null) {
      return confirmPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class ConfirmPasswordChanged implements RegistrationEvent {
  const factory ConfirmPasswordChanged(final String confirmPassword) =
      _$ConfirmPasswordChangedImpl;

  String get confirmPassword;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmPasswordChangedImplCopyWith<_$ConfirmPasswordChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserRoleChangedImplCopyWith<$Res> {
  factory _$$UserRoleChangedImplCopyWith(_$UserRoleChangedImpl value,
          $Res Function(_$UserRoleChangedImpl) then) =
      __$$UserRoleChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String role});
}

/// @nodoc
class __$$UserRoleChangedImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$UserRoleChangedImpl>
    implements _$$UserRoleChangedImplCopyWith<$Res> {
  __$$UserRoleChangedImplCopyWithImpl(
      _$UserRoleChangedImpl _value, $Res Function(_$UserRoleChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
  }) {
    return _then(_$UserRoleChangedImpl(
      null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserRoleChangedImpl implements UserRoleChanged {
  const _$UserRoleChangedImpl(this.role);

  @override
  final String role;

  @override
  String toString() {
    return 'RegistrationEvent.userRoleChanged(role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRoleChangedImpl &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, role);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRoleChangedImplCopyWith<_$UserRoleChangedImpl> get copyWith =>
      __$$UserRoleChangedImplCopyWithImpl<_$UserRoleChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String role) userRoleChanged,
    required TResult Function(bool accepted) termsAcceptedChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() toggleShowConfirmPassword,
    required TResult Function() registrationSubmitted,
  }) {
    return userRoleChanged(role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String role)? userRoleChanged,
    TResult? Function(bool accepted)? termsAcceptedChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? toggleShowConfirmPassword,
    TResult? Function()? registrationSubmitted,
  }) {
    return userRoleChanged?.call(role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String role)? userRoleChanged,
    TResult Function(bool accepted)? termsAcceptedChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? toggleShowConfirmPassword,
    TResult Function()? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (userRoleChanged != null) {
      return userRoleChanged(role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserRoleChanged value) userRoleChanged,
    required TResult Function(TermsAcceptedChanged value) termsAcceptedChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(ToggleShowConfirmPassword value)
        toggleShowConfirmPassword,
    required TResult Function(RegistrationSubmitted value)
        registrationSubmitted,
  }) {
    return userRoleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserRoleChanged value)? userRoleChanged,
    TResult? Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult? Function(RegistrationSubmitted value)? registrationSubmitted,
  }) {
    return userRoleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserRoleChanged value)? userRoleChanged,
    TResult Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult Function(RegistrationSubmitted value)? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (userRoleChanged != null) {
      return userRoleChanged(this);
    }
    return orElse();
  }
}

abstract class UserRoleChanged implements RegistrationEvent {
  const factory UserRoleChanged(final String role) = _$UserRoleChangedImpl;

  String get role;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserRoleChangedImplCopyWith<_$UserRoleChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TermsAcceptedChangedImplCopyWith<$Res> {
  factory _$$TermsAcceptedChangedImplCopyWith(_$TermsAcceptedChangedImpl value,
          $Res Function(_$TermsAcceptedChangedImpl) then) =
      __$$TermsAcceptedChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool accepted});
}

/// @nodoc
class __$$TermsAcceptedChangedImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$TermsAcceptedChangedImpl>
    implements _$$TermsAcceptedChangedImplCopyWith<$Res> {
  __$$TermsAcceptedChangedImplCopyWithImpl(_$TermsAcceptedChangedImpl _value,
      $Res Function(_$TermsAcceptedChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accepted = null,
  }) {
    return _then(_$TermsAcceptedChangedImpl(
      null == accepted
          ? _value.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TermsAcceptedChangedImpl implements TermsAcceptedChanged {
  const _$TermsAcceptedChangedImpl(this.accepted);

  @override
  final bool accepted;

  @override
  String toString() {
    return 'RegistrationEvent.termsAcceptedChanged(accepted: $accepted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsAcceptedChangedImpl &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accepted);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsAcceptedChangedImplCopyWith<_$TermsAcceptedChangedImpl>
      get copyWith =>
          __$$TermsAcceptedChangedImplCopyWithImpl<_$TermsAcceptedChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String role) userRoleChanged,
    required TResult Function(bool accepted) termsAcceptedChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() toggleShowConfirmPassword,
    required TResult Function() registrationSubmitted,
  }) {
    return termsAcceptedChanged(accepted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String role)? userRoleChanged,
    TResult? Function(bool accepted)? termsAcceptedChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? toggleShowConfirmPassword,
    TResult? Function()? registrationSubmitted,
  }) {
    return termsAcceptedChanged?.call(accepted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String role)? userRoleChanged,
    TResult Function(bool accepted)? termsAcceptedChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? toggleShowConfirmPassword,
    TResult Function()? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (termsAcceptedChanged != null) {
      return termsAcceptedChanged(accepted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserRoleChanged value) userRoleChanged,
    required TResult Function(TermsAcceptedChanged value) termsAcceptedChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(ToggleShowConfirmPassword value)
        toggleShowConfirmPassword,
    required TResult Function(RegistrationSubmitted value)
        registrationSubmitted,
  }) {
    return termsAcceptedChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserRoleChanged value)? userRoleChanged,
    TResult? Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult? Function(RegistrationSubmitted value)? registrationSubmitted,
  }) {
    return termsAcceptedChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserRoleChanged value)? userRoleChanged,
    TResult Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult Function(RegistrationSubmitted value)? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (termsAcceptedChanged != null) {
      return termsAcceptedChanged(this);
    }
    return orElse();
  }
}

abstract class TermsAcceptedChanged implements RegistrationEvent {
  const factory TermsAcceptedChanged(final bool accepted) =
      _$TermsAcceptedChangedImpl;

  bool get accepted;

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TermsAcceptedChangedImplCopyWith<_$TermsAcceptedChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleShowPasswordImplCopyWith<$Res> {
  factory _$$ToggleShowPasswordImplCopyWith(_$ToggleShowPasswordImpl value,
          $Res Function(_$ToggleShowPasswordImpl) then) =
      __$$ToggleShowPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleShowPasswordImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$ToggleShowPasswordImpl>
    implements _$$ToggleShowPasswordImplCopyWith<$Res> {
  __$$ToggleShowPasswordImplCopyWithImpl(_$ToggleShowPasswordImpl _value,
      $Res Function(_$ToggleShowPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleShowPasswordImpl implements ToggleShowPassword {
  const _$ToggleShowPasswordImpl();

  @override
  String toString() {
    return 'RegistrationEvent.toggleShowPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleShowPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String role) userRoleChanged,
    required TResult Function(bool accepted) termsAcceptedChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() toggleShowConfirmPassword,
    required TResult Function() registrationSubmitted,
  }) {
    return toggleShowPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String role)? userRoleChanged,
    TResult? Function(bool accepted)? termsAcceptedChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? toggleShowConfirmPassword,
    TResult? Function()? registrationSubmitted,
  }) {
    return toggleShowPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String role)? userRoleChanged,
    TResult Function(bool accepted)? termsAcceptedChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? toggleShowConfirmPassword,
    TResult Function()? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (toggleShowPassword != null) {
      return toggleShowPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserRoleChanged value) userRoleChanged,
    required TResult Function(TermsAcceptedChanged value) termsAcceptedChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(ToggleShowConfirmPassword value)
        toggleShowConfirmPassword,
    required TResult Function(RegistrationSubmitted value)
        registrationSubmitted,
  }) {
    return toggleShowPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserRoleChanged value)? userRoleChanged,
    TResult? Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult? Function(RegistrationSubmitted value)? registrationSubmitted,
  }) {
    return toggleShowPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserRoleChanged value)? userRoleChanged,
    TResult Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult Function(RegistrationSubmitted value)? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (toggleShowPassword != null) {
      return toggleShowPassword(this);
    }
    return orElse();
  }
}

abstract class ToggleShowPassword implements RegistrationEvent {
  const factory ToggleShowPassword() = _$ToggleShowPasswordImpl;
}

/// @nodoc
abstract class _$$ToggleShowConfirmPasswordImplCopyWith<$Res> {
  factory _$$ToggleShowConfirmPasswordImplCopyWith(
          _$ToggleShowConfirmPasswordImpl value,
          $Res Function(_$ToggleShowConfirmPasswordImpl) then) =
      __$$ToggleShowConfirmPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleShowConfirmPasswordImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res,
        _$ToggleShowConfirmPasswordImpl>
    implements _$$ToggleShowConfirmPasswordImplCopyWith<$Res> {
  __$$ToggleShowConfirmPasswordImplCopyWithImpl(
      _$ToggleShowConfirmPasswordImpl _value,
      $Res Function(_$ToggleShowConfirmPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleShowConfirmPasswordImpl implements ToggleShowConfirmPassword {
  const _$ToggleShowConfirmPasswordImpl();

  @override
  String toString() {
    return 'RegistrationEvent.toggleShowConfirmPassword()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleShowConfirmPasswordImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String role) userRoleChanged,
    required TResult Function(bool accepted) termsAcceptedChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() toggleShowConfirmPassword,
    required TResult Function() registrationSubmitted,
  }) {
    return toggleShowConfirmPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String role)? userRoleChanged,
    TResult? Function(bool accepted)? termsAcceptedChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? toggleShowConfirmPassword,
    TResult? Function()? registrationSubmitted,
  }) {
    return toggleShowConfirmPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String role)? userRoleChanged,
    TResult Function(bool accepted)? termsAcceptedChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? toggleShowConfirmPassword,
    TResult Function()? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (toggleShowConfirmPassword != null) {
      return toggleShowConfirmPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserRoleChanged value) userRoleChanged,
    required TResult Function(TermsAcceptedChanged value) termsAcceptedChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(ToggleShowConfirmPassword value)
        toggleShowConfirmPassword,
    required TResult Function(RegistrationSubmitted value)
        registrationSubmitted,
  }) {
    return toggleShowConfirmPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserRoleChanged value)? userRoleChanged,
    TResult? Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult? Function(RegistrationSubmitted value)? registrationSubmitted,
  }) {
    return toggleShowConfirmPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserRoleChanged value)? userRoleChanged,
    TResult Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult Function(RegistrationSubmitted value)? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (toggleShowConfirmPassword != null) {
      return toggleShowConfirmPassword(this);
    }
    return orElse();
  }
}

abstract class ToggleShowConfirmPassword implements RegistrationEvent {
  const factory ToggleShowConfirmPassword() = _$ToggleShowConfirmPasswordImpl;
}

/// @nodoc
abstract class _$$RegistrationSubmittedImplCopyWith<$Res> {
  factory _$$RegistrationSubmittedImplCopyWith(
          _$RegistrationSubmittedImpl value,
          $Res Function(_$RegistrationSubmittedImpl) then) =
      __$$RegistrationSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegistrationSubmittedImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$RegistrationSubmittedImpl>
    implements _$$RegistrationSubmittedImplCopyWith<$Res> {
  __$$RegistrationSubmittedImplCopyWithImpl(_$RegistrationSubmittedImpl _value,
      $Res Function(_$RegistrationSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegistrationSubmittedImpl implements RegistrationSubmitted {
  const _$RegistrationSubmittedImpl();

  @override
  String toString() {
    return 'RegistrationEvent.registrationSubmitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function(String confirmPassword) confirmPasswordChanged,
    required TResult Function(String role) userRoleChanged,
    required TResult Function(bool accepted) termsAcceptedChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() toggleShowConfirmPassword,
    required TResult Function() registrationSubmitted,
  }) {
    return registrationSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function(String confirmPassword)? confirmPasswordChanged,
    TResult? Function(String role)? userRoleChanged,
    TResult? Function(bool accepted)? termsAcceptedChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? toggleShowConfirmPassword,
    TResult? Function()? registrationSubmitted,
  }) {
    return registrationSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function(String confirmPassword)? confirmPasswordChanged,
    TResult Function(String role)? userRoleChanged,
    TResult Function(bool accepted)? termsAcceptedChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? toggleShowConfirmPassword,
    TResult Function()? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (registrationSubmitted != null) {
      return registrationSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ConfirmPasswordChanged value)
        confirmPasswordChanged,
    required TResult Function(UserRoleChanged value) userRoleChanged,
    required TResult Function(TermsAcceptedChanged value) termsAcceptedChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(ToggleShowConfirmPassword value)
        toggleShowConfirmPassword,
    required TResult Function(RegistrationSubmitted value)
        registrationSubmitted,
  }) {
    return registrationSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult? Function(UserRoleChanged value)? userRoleChanged,
    TResult? Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult? Function(RegistrationSubmitted value)? registrationSubmitted,
  }) {
    return registrationSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ConfirmPasswordChanged value)? confirmPasswordChanged,
    TResult Function(UserRoleChanged value)? userRoleChanged,
    TResult Function(TermsAcceptedChanged value)? termsAcceptedChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(ToggleShowConfirmPassword value)?
        toggleShowConfirmPassword,
    TResult Function(RegistrationSubmitted value)? registrationSubmitted,
    required TResult orElse(),
  }) {
    if (registrationSubmitted != null) {
      return registrationSubmitted(this);
    }
    return orElse();
  }
}

abstract class RegistrationSubmitted implements RegistrationEvent {
  const factory RegistrationSubmitted() = _$RegistrationSubmittedImpl;
}
