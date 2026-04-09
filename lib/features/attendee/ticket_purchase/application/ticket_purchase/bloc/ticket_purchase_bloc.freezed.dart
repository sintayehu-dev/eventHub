// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_purchase_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TicketPurchaseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseTicketRequest request, String userId)
        purchaseTickets,
    required TResult Function(String userId) loadUserTickets,
    required TResult Function(String userId, String eventId) loadEventTickets,
    required TResult Function(String ticketId, String userId) loadTicketDetails,
    required TResult Function(String ticketId, String userId) cancelTicket,
    required TResult Function(String ticketId, String userId) checkInTicket,
    required TResult Function(String qrCode) validateTicketQR,
    required TResult Function(String userId) refreshTickets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult? Function(String userId)? loadUserTickets,
    TResult? Function(String userId, String eventId)? loadEventTickets,
    TResult? Function(String ticketId, String userId)? loadTicketDetails,
    TResult? Function(String ticketId, String userId)? cancelTicket,
    TResult? Function(String ticketId, String userId)? checkInTicket,
    TResult? Function(String qrCode)? validateTicketQR,
    TResult? Function(String userId)? refreshTickets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult Function(String userId)? loadUserTickets,
    TResult Function(String userId, String eventId)? loadEventTickets,
    TResult Function(String ticketId, String userId)? loadTicketDetails,
    TResult Function(String ticketId, String userId)? cancelTicket,
    TResult Function(String ticketId, String userId)? checkInTicket,
    TResult Function(String qrCode)? validateTicketQR,
    TResult Function(String userId)? refreshTickets,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseTickets value) purchaseTickets,
    required TResult Function(_LoadUserTickets value) loadUserTickets,
    required TResult Function(_LoadEventTickets value) loadEventTickets,
    required TResult Function(_LoadTicketDetails value) loadTicketDetails,
    required TResult Function(_CancelTicket value) cancelTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_ValidateTicketQR value) validateTicketQR,
    required TResult Function(_RefreshTickets value) refreshTickets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseTickets value)? purchaseTickets,
    TResult? Function(_LoadUserTickets value)? loadUserTickets,
    TResult? Function(_LoadEventTickets value)? loadEventTickets,
    TResult? Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult? Function(_CancelTicket value)? cancelTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_ValidateTicketQR value)? validateTicketQR,
    TResult? Function(_RefreshTickets value)? refreshTickets,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseTickets value)? purchaseTickets,
    TResult Function(_LoadUserTickets value)? loadUserTickets,
    TResult Function(_LoadEventTickets value)? loadEventTickets,
    TResult Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult Function(_CancelTicket value)? cancelTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_ValidateTicketQR value)? validateTicketQR,
    TResult Function(_RefreshTickets value)? refreshTickets,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketPurchaseEventCopyWith<$Res> {
  factory $TicketPurchaseEventCopyWith(
          TicketPurchaseEvent value, $Res Function(TicketPurchaseEvent) then) =
      _$TicketPurchaseEventCopyWithImpl<$Res, TicketPurchaseEvent>;
}

/// @nodoc
class _$TicketPurchaseEventCopyWithImpl<$Res, $Val extends TicketPurchaseEvent>
    implements $TicketPurchaseEventCopyWith<$Res> {
  _$TicketPurchaseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PurchaseTicketsImplCopyWith<$Res> {
  factory _$$PurchaseTicketsImplCopyWith(_$PurchaseTicketsImpl value,
          $Res Function(_$PurchaseTicketsImpl) then) =
      __$$PurchaseTicketsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseTicketRequest request, String userId});

  $PurchaseTicketRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$PurchaseTicketsImplCopyWithImpl<$Res>
    extends _$TicketPurchaseEventCopyWithImpl<$Res, _$PurchaseTicketsImpl>
    implements _$$PurchaseTicketsImplCopyWith<$Res> {
  __$$PurchaseTicketsImplCopyWithImpl(
      _$PurchaseTicketsImpl _value, $Res Function(_$PurchaseTicketsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
    Object? userId = null,
  }) {
    return _then(_$PurchaseTicketsImpl(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as PurchaseTicketRequest,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseTicketRequestCopyWith<$Res> get request {
    return $PurchaseTicketRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$PurchaseTicketsImpl implements _PurchaseTickets {
  const _$PurchaseTicketsImpl({required this.request, required this.userId});

  @override
  final PurchaseTicketRequest request;
  @override
  final String userId;

  @override
  String toString() {
    return 'TicketPurchaseEvent.purchaseTickets(request: $request, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseTicketsImpl &&
            (identical(other.request, request) || other.request == request) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request, userId);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseTicketsImplCopyWith<_$PurchaseTicketsImpl> get copyWith =>
      __$$PurchaseTicketsImplCopyWithImpl<_$PurchaseTicketsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseTicketRequest request, String userId)
        purchaseTickets,
    required TResult Function(String userId) loadUserTickets,
    required TResult Function(String userId, String eventId) loadEventTickets,
    required TResult Function(String ticketId, String userId) loadTicketDetails,
    required TResult Function(String ticketId, String userId) cancelTicket,
    required TResult Function(String ticketId, String userId) checkInTicket,
    required TResult Function(String qrCode) validateTicketQR,
    required TResult Function(String userId) refreshTickets,
  }) {
    return purchaseTickets(request, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult? Function(String userId)? loadUserTickets,
    TResult? Function(String userId, String eventId)? loadEventTickets,
    TResult? Function(String ticketId, String userId)? loadTicketDetails,
    TResult? Function(String ticketId, String userId)? cancelTicket,
    TResult? Function(String ticketId, String userId)? checkInTicket,
    TResult? Function(String qrCode)? validateTicketQR,
    TResult? Function(String userId)? refreshTickets,
  }) {
    return purchaseTickets?.call(request, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult Function(String userId)? loadUserTickets,
    TResult Function(String userId, String eventId)? loadEventTickets,
    TResult Function(String ticketId, String userId)? loadTicketDetails,
    TResult Function(String ticketId, String userId)? cancelTicket,
    TResult Function(String ticketId, String userId)? checkInTicket,
    TResult Function(String qrCode)? validateTicketQR,
    TResult Function(String userId)? refreshTickets,
    required TResult orElse(),
  }) {
    if (purchaseTickets != null) {
      return purchaseTickets(request, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseTickets value) purchaseTickets,
    required TResult Function(_LoadUserTickets value) loadUserTickets,
    required TResult Function(_LoadEventTickets value) loadEventTickets,
    required TResult Function(_LoadTicketDetails value) loadTicketDetails,
    required TResult Function(_CancelTicket value) cancelTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_ValidateTicketQR value) validateTicketQR,
    required TResult Function(_RefreshTickets value) refreshTickets,
  }) {
    return purchaseTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseTickets value)? purchaseTickets,
    TResult? Function(_LoadUserTickets value)? loadUserTickets,
    TResult? Function(_LoadEventTickets value)? loadEventTickets,
    TResult? Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult? Function(_CancelTicket value)? cancelTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_ValidateTicketQR value)? validateTicketQR,
    TResult? Function(_RefreshTickets value)? refreshTickets,
  }) {
    return purchaseTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseTickets value)? purchaseTickets,
    TResult Function(_LoadUserTickets value)? loadUserTickets,
    TResult Function(_LoadEventTickets value)? loadEventTickets,
    TResult Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult Function(_CancelTicket value)? cancelTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_ValidateTicketQR value)? validateTicketQR,
    TResult Function(_RefreshTickets value)? refreshTickets,
    required TResult orElse(),
  }) {
    if (purchaseTickets != null) {
      return purchaseTickets(this);
    }
    return orElse();
  }
}

