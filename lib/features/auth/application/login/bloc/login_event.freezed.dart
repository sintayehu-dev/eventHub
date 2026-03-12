// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() loginSubmitted,
    required TResult Function() googleSignInSubmitted,
    required TResult Function() passwordResetRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? loginSubmitted,
    TResult? Function()? googleSignInSubmitted,
    TResult? Function()? passwordResetRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? loginSubmitted,
    TResult Function()? googleSignInSubmitted,
    TResult Function()? passwordResetRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(LoginSubmitted value) loginSubmitted,
    required TResult Function(GoogleSignInSubmitted value)
        googleSignInSubmitted,
    required TResult Function(PasswordResetRequested value)
        passwordResetRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(LoginSubmitted value)? loginSubmitted,
    TResult? Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult? Function(PasswordResetRequested value)? passwordResetRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(LoginSubmitted value)? loginSubmitted,
    TResult Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult Function(PasswordResetRequested value)? passwordResetRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
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
    extends _$LoginEventCopyWithImpl<$Res, _$EmailChangedImpl>
    implements _$$EmailChangedImplCopyWith<$Res> {
  __$$EmailChangedImplCopyWithImpl(
      _$EmailChangedImpl _value, $Res Function(_$EmailChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
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
    return 'LoginEvent.emailChanged(email: $email)';
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

  /// Create a copy of LoginEvent
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
    required TResult Function() toggleShowPassword,
    required TResult Function() loginSubmitted,
    required TResult Function() googleSignInSubmitted,
    required TResult Function() passwordResetRequested,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? loginSubmitted,
    TResult? Function()? googleSignInSubmitted,
    TResult? Function()? passwordResetRequested,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? loginSubmitted,
    TResult Function()? googleSignInSubmitted,
    TResult Function()? passwordResetRequested,
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
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(LoginSubmitted value) loginSubmitted,
    required TResult Function(GoogleSignInSubmitted value)
        googleSignInSubmitted,
    required TResult Function(PasswordResetRequested value)
        passwordResetRequested,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(LoginSubmitted value)? loginSubmitted,
    TResult? Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult? Function(PasswordResetRequested value)? passwordResetRequested,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(LoginSubmitted value)? loginSubmitted,
    TResult Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult Function(PasswordResetRequested value)? passwordResetRequested,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements LoginEvent {
  const factory EmailChanged(final String email) = _$EmailChangedImpl;

  String get email;

  /// Create a copy of LoginEvent
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
    extends _$LoginEventCopyWithImpl<$Res, _$PasswordChangedImpl>
    implements _$$PasswordChangedImplCopyWith<$Res> {
  __$$PasswordChangedImplCopyWithImpl(
      _$PasswordChangedImpl _value, $Res Function(_$PasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
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
    return 'LoginEvent.passwordChanged(password: $password)';
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

  /// Create a copy of LoginEvent
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
    required TResult Function() toggleShowPassword,
    required TResult Function() loginSubmitted,
    required TResult Function() googleSignInSubmitted,
    required TResult Function() passwordResetRequested,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? loginSubmitted,
    TResult? Function()? googleSignInSubmitted,
    TResult? Function()? passwordResetRequested,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? loginSubmitted,
    TResult Function()? googleSignInSubmitted,
    TResult Function()? passwordResetRequested,
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
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(LoginSubmitted value) loginSubmitted,
    required TResult Function(GoogleSignInSubmitted value)
        googleSignInSubmitted,
    required TResult Function(PasswordResetRequested value)
        passwordResetRequested,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(LoginSubmitted value)? loginSubmitted,
    TResult? Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult? Function(PasswordResetRequested value)? passwordResetRequested,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(LoginSubmitted value)? loginSubmitted,
    TResult Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult Function(PasswordResetRequested value)? passwordResetRequested,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements LoginEvent {
  const factory PasswordChanged(final String password) = _$PasswordChangedImpl;

  String get password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordChangedImplCopyWith<_$PasswordChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleShowPasswordImplCopyWith<$Res> {
  factory _$$ToggleShowPasswordImplCopyWith(_$ToggleShowPasswordImpl value,
          $Res Function(_$ToggleShowPasswordImpl) then) =
      __$$ToggleShowPasswordImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleShowPasswordImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$ToggleShowPasswordImpl>
    implements _$$ToggleShowPasswordImplCopyWith<$Res> {
  __$$ToggleShowPasswordImplCopyWithImpl(_$ToggleShowPasswordImpl _value,
      $Res Function(_$ToggleShowPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ToggleShowPasswordImpl implements ToggleShowPassword {
  const _$ToggleShowPasswordImpl();

  @override
  String toString() {
    return 'LoginEvent.toggleShowPassword()';
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
    required TResult Function() toggleShowPassword,
    required TResult Function() loginSubmitted,
    required TResult Function() googleSignInSubmitted,
    required TResult Function() passwordResetRequested,
  }) {
    return toggleShowPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? loginSubmitted,
    TResult? Function()? googleSignInSubmitted,
    TResult? Function()? passwordResetRequested,
  }) {
    return toggleShowPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? loginSubmitted,
    TResult Function()? googleSignInSubmitted,
    TResult Function()? passwordResetRequested,
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
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(LoginSubmitted value) loginSubmitted,
    required TResult Function(GoogleSignInSubmitted value)
        googleSignInSubmitted,
    required TResult Function(PasswordResetRequested value)
        passwordResetRequested,
  }) {
    return toggleShowPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(LoginSubmitted value)? loginSubmitted,
    TResult? Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult? Function(PasswordResetRequested value)? passwordResetRequested,
  }) {
    return toggleShowPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(LoginSubmitted value)? loginSubmitted,
    TResult Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult Function(PasswordResetRequested value)? passwordResetRequested,
    required TResult orElse(),
  }) {
    if (toggleShowPassword != null) {
      return toggleShowPassword(this);
    }
    return orElse();
  }
}

abstract class ToggleShowPassword implements LoginEvent {
  const factory ToggleShowPassword() = _$ToggleShowPasswordImpl;
}

/// @nodoc
abstract class _$$LoginSubmittedImplCopyWith<$Res> {
  factory _$$LoginSubmittedImplCopyWith(_$LoginSubmittedImpl value,
          $Res Function(_$LoginSubmittedImpl) then) =
      __$$LoginSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginSubmittedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginSubmittedImpl>
    implements _$$LoginSubmittedImplCopyWith<$Res> {
  __$$LoginSubmittedImplCopyWithImpl(
      _$LoginSubmittedImpl _value, $Res Function(_$LoginSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginSubmittedImpl implements LoginSubmitted {
  const _$LoginSubmittedImpl();

  @override
  String toString() {
    return 'LoginEvent.loginSubmitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() loginSubmitted,
    required TResult Function() googleSignInSubmitted,
    required TResult Function() passwordResetRequested,
  }) {
    return loginSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? loginSubmitted,
    TResult? Function()? googleSignInSubmitted,
    TResult? Function()? passwordResetRequested,
  }) {
    return loginSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? loginSubmitted,
    TResult Function()? googleSignInSubmitted,
    TResult Function()? passwordResetRequested,
    required TResult orElse(),
  }) {
    if (loginSubmitted != null) {
      return loginSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(LoginSubmitted value) loginSubmitted,
    required TResult Function(GoogleSignInSubmitted value)
        googleSignInSubmitted,
    required TResult Function(PasswordResetRequested value)
        passwordResetRequested,
  }) {
    return loginSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(LoginSubmitted value)? loginSubmitted,
    TResult? Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult? Function(PasswordResetRequested value)? passwordResetRequested,
  }) {
    return loginSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(LoginSubmitted value)? loginSubmitted,
    TResult Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult Function(PasswordResetRequested value)? passwordResetRequested,
    required TResult orElse(),
  }) {
    if (loginSubmitted != null) {
      return loginSubmitted(this);
    }
    return orElse();
  }
}

abstract class LoginSubmitted implements LoginEvent {
  const factory LoginSubmitted() = _$LoginSubmittedImpl;
}

/// @nodoc
abstract class _$$GoogleSignInSubmittedImplCopyWith<$Res> {
  factory _$$GoogleSignInSubmittedImplCopyWith(
          _$GoogleSignInSubmittedImpl value,
          $Res Function(_$GoogleSignInSubmittedImpl) then) =
      __$$GoogleSignInSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleSignInSubmittedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$GoogleSignInSubmittedImpl>
    implements _$$GoogleSignInSubmittedImplCopyWith<$Res> {
  __$$GoogleSignInSubmittedImplCopyWithImpl(_$GoogleSignInSubmittedImpl _value,
      $Res Function(_$GoogleSignInSubmittedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GoogleSignInSubmittedImpl implements GoogleSignInSubmitted {
  const _$GoogleSignInSubmittedImpl();

  @override
  String toString() {
    return 'LoginEvent.googleSignInSubmitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() loginSubmitted,
    required TResult Function() googleSignInSubmitted,
    required TResult Function() passwordResetRequested,
  }) {
    return googleSignInSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? loginSubmitted,
    TResult? Function()? googleSignInSubmitted,
    TResult? Function()? passwordResetRequested,
  }) {
    return googleSignInSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? loginSubmitted,
    TResult Function()? googleSignInSubmitted,
    TResult Function()? passwordResetRequested,
    required TResult orElse(),
  }) {
    if (googleSignInSubmitted != null) {
      return googleSignInSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(LoginSubmitted value) loginSubmitted,
    required TResult Function(GoogleSignInSubmitted value)
        googleSignInSubmitted,
    required TResult Function(PasswordResetRequested value)
        passwordResetRequested,
  }) {
    return googleSignInSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(LoginSubmitted value)? loginSubmitted,
    TResult? Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult? Function(PasswordResetRequested value)? passwordResetRequested,
  }) {
    return googleSignInSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(LoginSubmitted value)? loginSubmitted,
    TResult Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult Function(PasswordResetRequested value)? passwordResetRequested,
    required TResult orElse(),
  }) {
    if (googleSignInSubmitted != null) {
      return googleSignInSubmitted(this);
    }
    return orElse();
  }
}

abstract class GoogleSignInSubmitted implements LoginEvent {
  const factory GoogleSignInSubmitted() = _$GoogleSignInSubmittedImpl;
}

/// @nodoc
abstract class _$$PasswordResetRequestedImplCopyWith<$Res> {
  factory _$$PasswordResetRequestedImplCopyWith(
          _$PasswordResetRequestedImpl value,
          $Res Function(_$PasswordResetRequestedImpl) then) =
      __$$PasswordResetRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PasswordResetRequestedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$PasswordResetRequestedImpl>
    implements _$$PasswordResetRequestedImplCopyWith<$Res> {
  __$$PasswordResetRequestedImplCopyWithImpl(
      _$PasswordResetRequestedImpl _value,
      $Res Function(_$PasswordResetRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PasswordResetRequestedImpl implements PasswordResetRequested {
  const _$PasswordResetRequestedImpl();

  @override
  String toString() {
    return 'LoginEvent.passwordResetRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordResetRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() toggleShowPassword,
    required TResult Function() loginSubmitted,
    required TResult Function() googleSignInSubmitted,
    required TResult Function() passwordResetRequested,
  }) {
    return passwordResetRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? toggleShowPassword,
    TResult? Function()? loginSubmitted,
    TResult? Function()? googleSignInSubmitted,
    TResult? Function()? passwordResetRequested,
  }) {
    return passwordResetRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? toggleShowPassword,
    TResult Function()? loginSubmitted,
    TResult Function()? googleSignInSubmitted,
    TResult Function()? passwordResetRequested,
    required TResult orElse(),
  }) {
    if (passwordResetRequested != null) {
      return passwordResetRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(ToggleShowPassword value) toggleShowPassword,
    required TResult Function(LoginSubmitted value) loginSubmitted,
    required TResult Function(GoogleSignInSubmitted value)
        googleSignInSubmitted,
    required TResult Function(PasswordResetRequested value)
        passwordResetRequested,
  }) {
    return passwordResetRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmailChanged value)? emailChanged,
    TResult? Function(PasswordChanged value)? passwordChanged,
    TResult? Function(ToggleShowPassword value)? toggleShowPassword,
    TResult? Function(LoginSubmitted value)? loginSubmitted,
    TResult? Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult? Function(PasswordResetRequested value)? passwordResetRequested,
  }) {
    return passwordResetRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(ToggleShowPassword value)? toggleShowPassword,
    TResult Function(LoginSubmitted value)? loginSubmitted,
    TResult Function(GoogleSignInSubmitted value)? googleSignInSubmitted,
    TResult Function(PasswordResetRequested value)? passwordResetRequested,
    required TResult orElse(),
  }) {
    if (passwordResetRequested != null) {
      return passwordResetRequested(this);
    }
    return orElse();
  }
}

abstract class PasswordResetRequested implements LoginEvent {
  const factory PasswordResetRequested() = _$PasswordResetRequestedImpl;
}
