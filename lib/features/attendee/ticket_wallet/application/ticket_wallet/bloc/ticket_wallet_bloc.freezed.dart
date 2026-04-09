// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_wallet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TicketWalletEvent {
  String get userId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadWalletTickets,
    required TResult Function(String userId) loadUpcomingTickets,
    required TResult Function(String userId) loadPastTickets,
    required TResult Function(String userId, TicketStatus status)
        loadTicketsByStatus,
    required TResult Function(String userId, String query) searchTickets,
    required TResult Function(String userId) refreshWallet,
    required TResult Function(String userId) clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadWalletTickets,
    TResult? Function(String userId)? loadUpcomingTickets,
    TResult? Function(String userId)? loadPastTickets,
    TResult? Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult? Function(String userId, String query)? searchTickets,
    TResult? Function(String userId)? refreshWallet,
    TResult? Function(String userId)? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadWalletTickets,
    TResult Function(String userId)? loadUpcomingTickets,
    TResult Function(String userId)? loadPastTickets,
    TResult Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult Function(String userId, String query)? searchTickets,
    TResult Function(String userId)? refreshWallet,
    TResult Function(String userId)? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWalletTickets value) loadWalletTickets,
    required TResult Function(_LoadUpcomingTickets value) loadUpcomingTickets,
    required TResult Function(_LoadPastTickets value) loadPastTickets,
    required TResult Function(_LoadTicketsByStatus value) loadTicketsByStatus,
    required TResult Function(_SearchTickets value) searchTickets,
    required TResult Function(_RefreshWallet value) refreshWallet,
    required TResult Function(_ClearSearch value) clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult? Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult? Function(_LoadPastTickets value)? loadPastTickets,
    TResult? Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult? Function(_SearchTickets value)? searchTickets,
    TResult? Function(_RefreshWallet value)? refreshWallet,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult Function(_LoadPastTickets value)? loadPastTickets,
    TResult Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult Function(_SearchTickets value)? searchTickets,
    TResult Function(_RefreshWallet value)? refreshWallet,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketWalletEventCopyWith<TicketWalletEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketWalletEventCopyWith<$Res> {
  factory $TicketWalletEventCopyWith(
          TicketWalletEvent value, $Res Function(TicketWalletEvent) then) =
      _$TicketWalletEventCopyWithImpl<$Res, TicketWalletEvent>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class _$TicketWalletEventCopyWithImpl<$Res, $Val extends TicketWalletEvent>
    implements $TicketWalletEventCopyWith<$Res> {
  _$TicketWalletEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadWalletTicketsImplCopyWith<$Res>
    implements $TicketWalletEventCopyWith<$Res> {
  factory _$$LoadWalletTicketsImplCopyWith(_$LoadWalletTicketsImpl value,
          $Res Function(_$LoadWalletTicketsImpl) then) =
      __$$LoadWalletTicketsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadWalletTicketsImplCopyWithImpl<$Res>
    extends _$TicketWalletEventCopyWithImpl<$Res, _$LoadWalletTicketsImpl>
    implements _$$LoadWalletTicketsImplCopyWith<$Res> {
  __$$LoadWalletTicketsImplCopyWithImpl(_$LoadWalletTicketsImpl _value,
      $Res Function(_$LoadWalletTicketsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoadWalletTicketsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadWalletTicketsImpl implements _LoadWalletTickets {
  const _$LoadWalletTicketsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'TicketWalletEvent.loadWalletTickets(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadWalletTicketsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadWalletTicketsImplCopyWith<_$LoadWalletTicketsImpl> get copyWith =>
      __$$LoadWalletTicketsImplCopyWithImpl<_$LoadWalletTicketsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadWalletTickets,
    required TResult Function(String userId) loadUpcomingTickets,
    required TResult Function(String userId) loadPastTickets,
    required TResult Function(String userId, TicketStatus status)
        loadTicketsByStatus,
    required TResult Function(String userId, String query) searchTickets,
    required TResult Function(String userId) refreshWallet,
    required TResult Function(String userId) clearSearch,
  }) {
    return loadWalletTickets(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadWalletTickets,
    TResult? Function(String userId)? loadUpcomingTickets,
    TResult? Function(String userId)? loadPastTickets,
    TResult? Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult? Function(String userId, String query)? searchTickets,
    TResult? Function(String userId)? refreshWallet,
    TResult? Function(String userId)? clearSearch,
  }) {
    return loadWalletTickets?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadWalletTickets,
    TResult Function(String userId)? loadUpcomingTickets,
    TResult Function(String userId)? loadPastTickets,
    TResult Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult Function(String userId, String query)? searchTickets,
    TResult Function(String userId)? refreshWallet,
    TResult Function(String userId)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadWalletTickets != null) {
      return loadWalletTickets(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWalletTickets value) loadWalletTickets,
    required TResult Function(_LoadUpcomingTickets value) loadUpcomingTickets,
    required TResult Function(_LoadPastTickets value) loadPastTickets,
    required TResult Function(_LoadTicketsByStatus value) loadTicketsByStatus,
    required TResult Function(_SearchTickets value) searchTickets,
    required TResult Function(_RefreshWallet value) refreshWallet,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadWalletTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult? Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult? Function(_LoadPastTickets value)? loadPastTickets,
    TResult? Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult? Function(_SearchTickets value)? searchTickets,
    TResult? Function(_RefreshWallet value)? refreshWallet,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadWalletTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult Function(_LoadPastTickets value)? loadPastTickets,
    TResult Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult Function(_SearchTickets value)? searchTickets,
    TResult Function(_RefreshWallet value)? refreshWallet,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadWalletTickets != null) {
      return loadWalletTickets(this);
    }
    return orElse();
  }
}

abstract class _LoadWalletTickets implements TicketWalletEvent {
  const factory _LoadWalletTickets({required final String userId}) =
      _$LoadWalletTicketsImpl;

  @override
  String get userId;

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadWalletTicketsImplCopyWith<_$LoadWalletTicketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadUpcomingTicketsImplCopyWith<$Res>
    implements $TicketWalletEventCopyWith<$Res> {
  factory _$$LoadUpcomingTicketsImplCopyWith(_$LoadUpcomingTicketsImpl value,
          $Res Function(_$LoadUpcomingTicketsImpl) then) =
      __$$LoadUpcomingTicketsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadUpcomingTicketsImplCopyWithImpl<$Res>
    extends _$TicketWalletEventCopyWithImpl<$Res, _$LoadUpcomingTicketsImpl>
    implements _$$LoadUpcomingTicketsImplCopyWith<$Res> {
  __$$LoadUpcomingTicketsImplCopyWithImpl(_$LoadUpcomingTicketsImpl _value,
      $Res Function(_$LoadUpcomingTicketsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoadUpcomingTicketsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadUpcomingTicketsImpl implements _LoadUpcomingTickets {
  const _$LoadUpcomingTicketsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'TicketWalletEvent.loadUpcomingTickets(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUpcomingTicketsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUpcomingTicketsImplCopyWith<_$LoadUpcomingTicketsImpl> get copyWith =>
      __$$LoadUpcomingTicketsImplCopyWithImpl<_$LoadUpcomingTicketsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadWalletTickets,
    required TResult Function(String userId) loadUpcomingTickets,
    required TResult Function(String userId) loadPastTickets,
    required TResult Function(String userId, TicketStatus status)
        loadTicketsByStatus,
    required TResult Function(String userId, String query) searchTickets,
    required TResult Function(String userId) refreshWallet,
    required TResult Function(String userId) clearSearch,
  }) {
    return loadUpcomingTickets(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadWalletTickets,
    TResult? Function(String userId)? loadUpcomingTickets,
    TResult? Function(String userId)? loadPastTickets,
    TResult? Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult? Function(String userId, String query)? searchTickets,
    TResult? Function(String userId)? refreshWallet,
    TResult? Function(String userId)? clearSearch,
  }) {
    return loadUpcomingTickets?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadWalletTickets,
    TResult Function(String userId)? loadUpcomingTickets,
    TResult Function(String userId)? loadPastTickets,
    TResult Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult Function(String userId, String query)? searchTickets,
    TResult Function(String userId)? refreshWallet,
    TResult Function(String userId)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadUpcomingTickets != null) {
      return loadUpcomingTickets(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWalletTickets value) loadWalletTickets,
    required TResult Function(_LoadUpcomingTickets value) loadUpcomingTickets,
    required TResult Function(_LoadPastTickets value) loadPastTickets,
    required TResult Function(_LoadTicketsByStatus value) loadTicketsByStatus,
    required TResult Function(_SearchTickets value) searchTickets,
    required TResult Function(_RefreshWallet value) refreshWallet,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadUpcomingTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult? Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult? Function(_LoadPastTickets value)? loadPastTickets,
    TResult? Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult? Function(_SearchTickets value)? searchTickets,
    TResult? Function(_RefreshWallet value)? refreshWallet,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadUpcomingTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult Function(_LoadPastTickets value)? loadPastTickets,
    TResult Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult Function(_SearchTickets value)? searchTickets,
    TResult Function(_RefreshWallet value)? refreshWallet,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadUpcomingTickets != null) {
      return loadUpcomingTickets(this);
    }
    return orElse();
  }
}

abstract class _LoadUpcomingTickets implements TicketWalletEvent {
  const factory _LoadUpcomingTickets({required final String userId}) =
      _$LoadUpcomingTicketsImpl;

  @override
  String get userId;

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadUpcomingTicketsImplCopyWith<_$LoadUpcomingTicketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadPastTicketsImplCopyWith<$Res>
    implements $TicketWalletEventCopyWith<$Res> {
  factory _$$LoadPastTicketsImplCopyWith(_$LoadPastTicketsImpl value,
          $Res Function(_$LoadPastTicketsImpl) then) =
      __$$LoadPastTicketsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadPastTicketsImplCopyWithImpl<$Res>
    extends _$TicketWalletEventCopyWithImpl<$Res, _$LoadPastTicketsImpl>
    implements _$$LoadPastTicketsImplCopyWith<$Res> {
  __$$LoadPastTicketsImplCopyWithImpl(
      _$LoadPastTicketsImpl _value, $Res Function(_$LoadPastTicketsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoadPastTicketsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadPastTicketsImpl implements _LoadPastTickets {
  const _$LoadPastTicketsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'TicketWalletEvent.loadPastTickets(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPastTicketsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPastTicketsImplCopyWith<_$LoadPastTicketsImpl> get copyWith =>
      __$$LoadPastTicketsImplCopyWithImpl<_$LoadPastTicketsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadWalletTickets,
    required TResult Function(String userId) loadUpcomingTickets,
    required TResult Function(String userId) loadPastTickets,
    required TResult Function(String userId, TicketStatus status)
        loadTicketsByStatus,
    required TResult Function(String userId, String query) searchTickets,
    required TResult Function(String userId) refreshWallet,
    required TResult Function(String userId) clearSearch,
  }) {
    return loadPastTickets(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadWalletTickets,
    TResult? Function(String userId)? loadUpcomingTickets,
    TResult? Function(String userId)? loadPastTickets,
    TResult? Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult? Function(String userId, String query)? searchTickets,
    TResult? Function(String userId)? refreshWallet,
    TResult? Function(String userId)? clearSearch,
  }) {
    return loadPastTickets?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadWalletTickets,
    TResult Function(String userId)? loadUpcomingTickets,
    TResult Function(String userId)? loadPastTickets,
    TResult Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult Function(String userId, String query)? searchTickets,
    TResult Function(String userId)? refreshWallet,
    TResult Function(String userId)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadPastTickets != null) {
      return loadPastTickets(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWalletTickets value) loadWalletTickets,
    required TResult Function(_LoadUpcomingTickets value) loadUpcomingTickets,
    required TResult Function(_LoadPastTickets value) loadPastTickets,
    required TResult Function(_LoadTicketsByStatus value) loadTicketsByStatus,
    required TResult Function(_SearchTickets value) searchTickets,
    required TResult Function(_RefreshWallet value) refreshWallet,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadPastTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult? Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult? Function(_LoadPastTickets value)? loadPastTickets,
    TResult? Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult? Function(_SearchTickets value)? searchTickets,
    TResult? Function(_RefreshWallet value)? refreshWallet,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadPastTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult Function(_LoadPastTickets value)? loadPastTickets,
    TResult Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult Function(_SearchTickets value)? searchTickets,
    TResult Function(_RefreshWallet value)? refreshWallet,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadPastTickets != null) {
      return loadPastTickets(this);
    }
    return orElse();
  }
}

abstract class _LoadPastTickets implements TicketWalletEvent {
  const factory _LoadPastTickets({required final String userId}) =
      _$LoadPastTicketsImpl;

  @override
  String get userId;

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadPastTicketsImplCopyWith<_$LoadPastTicketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadTicketsByStatusImplCopyWith<$Res>
    implements $TicketWalletEventCopyWith<$Res> {
  factory _$$LoadTicketsByStatusImplCopyWith(_$LoadTicketsByStatusImpl value,
          $Res Function(_$LoadTicketsByStatusImpl) then) =
      __$$LoadTicketsByStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, TicketStatus status});
}

/// @nodoc
class __$$LoadTicketsByStatusImplCopyWithImpl<$Res>
    extends _$TicketWalletEventCopyWithImpl<$Res, _$LoadTicketsByStatusImpl>
    implements _$$LoadTicketsByStatusImplCopyWith<$Res> {
  __$$LoadTicketsByStatusImplCopyWithImpl(_$LoadTicketsByStatusImpl _value,
      $Res Function(_$LoadTicketsByStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
  }) {
    return _then(_$LoadTicketsByStatusImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketStatus,
    ));
  }
}

/// @nodoc

class _$LoadTicketsByStatusImpl implements _LoadTicketsByStatus {
  const _$LoadTicketsByStatusImpl({required this.userId, required this.status});

  @override
  final String userId;
  @override
  final TicketStatus status;

  @override
  String toString() {
    return 'TicketWalletEvent.loadTicketsByStatus(userId: $userId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTicketsByStatusImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, status);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTicketsByStatusImplCopyWith<_$LoadTicketsByStatusImpl> get copyWith =>
      __$$LoadTicketsByStatusImplCopyWithImpl<_$LoadTicketsByStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadWalletTickets,
    required TResult Function(String userId) loadUpcomingTickets,
    required TResult Function(String userId) loadPastTickets,
    required TResult Function(String userId, TicketStatus status)
        loadTicketsByStatus,
    required TResult Function(String userId, String query) searchTickets,
    required TResult Function(String userId) refreshWallet,
    required TResult Function(String userId) clearSearch,
  }) {
    return loadTicketsByStatus(userId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadWalletTickets,
    TResult? Function(String userId)? loadUpcomingTickets,
    TResult? Function(String userId)? loadPastTickets,
    TResult? Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult? Function(String userId, String query)? searchTickets,
    TResult? Function(String userId)? refreshWallet,
    TResult? Function(String userId)? clearSearch,
  }) {
    return loadTicketsByStatus?.call(userId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadWalletTickets,
    TResult Function(String userId)? loadUpcomingTickets,
    TResult Function(String userId)? loadPastTickets,
    TResult Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult Function(String userId, String query)? searchTickets,
    TResult Function(String userId)? refreshWallet,
    TResult Function(String userId)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadTicketsByStatus != null) {
      return loadTicketsByStatus(userId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWalletTickets value) loadWalletTickets,
    required TResult Function(_LoadUpcomingTickets value) loadUpcomingTickets,
    required TResult Function(_LoadPastTickets value) loadPastTickets,
    required TResult Function(_LoadTicketsByStatus value) loadTicketsByStatus,
    required TResult Function(_SearchTickets value) searchTickets,
    required TResult Function(_RefreshWallet value) refreshWallet,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return loadTicketsByStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult? Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult? Function(_LoadPastTickets value)? loadPastTickets,
    TResult? Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult? Function(_SearchTickets value)? searchTickets,
    TResult? Function(_RefreshWallet value)? refreshWallet,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return loadTicketsByStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult Function(_LoadPastTickets value)? loadPastTickets,
    TResult Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult Function(_SearchTickets value)? searchTickets,
    TResult Function(_RefreshWallet value)? refreshWallet,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (loadTicketsByStatus != null) {
      return loadTicketsByStatus(this);
    }
    return orElse();
  }
}

abstract class _LoadTicketsByStatus implements TicketWalletEvent {
  const factory _LoadTicketsByStatus(
      {required final String userId,
      required final TicketStatus status}) = _$LoadTicketsByStatusImpl;

  @override
  String get userId;
  TicketStatus get status;

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadTicketsByStatusImplCopyWith<_$LoadTicketsByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchTicketsImplCopyWith<$Res>
    implements $TicketWalletEventCopyWith<$Res> {
  factory _$$SearchTicketsImplCopyWith(
          _$SearchTicketsImpl value, $Res Function(_$SearchTicketsImpl) then) =
      __$$SearchTicketsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String query});
}

/// @nodoc
class __$$SearchTicketsImplCopyWithImpl<$Res>
    extends _$TicketWalletEventCopyWithImpl<$Res, _$SearchTicketsImpl>
    implements _$$SearchTicketsImplCopyWith<$Res> {
  __$$SearchTicketsImplCopyWithImpl(
      _$SearchTicketsImpl _value, $Res Function(_$SearchTicketsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? query = null,
  }) {
    return _then(_$SearchTicketsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchTicketsImpl implements _SearchTickets {
  const _$SearchTicketsImpl({required this.userId, required this.query});

  @override
  final String userId;
  @override
  final String query;

  @override
  String toString() {
    return 'TicketWalletEvent.searchTickets(userId: $userId, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTicketsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, query);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTicketsImplCopyWith<_$SearchTicketsImpl> get copyWith =>
      __$$SearchTicketsImplCopyWithImpl<_$SearchTicketsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadWalletTickets,
    required TResult Function(String userId) loadUpcomingTickets,
    required TResult Function(String userId) loadPastTickets,
    required TResult Function(String userId, TicketStatus status)
        loadTicketsByStatus,
    required TResult Function(String userId, String query) searchTickets,
    required TResult Function(String userId) refreshWallet,
    required TResult Function(String userId) clearSearch,
  }) {
    return searchTickets(userId, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadWalletTickets,
    TResult? Function(String userId)? loadUpcomingTickets,
    TResult? Function(String userId)? loadPastTickets,
    TResult? Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult? Function(String userId, String query)? searchTickets,
    TResult? Function(String userId)? refreshWallet,
    TResult? Function(String userId)? clearSearch,
  }) {
    return searchTickets?.call(userId, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadWalletTickets,
    TResult Function(String userId)? loadUpcomingTickets,
    TResult Function(String userId)? loadPastTickets,
    TResult Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult Function(String userId, String query)? searchTickets,
    TResult Function(String userId)? refreshWallet,
    TResult Function(String userId)? clearSearch,
    required TResult orElse(),
  }) {
    if (searchTickets != null) {
      return searchTickets(userId, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWalletTickets value) loadWalletTickets,
    required TResult Function(_LoadUpcomingTickets value) loadUpcomingTickets,
    required TResult Function(_LoadPastTickets value) loadPastTickets,
    required TResult Function(_LoadTicketsByStatus value) loadTicketsByStatus,
    required TResult Function(_SearchTickets value) searchTickets,
    required TResult Function(_RefreshWallet value) refreshWallet,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return searchTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult? Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult? Function(_LoadPastTickets value)? loadPastTickets,
    TResult? Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult? Function(_SearchTickets value)? searchTickets,
    TResult? Function(_RefreshWallet value)? refreshWallet,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return searchTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult Function(_LoadPastTickets value)? loadPastTickets,
    TResult Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult Function(_SearchTickets value)? searchTickets,
    TResult Function(_RefreshWallet value)? refreshWallet,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (searchTickets != null) {
      return searchTickets(this);
    }
    return orElse();
  }
}

abstract class _SearchTickets implements TicketWalletEvent {
  const factory _SearchTickets(
      {required final String userId,
      required final String query}) = _$SearchTicketsImpl;

  @override
  String get userId;
  String get query;

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTicketsImplCopyWith<_$SearchTicketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshWalletImplCopyWith<$Res>
    implements $TicketWalletEventCopyWith<$Res> {
  factory _$$RefreshWalletImplCopyWith(
          _$RefreshWalletImpl value, $Res Function(_$RefreshWalletImpl) then) =
      __$$RefreshWalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$RefreshWalletImplCopyWithImpl<$Res>
    extends _$TicketWalletEventCopyWithImpl<$Res, _$RefreshWalletImpl>
    implements _$$RefreshWalletImplCopyWith<$Res> {
  __$$RefreshWalletImplCopyWithImpl(
      _$RefreshWalletImpl _value, $Res Function(_$RefreshWalletImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$RefreshWalletImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshWalletImpl implements _RefreshWallet {
  const _$RefreshWalletImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'TicketWalletEvent.refreshWallet(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshWalletImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshWalletImplCopyWith<_$RefreshWalletImpl> get copyWith =>
      __$$RefreshWalletImplCopyWithImpl<_$RefreshWalletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadWalletTickets,
    required TResult Function(String userId) loadUpcomingTickets,
    required TResult Function(String userId) loadPastTickets,
    required TResult Function(String userId, TicketStatus status)
        loadTicketsByStatus,
    required TResult Function(String userId, String query) searchTickets,
    required TResult Function(String userId) refreshWallet,
    required TResult Function(String userId) clearSearch,
  }) {
    return refreshWallet(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadWalletTickets,
    TResult? Function(String userId)? loadUpcomingTickets,
    TResult? Function(String userId)? loadPastTickets,
    TResult? Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult? Function(String userId, String query)? searchTickets,
    TResult? Function(String userId)? refreshWallet,
    TResult? Function(String userId)? clearSearch,
  }) {
    return refreshWallet?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadWalletTickets,
    TResult Function(String userId)? loadUpcomingTickets,
    TResult Function(String userId)? loadPastTickets,
    TResult Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult Function(String userId, String query)? searchTickets,
    TResult Function(String userId)? refreshWallet,
    TResult Function(String userId)? clearSearch,
    required TResult orElse(),
  }) {
    if (refreshWallet != null) {
      return refreshWallet(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWalletTickets value) loadWalletTickets,
    required TResult Function(_LoadUpcomingTickets value) loadUpcomingTickets,
    required TResult Function(_LoadPastTickets value) loadPastTickets,
    required TResult Function(_LoadTicketsByStatus value) loadTicketsByStatus,
    required TResult Function(_SearchTickets value) searchTickets,
    required TResult Function(_RefreshWallet value) refreshWallet,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return refreshWallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult? Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult? Function(_LoadPastTickets value)? loadPastTickets,
    TResult? Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult? Function(_SearchTickets value)? searchTickets,
    TResult? Function(_RefreshWallet value)? refreshWallet,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return refreshWallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult Function(_LoadPastTickets value)? loadPastTickets,
    TResult Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult Function(_SearchTickets value)? searchTickets,
    TResult Function(_RefreshWallet value)? refreshWallet,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (refreshWallet != null) {
      return refreshWallet(this);
    }
    return orElse();
  }
}

abstract class _RefreshWallet implements TicketWalletEvent {
  const factory _RefreshWallet({required final String userId}) =
      _$RefreshWalletImpl;

  @override
  String get userId;

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshWalletImplCopyWith<_$RefreshWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res>
    implements $TicketWalletEventCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
          _$ClearSearchImpl value, $Res Function(_$ClearSearchImpl) then) =
      __$$ClearSearchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$TicketWalletEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
      _$ClearSearchImpl _value, $Res Function(_$ClearSearchImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$ClearSearchImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'TicketWalletEvent.clearSearch(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearSearchImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearSearchImplCopyWith<_$ClearSearchImpl> get copyWith =>
      __$$ClearSearchImplCopyWithImpl<_$ClearSearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadWalletTickets,
    required TResult Function(String userId) loadUpcomingTickets,
    required TResult Function(String userId) loadPastTickets,
    required TResult Function(String userId, TicketStatus status)
        loadTicketsByStatus,
    required TResult Function(String userId, String query) searchTickets,
    required TResult Function(String userId) refreshWallet,
    required TResult Function(String userId) clearSearch,
  }) {
    return clearSearch(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadWalletTickets,
    TResult? Function(String userId)? loadUpcomingTickets,
    TResult? Function(String userId)? loadPastTickets,
    TResult? Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult? Function(String userId, String query)? searchTickets,
    TResult? Function(String userId)? refreshWallet,
    TResult? Function(String userId)? clearSearch,
  }) {
    return clearSearch?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadWalletTickets,
    TResult Function(String userId)? loadUpcomingTickets,
    TResult Function(String userId)? loadPastTickets,
    TResult Function(String userId, TicketStatus status)? loadTicketsByStatus,
    TResult Function(String userId, String query)? searchTickets,
    TResult Function(String userId)? refreshWallet,
    TResult Function(String userId)? clearSearch,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadWalletTickets value) loadWalletTickets,
    required TResult Function(_LoadUpcomingTickets value) loadUpcomingTickets,
    required TResult Function(_LoadPastTickets value) loadPastTickets,
    required TResult Function(_LoadTicketsByStatus value) loadTicketsByStatus,
    required TResult Function(_SearchTickets value) searchTickets,
    required TResult Function(_RefreshWallet value) refreshWallet,
    required TResult Function(_ClearSearch value) clearSearch,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult? Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult? Function(_LoadPastTickets value)? loadPastTickets,
    TResult? Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult? Function(_SearchTickets value)? searchTickets,
    TResult? Function(_RefreshWallet value)? refreshWallet,
    TResult? Function(_ClearSearch value)? clearSearch,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadWalletTickets value)? loadWalletTickets,
    TResult Function(_LoadUpcomingTickets value)? loadUpcomingTickets,
    TResult Function(_LoadPastTickets value)? loadPastTickets,
    TResult Function(_LoadTicketsByStatus value)? loadTicketsByStatus,
    TResult Function(_SearchTickets value)? searchTickets,
    TResult Function(_RefreshWallet value)? refreshWallet,
    TResult Function(_ClearSearch value)? clearSearch,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements TicketWalletEvent {
  const factory _ClearSearch({required final String userId}) =
      _$ClearSearchImpl;

  @override
  String get userId;

  /// Create a copy of TicketWalletEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClearSearchImplCopyWith<_$ClearSearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TicketWalletState {
  List<TicketEntity> get tickets => throw _privateConstructorUsedError;
  TicketWalletData? get walletData => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  TicketFilterType get filterType => throw _privateConstructorUsedError;
  TicketStatus? get selectedStatus => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;

  /// Create a copy of TicketWalletState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketWalletStateCopyWith<TicketWalletState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketWalletStateCopyWith<$Res> {
  factory $TicketWalletStateCopyWith(
          TicketWalletState value, $Res Function(TicketWalletState) then) =
      _$TicketWalletStateCopyWithImpl<$Res, TicketWalletState>;
  @useResult
  $Res call(
      {List<TicketEntity> tickets,
      TicketWalletData? walletData,
      bool isLoading,
      bool isSearching,
      bool hasError,
      String errorMessage,
      TicketFilterType filterType,
      TicketStatus? selectedStatus,
      String searchQuery});
}

/// @nodoc
class _$TicketWalletStateCopyWithImpl<$Res, $Val extends TicketWalletState>
    implements $TicketWalletStateCopyWith<$Res> {
  _$TicketWalletStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketWalletState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? walletData = freezed,
    Object? isLoading = null,
    Object? isSearching = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? filterType = null,
    Object? selectedStatus = freezed,
    Object? searchQuery = null,
  }) {
    return _then(_value.copyWith(
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      walletData: freezed == walletData
          ? _value.walletData
          : walletData // ignore: cast_nullable_to_non_nullable
              as TicketWalletData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as TicketFilterType,
      selectedStatus: freezed == selectedStatus
          ? _value.selectedStatus
          : selectedStatus // ignore: cast_nullable_to_non_nullable
              as TicketStatus?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketWalletStateImplCopyWith<$Res>
    implements $TicketWalletStateCopyWith<$Res> {
  factory _$$TicketWalletStateImplCopyWith(_$TicketWalletStateImpl value,
          $Res Function(_$TicketWalletStateImpl) then) =
      __$$TicketWalletStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TicketEntity> tickets,
      TicketWalletData? walletData,
      bool isLoading,
      bool isSearching,
      bool hasError,
      String errorMessage,
      TicketFilterType filterType,
      TicketStatus? selectedStatus,
      String searchQuery});
}

/// @nodoc
class __$$TicketWalletStateImplCopyWithImpl<$Res>
    extends _$TicketWalletStateCopyWithImpl<$Res, _$TicketWalletStateImpl>
    implements _$$TicketWalletStateImplCopyWith<$Res> {
  __$$TicketWalletStateImplCopyWithImpl(_$TicketWalletStateImpl _value,
      $Res Function(_$TicketWalletStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketWalletState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? walletData = freezed,
    Object? isLoading = null,
    Object? isSearching = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? filterType = null,
    Object? selectedStatus = freezed,
    Object? searchQuery = null,
  }) {
    return _then(_$TicketWalletStateImpl(
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      walletData: freezed == walletData
          ? _value.walletData
          : walletData // ignore: cast_nullable_to_non_nullable
              as TicketWalletData?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      filterType: null == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as TicketFilterType,
      selectedStatus: freezed == selectedStatus
          ? _value.selectedStatus
          : selectedStatus // ignore: cast_nullable_to_non_nullable
              as TicketStatus?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TicketWalletStateImpl implements _TicketWalletState {
  const _$TicketWalletStateImpl(
      {final List<TicketEntity> tickets = const [],
      this.walletData,
      this.isLoading = false,
      this.isSearching = false,
      this.hasError = false,
      this.errorMessage = '',
      this.filterType = TicketFilterType.all,
      this.selectedStatus,
      this.searchQuery = ''})
      : _tickets = tickets;

  final List<TicketEntity> _tickets;
  @override
  @JsonKey()
  List<TicketEntity> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  final TicketWalletData? walletData;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  @JsonKey()
  final TicketFilterType filterType;
  @override
  final TicketStatus? selectedStatus;
  @override
  @JsonKey()
  final String searchQuery;

  @override
  String toString() {
    return 'TicketWalletState(tickets: $tickets, walletData: $walletData, isLoading: $isLoading, isSearching: $isSearching, hasError: $hasError, errorMessage: $errorMessage, filterType: $filterType, selectedStatus: $selectedStatus, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketWalletStateImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.walletData, walletData) ||
                other.walletData == walletData) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType) &&
            (identical(other.selectedStatus, selectedStatus) ||
                other.selectedStatus == selectedStatus) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tickets),
      walletData,
      isLoading,
      isSearching,
      hasError,
      errorMessage,
      filterType,
      selectedStatus,
      searchQuery);

  /// Create a copy of TicketWalletState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketWalletStateImplCopyWith<_$TicketWalletStateImpl> get copyWith =>
      __$$TicketWalletStateImplCopyWithImpl<_$TicketWalletStateImpl>(
          this, _$identity);
}

abstract class _TicketWalletState implements TicketWalletState {
  const factory _TicketWalletState(
      {final List<TicketEntity> tickets,
      final TicketWalletData? walletData,
      final bool isLoading,
      final bool isSearching,
      final bool hasError,
      final String errorMessage,
      final TicketFilterType filterType,
      final TicketStatus? selectedStatus,
      final String searchQuery}) = _$TicketWalletStateImpl;

  @override
  List<TicketEntity> get tickets;
  @override
  TicketWalletData? get walletData;
  @override
  bool get isLoading;
  @override
  bool get isSearching;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  TicketFilterType get filterType;
  @override
  TicketStatus? get selectedStatus;
  @override
  String get searchQuery;

  /// Create a copy of TicketWalletState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketWalletStateImplCopyWith<_$TicketWalletStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