abstract class _PurchaseTickets implements TicketPurchaseEvent {
  const factory _PurchaseTickets(
      {required final PurchaseTicketRequest request,
      required final String userId}) = _$PurchaseTicketsImpl;

  PurchaseTicketRequest get request;
  String get userId;

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseTicketsImplCopyWith<_$PurchaseTicketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadUserTicketsImplCopyWith<$Res> {
  factory _$$LoadUserTicketsImplCopyWith(_$LoadUserTicketsImpl value,
          $Res Function(_$LoadUserTicketsImpl) then) =
      __$$LoadUserTicketsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadUserTicketsImplCopyWithImpl<$Res>
    extends _$TicketPurchaseEventCopyWithImpl<$Res, _$LoadUserTicketsImpl>
    implements _$$LoadUserTicketsImplCopyWith<$Res> {
  __$$LoadUserTicketsImplCopyWithImpl(
      _$LoadUserTicketsImpl _value, $Res Function(_$LoadUserTicketsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoadUserTicketsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadUserTicketsImpl implements _LoadUserTickets {
  const _$LoadUserTicketsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'TicketPurchaseEvent.loadUserTickets(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUserTicketsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUserTicketsImplCopyWith<_$LoadUserTicketsImpl> get copyWith =>
      __$$LoadUserTicketsImplCopyWithImpl<_$LoadUserTicketsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseTicketRequest request, String userId)
        purchaseTickets,
    required TResult Function(String userId) loadUserTickets,
    required TResult Function(String userId, String eventId) loadEventTickets,
    required TResult Function(String ticketId, String userId) loadTicketDetails,
    required TResult Function(String ticketId, String userId) cancelTicket,
    required TResult Function(String ticketId, String userId) checkInTicket,
    required TResult Function(String qrCode) validateTicketQR,
    required TResult Function(String userId) refreshTickets,
  }) {
    return loadUserTickets(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult? Function(String userId)? loadUserTickets,
    TResult? Function(String userId, String eventId)? loadEventTickets,
    TResult? Function(String ticketId, String userId)? loadTicketDetails,
    TResult? Function(String ticketId, String userId)? cancelTicket,
    TResult? Function(String ticketId, String userId)? checkInTicket,
    TResult? Function(String qrCode)? validateTicketQR,
    TResult? Function(String userId)? refreshTickets,
  }) {
    return loadUserTickets?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult Function(String userId)? loadUserTickets,
    TResult Function(String userId, String eventId)? loadEventTickets,
    TResult Function(String ticketId, String userId)? loadTicketDetails,
    TResult Function(String ticketId, String userId)? cancelTicket,
    TResult Function(String ticketId, String userId)? checkInTicket,
    TResult Function(String qrCode)? validateTicketQR,
    TResult Function(String userId)? refreshTickets,
    required TResult orElse(),
  }) {
    if (loadUserTickets != null) {
      return loadUserTickets(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseTickets value) purchaseTickets,
    required TResult Function(_LoadUserTickets value) loadUserTickets,
    required TResult Function(_LoadEventTickets value) loadEventTickets,
    required TResult Function(_LoadTicketDetails value) loadTicketDetails,
    required TResult Function(_CancelTicket value) cancelTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_ValidateTicketQR value) validateTicketQR,
    required TResult Function(_RefreshTickets value) refreshTickets,
  }) {
    return loadUserTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseTickets value)? purchaseTickets,
    TResult? Function(_LoadUserTickets value)? loadUserTickets,
    TResult? Function(_LoadEventTickets value)? loadEventTickets,
    TResult? Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult? Function(_CancelTicket value)? cancelTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_ValidateTicketQR value)? validateTicketQR,
    TResult? Function(_RefreshTickets value)? refreshTickets,
  }) {
    return loadUserTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseTickets value)? purchaseTickets,
    TResult Function(_LoadUserTickets value)? loadUserTickets,
    TResult Function(_LoadEventTickets value)? loadEventTickets,
    TResult Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult Function(_CancelTicket value)? cancelTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_ValidateTicketQR value)? validateTicketQR,
    TResult Function(_RefreshTickets value)? refreshTickets,
    required TResult orElse(),
  }) {
    if (loadUserTickets != null) {
      return loadUserTickets(this);
    }
    return orElse();
  }
}

abstract class _LoadUserTickets implements TicketPurchaseEvent {
  const factory _LoadUserTickets({required final String userId}) =
      _$LoadUserTicketsImpl;

  String get userId;

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadUserTicketsImplCopyWith<_$LoadUserTicketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadEventTicketsImplCopyWith<$Res> {
  factory _$$LoadEventTicketsImplCopyWith(_$LoadEventTicketsImpl value,
          $Res Function(_$LoadEventTicketsImpl) then) =
      __$$LoadEventTicketsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String eventId});
}

