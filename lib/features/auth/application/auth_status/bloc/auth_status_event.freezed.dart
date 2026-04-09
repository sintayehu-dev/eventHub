// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_status_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthStatusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FirebaseUserEntity? user) authStateChanged,
    required TResult Function() signOut,
    required TResult Function() checkAuthStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FirebaseUserEntity? user)? authStateChanged,
    TResult? Function()? signOut,
    TResult? Function()? checkAuthStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FirebaseUserEntity? user)? authStateChanged,
    TResult Function()? signOut,
    TResult Function()? checkAuthStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateChanged value) authStateChanged,
    required TResult Function(SignOut value) signOut,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateChanged value)? authStateChanged,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateChanged value)? authStateChanged,
    TResult Function(SignOut value)? signOut,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusEventCopyWith<$Res> {
  factory $AuthStatusEventCopyWith(
          AuthStatusEvent value, $Res Function(AuthStatusEvent) then) =
      _$AuthStatusEventCopyWithImpl<$Res, AuthStatusEvent>;
}

/// @nodoc
class _$AuthStatusEventCopyWithImpl<$Res, $Val extends AuthStatusEvent>
    implements $AuthStatusEventCopyWith<$Res> {
  _$AuthStatusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStatusEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthStateChangedImplCopyWith<$Res> {
  factory _$$AuthStateChangedImplCopyWith(_$AuthStateChangedImpl value,
          $Res Function(_$AuthStateChangedImpl) then) =
      __$$AuthStateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FirebaseUserEntity? user});

  $FirebaseUserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthStateChangedImplCopyWithImpl<$Res>
    extends _$AuthStatusEventCopyWithImpl<$Res, _$AuthStateChangedImpl>
    implements _$$AuthStateChangedImplCopyWith<$Res> {
  __$$AuthStateChangedImplCopyWithImpl(_$AuthStateChangedImpl _value,
      $Res Function(_$AuthStateChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$AuthStateChangedImpl(
      freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as FirebaseUserEntity?,
    ));
  }

  /// Create a copy of AuthStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FirebaseUserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $FirebaseUserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$AuthStateChangedImpl implements AuthStateChanged {
  const _$AuthStateChangedImpl(this.user);

  @override
  final FirebaseUserEntity? user;

  @override
  String toString() {
    return 'AuthStatusEvent.authStateChanged(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateChangedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateChangedImplCopyWith<_$AuthStateChangedImpl> get copyWith =>
      __$$AuthStateChangedImplCopyWithImpl<_$AuthStateChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FirebaseUserEntity? user) authStateChanged,
    required TResult Function() signOut,
    required TResult Function() checkAuthStatus,
  }) {
    return authStateChanged(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FirebaseUserEntity? user)? authStateChanged,
    TResult? Function()? signOut,
    TResult? Function()? checkAuthStatus,
  }) {
    return authStateChanged?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FirebaseUserEntity? user)? authStateChanged,
    TResult Function()? signOut,
    TResult Function()? checkAuthStatus,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateChanged value) authStateChanged,
    required TResult Function(SignOut value) signOut,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
  }) {
    return authStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateChanged value)? authStateChanged,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
  }) {
    return authStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateChanged value)? authStateChanged,
    TResult Function(SignOut value)? signOut,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(this);
    }
    return orElse();
  }
}

abstract class AuthStateChanged implements AuthStatusEvent {
  const factory AuthStateChanged(final FirebaseUserEntity? user) =
      _$AuthStateChangedImpl;

  FirebaseUserEntity? get user;

  /// Create a copy of AuthStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateChangedImplCopyWith<_$AuthStateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutImplCopyWith<$Res> {
  factory _$$SignOutImplCopyWith(
          _$SignOutImpl value, $Res Function(_$SignOutImpl) then) =
      __$$SignOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutImplCopyWithImpl<$Res>
    extends _$AuthStatusEventCopyWithImpl<$Res, _$SignOutImpl>
    implements _$$SignOutImplCopyWith<$Res> {
  __$$SignOutImplCopyWithImpl(
      _$SignOutImpl _value, $Res Function(_$SignOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStatusEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignOutImpl implements SignOut {
  const _$SignOutImpl();

  @override
  String toString() {
    return 'AuthStatusEvent.signOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FirebaseUserEntity? user) authStateChanged,
    required TResult Function() signOut,
    required TResult Function() checkAuthStatus,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FirebaseUserEntity? user)? authStateChanged,
    TResult? Function()? signOut,
    TResult? Function()? checkAuthStatus,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FirebaseUserEntity? user)? authStateChanged,
    TResult Function()? signOut,
    TResult Function()? checkAuthStatus,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateChanged value) authStateChanged,
    required TResult Function(SignOut value) signOut,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateChanged value)? authStateChanged,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateChanged value)? authStateChanged,
    TResult Function(SignOut value)? signOut,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class SignOut implements AuthStatusEvent {
  const factory SignOut() = _$SignOutImpl;
}

/// @nodoc
abstract class _$$CheckAuthStatusImplCopyWith<$Res> {
  factory _$$CheckAuthStatusImplCopyWith(_$CheckAuthStatusImpl value,
          $Res Function(_$CheckAuthStatusImpl) then) =
      __$$CheckAuthStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthStatusImplCopyWithImpl<$Res>
    extends _$AuthStatusEventCopyWithImpl<$Res, _$CheckAuthStatusImpl>
    implements _$$CheckAuthStatusImplCopyWith<$Res> {
  __$$CheckAuthStatusImplCopyWithImpl(
      _$CheckAuthStatusImpl _value, $Res Function(_$CheckAuthStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStatusEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthStatusImpl implements CheckAuthStatus {
  const _$CheckAuthStatusImpl();

  @override
  String toString() {
    return 'AuthStatusEvent.checkAuthStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FirebaseUserEntity? user) authStateChanged,
    required TResult Function() signOut,
    required TResult Function() checkAuthStatus,
  }) {
    return checkAuthStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FirebaseUserEntity? user)? authStateChanged,
    TResult? Function()? signOut,
    TResult? Function()? checkAuthStatus,
  }) {
    return checkAuthStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FirebaseUserEntity? user)? authStateChanged,
    TResult Function()? signOut,
    TResult Function()? checkAuthStatus,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateChanged value) authStateChanged,
    required TResult Function(SignOut value) signOut,
    required TResult Function(CheckAuthStatus value) checkAuthStatus,
  }) {
    return checkAuthStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateChanged value)? authStateChanged,
    TResult? Function(SignOut value)? signOut,
    TResult? Function(CheckAuthStatus value)? checkAuthStatus,
  }) {
    return checkAuthStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateChanged value)? authStateChanged,
    TResult Function(SignOut value)? signOut,
    TResult Function(CheckAuthStatus value)? checkAuthStatus,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus(this);
    }
    return orElse();
  }
}

abstract class CheckAuthStatus implements AuthStatusEvent {
  const factory CheckAuthStatus() = _$CheckAuthStatusImpl;
}
