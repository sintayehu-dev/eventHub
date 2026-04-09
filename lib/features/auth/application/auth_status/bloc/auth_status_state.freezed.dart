// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthStatusState {
  FirebaseUserEntity? get user => throw _privateConstructorUsedError;
  AuthStatus get status => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of AuthStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStatusStateCopyWith<AuthStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStatusStateCopyWith<$Res> {
  factory $AuthStatusStateCopyWith(
          AuthStatusState value, $Res Function(AuthStatusState) then) =
      _$AuthStatusStateCopyWithImpl<$Res, AuthStatusState>;
  @useResult
  $Res call(
      {FirebaseUserEntity? user,
      AuthStatus status,
      bool isLoading,
      String errorMessage});

  $FirebaseUserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthStatusStateCopyWithImpl<$Res, $Val extends AuthStatusState>
    implements $AuthStatusStateCopyWith<$Res> {
  _$AuthStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? status = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as FirebaseUserEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of AuthStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FirebaseUserEntityCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $FirebaseUserEntityCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStatusStateImplCopyWith<$Res>
    implements $AuthStatusStateCopyWith<$Res> {
  factory _$$AuthStatusStateImplCopyWith(_$AuthStatusStateImpl value,
          $Res Function(_$AuthStatusStateImpl) then) =
      __$$AuthStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FirebaseUserEntity? user,
      AuthStatus status,
      bool isLoading,
      String errorMessage});

  @override
  $FirebaseUserEntityCopyWith<$Res>? get user;
}

/// @nodoc
class __$$AuthStatusStateImplCopyWithImpl<$Res>
    extends _$AuthStatusStateCopyWithImpl<$Res, _$AuthStatusStateImpl>
    implements _$$AuthStatusStateImplCopyWith<$Res> {
  __$$AuthStatusStateImplCopyWithImpl(
      _$AuthStatusStateImpl _value, $Res Function(_$AuthStatusStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? status = null,
    Object? isLoading = null,
    Object? errorMessage = null,
  }) {
    return _then(_$AuthStatusStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as FirebaseUserEntity?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthStatusStateImpl extends _AuthStatusState {
  const _$AuthStatusStateImpl(
      {this.user,
      this.status = AuthStatus.unknown,
      this.isLoading = false,
      this.errorMessage = ''})
      : super._();

  @override
  final FirebaseUserEntity? user;
  @override
  @JsonKey()
  final AuthStatus status;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String errorMessage;

  @override
  String toString() {
    return 'AuthStatusState(user: $user, status: $status, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStatusStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, user, status, isLoading, errorMessage);

  /// Create a copy of AuthStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStatusStateImplCopyWith<_$AuthStatusStateImpl> get copyWith =>
      __$$AuthStatusStateImplCopyWithImpl<_$AuthStatusStateImpl>(
          this, _$identity);
}

abstract class _AuthStatusState extends AuthStatusState {
  const factory _AuthStatusState(
      {final FirebaseUserEntity? user,
      final AuthStatus status,
      final bool isLoading,
      final String errorMessage}) = _$AuthStatusStateImpl;
  const _AuthStatusState._() : super._();

  @override
  FirebaseUserEntity? get user;
  @override
  AuthStatus get status;
  @override
  bool get isLoading;
  @override
  String get errorMessage;

  /// Create a copy of AuthStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStatusStateImplCopyWith<_$AuthStatusStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