/// @nodoc
class __$$LoadEventTicketsImplCopyWithImpl<$Res>
    extends _$TicketPurchaseEventCopyWithImpl<$Res, _$LoadEventTicketsImpl>
    implements _$$LoadEventTicketsImplCopyWith<$Res> {
  __$$LoadEventTicketsImplCopyWithImpl(_$LoadEventTicketsImpl _value,
      $Res Function(_$LoadEventTicketsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? eventId = null,
  }) {
    return _then(_$LoadEventTicketsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadEventTicketsImpl implements _LoadEventTickets {
  const _$LoadEventTicketsImpl({required this.userId, required this.eventId});

  @override
  final String userId;
  @override
  final String eventId;

  @override
  String toString() {
    return 'TicketPurchaseEvent.loadEventTickets(userId: $userId, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventTicketsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, eventId);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventTicketsImplCopyWith<_$LoadEventTicketsImpl> get copyWith =>
      __$$LoadEventTicketsImplCopyWithImpl<_$LoadEventTicketsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseTicketRequest request, String userId)
        purchaseTickets,
    required TResult Function(String userId) loadUserTickets,
    required TResult Function(String userId, String eventId) loadEventTickets,
    required TResult Function(String ticketId, String userId) loadTicketDetails,
    required TResult Function(String ticketId, String userId) cancelTicket,
    required TResult Function(String ticketId, String userId) checkInTicket,
    required TResult Function(String qrCode) validateTicketQR,
    required TResult Function(String userId) refreshTickets,
  }) {
    return loadEventTickets(userId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult? Function(String userId)? loadUserTickets,
    TResult? Function(String userId, String eventId)? loadEventTickets,
    TResult? Function(String ticketId, String userId)? loadTicketDetails,
    TResult? Function(String ticketId, String userId)? cancelTicket,
    TResult? Function(String ticketId, String userId)? checkInTicket,
    TResult? Function(String qrCode)? validateTicketQR,
    TResult? Function(String userId)? refreshTickets,
  }) {
    return loadEventTickets?.call(userId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult Function(String userId)? loadUserTickets,
    TResult Function(String userId, String eventId)? loadEventTickets,
    TResult Function(String ticketId, String userId)? loadTicketDetails,
    TResult Function(String ticketId, String userId)? cancelTicket,
    TResult Function(String ticketId, String userId)? checkInTicket,
    TResult Function(String qrCode)? validateTicketQR,
    TResult Function(String userId)? refreshTickets,
    required TResult orElse(),
  }) {
    if (loadEventTickets != null) {
      return loadEventTickets(userId, eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseTickets value) purchaseTickets,
    required TResult Function(_LoadUserTickets value) loadUserTickets,
    required TResult Function(_LoadEventTickets value) loadEventTickets,
    required TResult Function(_LoadTicketDetails value) loadTicketDetails,
    required TResult Function(_CancelTicket value) cancelTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_ValidateTicketQR value) validateTicketQR,
    required TResult Function(_RefreshTickets value) refreshTickets,
  }) {
    return loadEventTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseTickets value)? purchaseTickets,
    TResult? Function(_LoadUserTickets value)? loadUserTickets,
    TResult? Function(_LoadEventTickets value)? loadEventTickets,
    TResult? Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult? Function(_CancelTicket value)? cancelTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_ValidateTicketQR value)? validateTicketQR,
    TResult? Function(_RefreshTickets value)? refreshTickets,
  }) {
    return loadEventTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseTickets value)? purchaseTickets,
    TResult Function(_LoadUserTickets value)? loadUserTickets,
    TResult Function(_LoadEventTickets value)? loadEventTickets,
    TResult Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult Function(_CancelTicket value)? cancelTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_ValidateTicketQR value)? validateTicketQR,
    TResult Function(_RefreshTickets value)? refreshTickets,
    required TResult orElse(),
  }) {
    if (loadEventTickets != null) {
      return loadEventTickets(this);
    }
    return orElse();
  }
}

abstract class _LoadEventTickets implements TicketPurchaseEvent {
  const factory _LoadEventTickets(
      {required final String userId,
      required final String eventId}) = _$LoadEventTicketsImpl;

  String get userId;
  String get eventId;

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadEventTicketsImplCopyWith<_$LoadEventTicketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadTicketDetailsImplCopyWith<$Res> {
  factory _$$LoadTicketDetailsImplCopyWith(_$LoadTicketDetailsImpl value,
          $Res Function(_$LoadTicketDetailsImpl) then) =
      __$$LoadTicketDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ticketId, String userId});
}

/// @nodoc
class __$$LoadTicketDetailsImplCopyWithImpl<$Res>
    extends _$TicketPurchaseEventCopyWithImpl<$Res, _$LoadTicketDetailsImpl>
    implements _$$LoadTicketDetailsImplCopyWith<$Res> {
  __$$LoadTicketDetailsImplCopyWithImpl(_$LoadTicketDetailsImpl _value,
      $Res Function(_$LoadTicketDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = null,
    Object? userId = null,
  }) {
    return _then(_$LoadTicketDetailsImpl(
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadTicketDetailsImpl implements _LoadTicketDetails {
  const _$LoadTicketDetailsImpl({required this.ticketId, required this.userId});

  @override
  final String ticketId;
  @override
  final String userId;

  @override
  String toString() {
    return 'TicketPurchaseEvent.loadTicketDetails(ticketId: $ticketId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTicketDetailsImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketId, userId);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTicketDetailsImplCopyWith<_$LoadTicketDetailsImpl> get copyWith =>
      __$$LoadTicketDetailsImplCopyWithImpl<_$LoadTicketDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseTicketRequest request, String userId)
        purchaseTickets,
    required TResult Function(String userId) loadUserTickets,
    required TResult Function(String userId, String eventId) loadEventTickets,
    required TResult Function(String ticketId, String userId) loadTicketDetails,
    required TResult Function(String ticketId, String userId) cancelTicket,
    required TResult Function(String ticketId, String userId) checkInTicket,
    required TResult Function(String qrCode) validateTicketQR,
    required TResult Function(String userId) refreshTickets,
  }) {
    return loadTicketDetails(ticketId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult? Function(String userId)? loadUserTickets,
    TResult? Function(String userId, String eventId)? loadEventTickets,
    TResult? Function(String ticketId, String userId)? loadTicketDetails,
    TResult? Function(String ticketId, String userId)? cancelTicket,
    TResult? Function(String ticketId, String userId)? checkInTicket,
    TResult? Function(String qrCode)? validateTicketQR,
    TResult? Function(String userId)? refreshTickets,
  }) {
    return loadTicketDetails?.call(ticketId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult Function(String userId)? loadUserTickets,
    TResult Function(String userId, String eventId)? loadEventTickets,
    TResult Function(String ticketId, String userId)? loadTicketDetails,
    TResult Function(String ticketId, String userId)? cancelTicket,
    TResult Function(String ticketId, String userId)? checkInTicket,
    TResult Function(String qrCode)? validateTicketQR,
    TResult Function(String userId)? refreshTickets,
    required TResult orElse(),
  }) {
    if (loadTicketDetails != null) {
      return loadTicketDetails(ticketId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseTickets value) purchaseTickets,
    required TResult Function(_LoadUserTickets value) loadUserTickets,
    required TResult Function(_LoadEventTickets value) loadEventTickets,
    required TResult Function(_LoadTicketDetails value) loadTicketDetails,
    required TResult Function(_CancelTicket value) cancelTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_ValidateTicketQR value) validateTicketQR,
    required TResult Function(_RefreshTickets value) refreshTickets,
  }) {
    return loadTicketDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseTickets value)? purchaseTickets,
    TResult? Function(_LoadUserTickets value)? loadUserTickets,
    TResult? Function(_LoadEventTickets value)? loadEventTickets,
    TResult? Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult? Function(_CancelTicket value)? cancelTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_ValidateTicketQR value)? validateTicketQR,
    TResult? Function(_RefreshTickets value)? refreshTickets,
  }) {
    return loadTicketDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseTickets value)? purchaseTickets,
    TResult Function(_LoadUserTickets value)? loadUserTickets,
    TResult Function(_LoadEventTickets value)? loadEventTickets,
    TResult Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult Function(_CancelTicket value)? cancelTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_ValidateTicketQR value)? validateTicketQR,
    TResult Function(_RefreshTickets value)? refreshTickets,
    required TResult orElse(),
  }) {
    if (loadTicketDetails != null) {
      return loadTicketDetails(this);
    }
    return orElse();
  }
}

abstract class _LoadTicketDetails implements TicketPurchaseEvent {
  const factory _LoadTicketDetails(
      {required final String ticketId,
      required final String userId}) = _$LoadTicketDetailsImpl;

  String get ticketId;
  String get userId;

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadTicketDetailsImplCopyWith<_$LoadTicketDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelTicketImplCopyWith<$Res> {
  factory _$$CancelTicketImplCopyWith(
          _$CancelTicketImpl value, $Res Function(_$CancelTicketImpl) then) =
      __$$CancelTicketImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ticketId, String userId});
}

/// @nodoc
class __$$CancelTicketImplCopyWithImpl<$Res>
    extends _$TicketPurchaseEventCopyWithImpl<$Res, _$CancelTicketImpl>
    implements _$$CancelTicketImplCopyWith<$Res> {
  __$$CancelTicketImplCopyWithImpl(
      _$CancelTicketImpl _value, $Res Function(_$CancelTicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = null,
    Object? userId = null,
  }) {
    return _then(_$CancelTicketImpl(
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelTicketImpl implements _CancelTicket {
  const _$CancelTicketImpl({required this.ticketId, required this.userId});

  @override
  final String ticketId;
  @override
  final String userId;

  @override
  String toString() {
    return 'TicketPurchaseEvent.cancelTicket(ticketId: $ticketId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelTicketImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketId, userId);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelTicketImplCopyWith<_$CancelTicketImpl> get copyWith =>
      __$$CancelTicketImplCopyWithImpl<_$CancelTicketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseTicketRequest request, String userId)
        purchaseTickets,
    required TResult Function(String userId) loadUserTickets,
    required TResult Function(String userId, String eventId) loadEventTickets,
    required TResult Function(String ticketId, String userId) loadTicketDetails,
    required TResult Function(String ticketId, String userId) cancelTicket,
    required TResult Function(String ticketId, String userId) checkInTicket,
    required TResult Function(String qrCode) validateTicketQR,
    required TResult Function(String userId) refreshTickets,
  }) {
    return cancelTicket(ticketId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult? Function(String userId)? loadUserTickets,
    TResult? Function(String userId, String eventId)? loadEventTickets,
    TResult? Function(String ticketId, String userId)? loadTicketDetails,
    TResult? Function(String ticketId, String userId)? cancelTicket,
    TResult? Function(String ticketId, String userId)? checkInTicket,
    TResult? Function(String qrCode)? validateTicketQR,
    TResult? Function(String userId)? refreshTickets,
  }) {
    return cancelTicket?.call(ticketId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult Function(String userId)? loadUserTickets,
    TResult Function(String userId, String eventId)? loadEventTickets,
    TResult Function(String ticketId, String userId)? loadTicketDetails,
    TResult Function(String ticketId, String userId)? cancelTicket,
    TResult Function(String ticketId, String userId)? checkInTicket,
    TResult Function(String qrCode)? validateTicketQR,
    TResult Function(String userId)? refreshTickets,
    required TResult orElse(),
  }) {
    if (cancelTicket != null) {
      return cancelTicket(ticketId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseTickets value) purchaseTickets,
    required TResult Function(_LoadUserTickets value) loadUserTickets,
    required TResult Function(_LoadEventTickets value) loadEventTickets,
    required TResult Function(_LoadTicketDetails value) loadTicketDetails,
    required TResult Function(_CancelTicket value) cancelTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_ValidateTicketQR value) validateTicketQR,
    required TResult Function(_RefreshTickets value) refreshTickets,
  }) {
    return cancelTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseTickets value)? purchaseTickets,
    TResult? Function(_LoadUserTickets value)? loadUserTickets,
    TResult? Function(_LoadEventTickets value)? loadEventTickets,
    TResult? Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult? Function(_CancelTicket value)? cancelTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_ValidateTicketQR value)? validateTicketQR,
    TResult? Function(_RefreshTickets value)? refreshTickets,
  }) {
    return cancelTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseTickets value)? purchaseTickets,
    TResult Function(_LoadUserTickets value)? loadUserTickets,
    TResult Function(_LoadEventTickets value)? loadEventTickets,
    TResult Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult Function(_CancelTicket value)? cancelTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_ValidateTicketQR value)? validateTicketQR,
    TResult Function(_RefreshTickets value)? refreshTickets,
    required TResult orElse(),
  }) {
    if (cancelTicket != null) {
      return cancelTicket(this);
    }
    return orElse();
  }
}

abstract class _CancelTicket implements TicketPurchaseEvent {
  const factory _CancelTicket(
      {required final String ticketId,
      required final String userId}) = _$CancelTicketImpl;

  String get ticketId;
  String get userId;

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelTicketImplCopyWith<_$CancelTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckInTicketImplCopyWith<$Res> {
  factory _$$CheckInTicketImplCopyWith(
          _$CheckInTicketImpl value, $Res Function(_$CheckInTicketImpl) then) =
      __$$CheckInTicketImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String ticketId, String userId});
}

/// @nodoc
class __$$CheckInTicketImplCopyWithImpl<$Res>
    extends _$TicketPurchaseEventCopyWithImpl<$Res, _$CheckInTicketImpl>
    implements _$$CheckInTicketImplCopyWith<$Res> {
  __$$CheckInTicketImplCopyWithImpl(
      _$CheckInTicketImpl _value, $Res Function(_$CheckInTicketImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticketId = null,
    Object? userId = null,
  }) {
    return _then(_$CheckInTicketImpl(
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckInTicketImpl implements _CheckInTicket {
  const _$CheckInTicketImpl({required this.ticketId, required this.userId});

  @override
  final String ticketId;
  @override
  final String userId;

  @override
  String toString() {
    return 'TicketPurchaseEvent.checkInTicket(ticketId: $ticketId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInTicketImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketId, userId);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInTicketImplCopyWith<_$CheckInTicketImpl> get copyWith =>
      __$$CheckInTicketImplCopyWithImpl<_$CheckInTicketImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseTicketRequest request, String userId)
        purchaseTickets,
    required TResult Function(String userId) loadUserTickets,
    required TResult Function(String userId, String eventId) loadEventTickets,
    required TResult Function(String ticketId, String userId) loadTicketDetails,
    required TResult Function(String ticketId, String userId) cancelTicket,
    required TResult Function(String ticketId, String userId) checkInTicket,
    required TResult Function(String qrCode) validateTicketQR,
    required TResult Function(String userId) refreshTickets,
  }) {
    return checkInTicket(ticketId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult? Function(String userId)? loadUserTickets,
    TResult? Function(String userId, String eventId)? loadEventTickets,
    TResult? Function(String ticketId, String userId)? loadTicketDetails,
    TResult? Function(String ticketId, String userId)? cancelTicket,
    TResult? Function(String ticketId, String userId)? checkInTicket,
    TResult? Function(String qrCode)? validateTicketQR,
    TResult? Function(String userId)? refreshTickets,
  }) {
    return checkInTicket?.call(ticketId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult Function(String userId)? loadUserTickets,
    TResult Function(String userId, String eventId)? loadEventTickets,
    TResult Function(String ticketId, String userId)? loadTicketDetails,
    TResult Function(String ticketId, String userId)? cancelTicket,
    TResult Function(String ticketId, String userId)? checkInTicket,
    TResult Function(String qrCode)? validateTicketQR,
    TResult Function(String userId)? refreshTickets,
    required TResult orElse(),
  }) {
    if (checkInTicket != null) {
      return checkInTicket(ticketId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseTickets value) purchaseTickets,
    required TResult Function(_LoadUserTickets value) loadUserTickets,
    required TResult Function(_LoadEventTickets value) loadEventTickets,
    required TResult Function(_LoadTicketDetails value) loadTicketDetails,
    required TResult Function(_CancelTicket value) cancelTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_ValidateTicketQR value) validateTicketQR,
    required TResult Function(_RefreshTickets value) refreshTickets,
  }) {
    return checkInTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseTickets value)? purchaseTickets,
    TResult? Function(_LoadUserTickets value)? loadUserTickets,
    TResult? Function(_LoadEventTickets value)? loadEventTickets,
    TResult? Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult? Function(_CancelTicket value)? cancelTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_ValidateTicketQR value)? validateTicketQR,
    TResult? Function(_RefreshTickets value)? refreshTickets,
  }) {
    return checkInTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseTickets value)? purchaseTickets,
    TResult Function(_LoadUserTickets value)? loadUserTickets,
    TResult Function(_LoadEventTickets value)? loadEventTickets,
    TResult Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult Function(_CancelTicket value)? cancelTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_ValidateTicketQR value)? validateTicketQR,
    TResult Function(_RefreshTickets value)? refreshTickets,
    required TResult orElse(),
  }) {
    if (checkInTicket != null) {
      return checkInTicket(this);
    }
    return orElse();
  }
}

abstract class _CheckInTicket implements TicketPurchaseEvent {
  const factory _CheckInTicket(
      {required final String ticketId,
      required final String userId}) = _$CheckInTicketImpl;

  String get ticketId;
  String get userId;

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInTicketImplCopyWith<_$CheckInTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateTicketQRImplCopyWith<$Res> {
  factory _$$ValidateTicketQRImplCopyWith(_$ValidateTicketQRImpl value,
          $Res Function(_$ValidateTicketQRImpl) then) =
      __$$ValidateTicketQRImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String qrCode});
}

/// @nodoc
class __$$ValidateTicketQRImplCopyWithImpl<$Res>
    extends _$TicketPurchaseEventCopyWithImpl<$Res, _$ValidateTicketQRImpl>
    implements _$$ValidateTicketQRImplCopyWith<$Res> {
  __$$ValidateTicketQRImplCopyWithImpl(_$ValidateTicketQRImpl _value,
      $Res Function(_$ValidateTicketQRImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
  }) {
    return _then(_$ValidateTicketQRImpl(
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValidateTicketQRImpl implements _ValidateTicketQR {
  const _$ValidateTicketQRImpl({required this.qrCode});

  @override
  final String qrCode;

  @override
  String toString() {
    return 'TicketPurchaseEvent.validateTicketQR(qrCode: $qrCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateTicketQRImpl &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrCode);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateTicketQRImplCopyWith<_$ValidateTicketQRImpl> get copyWith =>
      __$$ValidateTicketQRImplCopyWithImpl<_$ValidateTicketQRImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseTicketRequest request, String userId)
        purchaseTickets,
    required TResult Function(String userId) loadUserTickets,
    required TResult Function(String userId, String eventId) loadEventTickets,
    required TResult Function(String ticketId, String userId) loadTicketDetails,
    required TResult Function(String ticketId, String userId) cancelTicket,
    required TResult Function(String ticketId, String userId) checkInTicket,
    required TResult Function(String qrCode) validateTicketQR,
    required TResult Function(String userId) refreshTickets,
  }) {
    return validateTicketQR(qrCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult? Function(String userId)? loadUserTickets,
    TResult? Function(String userId, String eventId)? loadEventTickets,
    TResult? Function(String ticketId, String userId)? loadTicketDetails,
    TResult? Function(String ticketId, String userId)? cancelTicket,
    TResult? Function(String ticketId, String userId)? checkInTicket,
    TResult? Function(String qrCode)? validateTicketQR,
    TResult? Function(String userId)? refreshTickets,
  }) {
    return validateTicketQR?.call(qrCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult Function(String userId)? loadUserTickets,
    TResult Function(String userId, String eventId)? loadEventTickets,
    TResult Function(String ticketId, String userId)? loadTicketDetails,
    TResult Function(String ticketId, String userId)? cancelTicket,
    TResult Function(String ticketId, String userId)? checkInTicket,
    TResult Function(String qrCode)? validateTicketQR,
    TResult Function(String userId)? refreshTickets,
    required TResult orElse(),
  }) {
    if (validateTicketQR != null) {
      return validateTicketQR(qrCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseTickets value) purchaseTickets,
    required TResult Function(_LoadUserTickets value) loadUserTickets,
    required TResult Function(_LoadEventTickets value) loadEventTickets,
    required TResult Function(_LoadTicketDetails value) loadTicketDetails,
    required TResult Function(_CancelTicket value) cancelTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_ValidateTicketQR value) validateTicketQR,
    required TResult Function(_RefreshTickets value) refreshTickets,
  }) {
    return validateTicketQR(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseTickets value)? purchaseTickets,
    TResult? Function(_LoadUserTickets value)? loadUserTickets,
    TResult? Function(_LoadEventTickets value)? loadEventTickets,
    TResult? Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult? Function(_CancelTicket value)? cancelTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_ValidateTicketQR value)? validateTicketQR,
    TResult? Function(_RefreshTickets value)? refreshTickets,
  }) {
    return validateTicketQR?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseTickets value)? purchaseTickets,
    TResult Function(_LoadUserTickets value)? loadUserTickets,
    TResult Function(_LoadEventTickets value)? loadEventTickets,
    TResult Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult Function(_CancelTicket value)? cancelTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_ValidateTicketQR value)? validateTicketQR,
    TResult Function(_RefreshTickets value)? refreshTickets,
    required TResult orElse(),
  }) {
    if (validateTicketQR != null) {
      return validateTicketQR(this);
    }
    return orElse();
  }
}

abstract class _ValidateTicketQR implements TicketPurchaseEvent {
  const factory _ValidateTicketQR({required final String qrCode}) =
      _$ValidateTicketQRImpl;

  String get qrCode;

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidateTicketQRImplCopyWith<_$ValidateTicketQRImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshTicketsImplCopyWith<$Res> {
  factory _$$RefreshTicketsImplCopyWith(_$RefreshTicketsImpl value,
          $Res Function(_$RefreshTicketsImpl) then) =
      __$$RefreshTicketsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$RefreshTicketsImplCopyWithImpl<$Res>
    extends _$TicketPurchaseEventCopyWithImpl<$Res, _$RefreshTicketsImpl>
    implements _$$RefreshTicketsImplCopyWith<$Res> {
  __$$RefreshTicketsImplCopyWithImpl(
      _$RefreshTicketsImpl _value, $Res Function(_$RefreshTicketsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$RefreshTicketsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshTicketsImpl implements _RefreshTickets {
  const _$RefreshTicketsImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'TicketPurchaseEvent.refreshTickets(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshTicketsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshTicketsImplCopyWith<_$RefreshTicketsImpl> get copyWith =>
      __$$RefreshTicketsImplCopyWithImpl<_$RefreshTicketsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseTicketRequest request, String userId)
        purchaseTickets,
    required TResult Function(String userId) loadUserTickets,
    required TResult Function(String userId, String eventId) loadEventTickets,
    required TResult Function(String ticketId, String userId) loadTicketDetails,
    required TResult Function(String ticketId, String userId) cancelTicket,
    required TResult Function(String ticketId, String userId) checkInTicket,
    required TResult Function(String qrCode) validateTicketQR,
    required TResult Function(String userId) refreshTickets,
  }) {
    return refreshTickets(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult? Function(String userId)? loadUserTickets,
    TResult? Function(String userId, String eventId)? loadEventTickets,
    TResult? Function(String ticketId, String userId)? loadTicketDetails,
    TResult? Function(String ticketId, String userId)? cancelTicket,
    TResult? Function(String ticketId, String userId)? checkInTicket,
    TResult? Function(String qrCode)? validateTicketQR,
    TResult? Function(String userId)? refreshTickets,
  }) {
    return refreshTickets?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseTicketRequest request, String userId)?
        purchaseTickets,
    TResult Function(String userId)? loadUserTickets,
    TResult Function(String userId, String eventId)? loadEventTickets,
    TResult Function(String ticketId, String userId)? loadTicketDetails,
    TResult Function(String ticketId, String userId)? cancelTicket,
    TResult Function(String ticketId, String userId)? checkInTicket,
    TResult Function(String qrCode)? validateTicketQR,
    TResult Function(String userId)? refreshTickets,
    required TResult orElse(),
  }) {
    if (refreshTickets != null) {
      return refreshTickets(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PurchaseTickets value) purchaseTickets,
    required TResult Function(_LoadUserTickets value) loadUserTickets,
    required TResult Function(_LoadEventTickets value) loadEventTickets,
    required TResult Function(_LoadTicketDetails value) loadTicketDetails,
    required TResult Function(_CancelTicket value) cancelTicket,
    required TResult Function(_CheckInTicket value) checkInTicket,
    required TResult Function(_ValidateTicketQR value) validateTicketQR,
    required TResult Function(_RefreshTickets value) refreshTickets,
  }) {
    return refreshTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PurchaseTickets value)? purchaseTickets,
    TResult? Function(_LoadUserTickets value)? loadUserTickets,
    TResult? Function(_LoadEventTickets value)? loadEventTickets,
    TResult? Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult? Function(_CancelTicket value)? cancelTicket,
    TResult? Function(_CheckInTicket value)? checkInTicket,
    TResult? Function(_ValidateTicketQR value)? validateTicketQR,
    TResult? Function(_RefreshTickets value)? refreshTickets,
  }) {
    return refreshTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PurchaseTickets value)? purchaseTickets,
    TResult Function(_LoadUserTickets value)? loadUserTickets,
    TResult Function(_LoadEventTickets value)? loadEventTickets,
    TResult Function(_LoadTicketDetails value)? loadTicketDetails,
    TResult Function(_CancelTicket value)? cancelTicket,
    TResult Function(_CheckInTicket value)? checkInTicket,
    TResult Function(_ValidateTicketQR value)? validateTicketQR,
    TResult Function(_RefreshTickets value)? refreshTickets,
    required TResult orElse(),
  }) {
    if (refreshTickets != null) {
      return refreshTickets(this);
    }
    return orElse();
  }
}

abstract class _RefreshTickets implements TicketPurchaseEvent {
  const factory _RefreshTickets({required final String userId}) =
      _$RefreshTicketsImpl;

  String get userId;

  /// Create a copy of TicketPurchaseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshTicketsImplCopyWith<_$RefreshTicketsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TicketPurchaseState {
  List<TicketEntity> get tickets => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPurchasing => throw _privateConstructorUsedError;
  bool get isProcessing => throw _privateConstructorUsedError;
  bool get isValidating => throw _privateConstructorUsedError;
  bool get isLoadingDetails => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  TicketEntity? get selectedTicket => throw _privateConstructorUsedError;
  PurchaseResult? get purchaseResult => throw _privateConstructorUsedError;
  bool get isPurchaseSuccessful => throw _privateConstructorUsedError;
  bool get isTicketCancelled => throw _privateConstructorUsedError;

  /// Create a copy of TicketPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketPurchaseStateCopyWith<TicketPurchaseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketPurchaseStateCopyWith<$Res> {
  factory $TicketPurchaseStateCopyWith(
          TicketPurchaseState value, $Res Function(TicketPurchaseState) then) =
      _$TicketPurchaseStateCopyWithImpl<$Res, TicketPurchaseState>;
  @useResult
  $Res call(
      {List<TicketEntity> tickets,
      bool isLoading,
      bool isPurchasing,
      bool isProcessing,
      bool isValidating,
      bool isLoadingDetails,
      bool hasError,
      String errorMessage,
      TicketEntity? selectedTicket,
      PurchaseResult? purchaseResult,
      bool isPurchaseSuccessful,
      bool isTicketCancelled});

  $TicketEntityCopyWith<$Res>? get selectedTicket;
  $PurchaseResultCopyWith<$Res>? get purchaseResult;
}

/// @nodoc
class _$TicketPurchaseStateCopyWithImpl<$Res, $Val extends TicketPurchaseState>
    implements $TicketPurchaseStateCopyWith<$Res> {
  _$TicketPurchaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? isLoading = null,
    Object? isPurchasing = null,
    Object? isProcessing = null,
    Object? isValidating = null,
    Object? isLoadingDetails = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedTicket = freezed,
    Object? purchaseResult = freezed,
    Object? isPurchaseSuccessful = null,
    Object? isTicketCancelled = null,
  }) {
    return _then(_value.copyWith(
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidating: null == isValidating
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDetails: null == isLoadingDetails
          ? _value.isLoadingDetails
          : isLoadingDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTicket: freezed == selectedTicket
          ? _value.selectedTicket
          : selectedTicket // ignore: cast_nullable_to_non_nullable
              as TicketEntity?,
      purchaseResult: freezed == purchaseResult
          ? _value.purchaseResult
          : purchaseResult // ignore: cast_nullable_to_non_nullable
              as PurchaseResult?,
      isPurchaseSuccessful: null == isPurchaseSuccessful
          ? _value.isPurchaseSuccessful
          : isPurchaseSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isTicketCancelled: null == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of TicketPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TicketEntityCopyWith<$Res>? get selectedTicket {
    if (_value.selectedTicket == null) {
      return null;
    }

    return $TicketEntityCopyWith<$Res>(_value.selectedTicket!, (value) {
      return _then(_value.copyWith(selectedTicket: value) as $Val);
    });
  }

  /// Create a copy of TicketPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseResultCopyWith<$Res>? get purchaseResult {
    if (_value.purchaseResult == null) {
      return null;
    }

    return $PurchaseResultCopyWith<$Res>(_value.purchaseResult!, (value) {
      return _then(_value.copyWith(purchaseResult: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TicketPurchaseStateImplCopyWith<$Res>
    implements $TicketPurchaseStateCopyWith<$Res> {
  factory _$$TicketPurchaseStateImplCopyWith(_$TicketPurchaseStateImpl value,
          $Res Function(_$TicketPurchaseStateImpl) then) =
      __$$TicketPurchaseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TicketEntity> tickets,
      bool isLoading,
      bool isPurchasing,
      bool isProcessing,
      bool isValidating,
      bool isLoadingDetails,
      bool hasError,
      String errorMessage,
      TicketEntity? selectedTicket,
      PurchaseResult? purchaseResult,
      bool isPurchaseSuccessful,
      bool isTicketCancelled});

  @override
  $TicketEntityCopyWith<$Res>? get selectedTicket;
  @override
  $PurchaseResultCopyWith<$Res>? get purchaseResult;
}

/// @nodoc
class __$$TicketPurchaseStateImplCopyWithImpl<$Res>
    extends _$TicketPurchaseStateCopyWithImpl<$Res, _$TicketPurchaseStateImpl>
    implements _$$TicketPurchaseStateImplCopyWith<$Res> {
  __$$TicketPurchaseStateImplCopyWithImpl(_$TicketPurchaseStateImpl _value,
      $Res Function(_$TicketPurchaseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? isLoading = null,
    Object? isPurchasing = null,
    Object? isProcessing = null,
    Object? isValidating = null,
    Object? isLoadingDetails = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedTicket = freezed,
    Object? purchaseResult = freezed,
    Object? isPurchaseSuccessful = null,
    Object? isTicketCancelled = null,
  }) {
    return _then(_$TicketPurchaseStateImpl(
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      isProcessing: null == isProcessing
          ? _value.isProcessing
          : isProcessing // ignore: cast_nullable_to_non_nullable
              as bool,
      isValidating: null == isValidating
          ? _value.isValidating
          : isValidating // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingDetails: null == isLoadingDetails
          ? _value.isLoadingDetails
          : isLoadingDetails // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedTicket: freezed == selectedTicket
          ? _value.selectedTicket
          : selectedTicket // ignore: cast_nullable_to_non_nullable
              as TicketEntity?,
      purchaseResult: freezed == purchaseResult
          ? _value.purchaseResult
          : purchaseResult // ignore: cast_nullable_to_non_nullable
              as PurchaseResult?,
      isPurchaseSuccessful: null == isPurchaseSuccessful
          ? _value.isPurchaseSuccessful
          : isPurchaseSuccessful // ignore: cast_nullable_to_non_nullable
              as bool,
      isTicketCancelled: null == isTicketCancelled
          ? _value.isTicketCancelled
          : isTicketCancelled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TicketPurchaseStateImpl implements _TicketPurchaseState {
  const _$TicketPurchaseStateImpl(
      {final List<TicketEntity> tickets = const [],
      this.isLoading = false,
      this.isPurchasing = false,
      this.isProcessing = false,
      this.isValidating = false,
      this.isLoadingDetails = false,
      this.hasError = false,
      this.errorMessage = '',
      this.selectedTicket,
      this.purchaseResult,
      this.isPurchaseSuccessful = false,
      this.isTicketCancelled = false})
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
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isPurchasing;
  @override
  @JsonKey()
  final bool isProcessing;
  @override
  @JsonKey()
  final bool isValidating;
  @override
  @JsonKey()
  final bool isLoadingDetails;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final TicketEntity? selectedTicket;
  @override
  final PurchaseResult? purchaseResult;
  @override
  @JsonKey()
  final bool isPurchaseSuccessful;
  @override
  @JsonKey()
  final bool isTicketCancelled;

  @override
  String toString() {
    return 'TicketPurchaseState(tickets: $tickets, isLoading: $isLoading, isPurchasing: $isPurchasing, isProcessing: $isProcessing, isValidating: $isValidating, isLoadingDetails: $isLoadingDetails, hasError: $hasError, errorMessage: $errorMessage, selectedTicket: $selectedTicket, purchaseResult: $purchaseResult, isPurchaseSuccessful: $isPurchaseSuccessful, isTicketCancelled: $isTicketCancelled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketPurchaseStateImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isPurchasing, isPurchasing) ||
                other.isPurchasing == isPurchasing) &&
            (identical(other.isProcessing, isProcessing) ||
                other.isProcessing == isProcessing) &&
            (identical(other.isValidating, isValidating) ||
                other.isValidating == isValidating) &&
            (identical(other.isLoadingDetails, isLoadingDetails) ||
                other.isLoadingDetails == isLoadingDetails) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedTicket, selectedTicket) ||
                other.selectedTicket == selectedTicket) &&
            (identical(other.purchaseResult, purchaseResult) ||
                other.purchaseResult == purchaseResult) &&
            (identical(other.isPurchaseSuccessful, isPurchaseSuccessful) ||
                other.isPurchaseSuccessful == isPurchaseSuccessful) &&
            (identical(other.isTicketCancelled, isTicketCancelled) ||
                other.isTicketCancelled == isTicketCancelled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tickets),
      isLoading,
      isPurchasing,
      isProcessing,
      isValidating,
      isLoadingDetails,
      hasError,
      errorMessage,
      selectedTicket,
      purchaseResult,
      isPurchaseSuccessful,
      isTicketCancelled);

  /// Create a copy of TicketPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketPurchaseStateImplCopyWith<_$TicketPurchaseStateImpl> get copyWith =>
      __$$TicketPurchaseStateImplCopyWithImpl<_$TicketPurchaseStateImpl>(
          this, _$identity);
}

abstract class _TicketPurchaseState implements TicketPurchaseState {
  const factory _TicketPurchaseState(
      {final List<TicketEntity> tickets,
      final bool isLoading,
      final bool isPurchasing,
      final bool isProcessing,
      final bool isValidating,
      final bool isLoadingDetails,
      final bool hasError,
      final String errorMessage,
      final TicketEntity? selectedTicket,
      final PurchaseResult? purchaseResult,
      final bool isPurchaseSuccessful,
      final bool isTicketCancelled}) = _$TicketPurchaseStateImpl;

  @override
  List<TicketEntity> get tickets;
  @override
  bool get isLoading;
  @override
  bool get isPurchasing;
  @override
  bool get isProcessing;
  @override
  bool get isValidating;
  @override
  bool get isLoadingDetails;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  TicketEntity? get selectedTicket;
  @override
  PurchaseResult? get purchaseResult;
  @override
  bool get isPurchaseSuccessful;
  @override
  bool get isTicketCancelled;

  /// Create a copy of TicketPurchaseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketPurchaseStateImplCopyWith<_$TicketPurchaseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
