// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketEntity _$TicketEntityFromJson(Map<String, dynamic> json) {
  return _TicketEntity.fromJson(json);
}

/// @nodoc
mixin _$TicketEntity {
  String get id => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get eventTitle => throw _privateConstructorUsedError;
  String get eventLocation => throw _privateConstructorUsedError;
  DateTime get eventDateTime => throw _privateConstructorUsedError;
  String? get eventBannerUrl => throw _privateConstructorUsedError;
  String get ticketTypeId => throw _privateConstructorUsedError;
  String get ticketTypeName => throw _privateConstructorUsedError;
  String get ticketTypeDescription => throw _privateConstructorUsedError;
  double get ticketPrice => throw _privateConstructorUsedError;
  TicketStatus get status => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  DateTime? get checkInDate => throw _privateConstructorUsedError;
  String? get seatNumber => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TicketEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketEntityCopyWith<TicketEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEntityCopyWith<$Res> {
  factory $TicketEntityCopyWith(
          TicketEntity value, $Res Function(TicketEntity) then) =
      _$TicketEntityCopyWithImpl<$Res, TicketEntity>;
  @useResult
  $Res call(
      {String id,
      String eventId,
      String userId,
      String eventTitle,
      String eventLocation,
      DateTime eventDateTime,
      String? eventBannerUrl,
      String ticketTypeId,
      String ticketTypeName,
      String ticketTypeDescription,
      double ticketPrice,
      TicketStatus status,
      String qrCode,
      DateTime purchaseDate,
      DateTime? checkInDate,
      String? seatNumber,
      Map<String, dynamic>? metadata,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$TicketEntityCopyWithImpl<$Res, $Val extends TicketEntity>
    implements $TicketEntityCopyWith<$Res> {
  _$TicketEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? eventTitle = null,
    Object? eventLocation = null,
    Object? eventDateTime = null,
    Object? eventBannerUrl = freezed,
    Object? ticketTypeId = null,
    Object? ticketTypeName = null,
    Object? ticketTypeDescription = null,
    Object? ticketPrice = null,
    Object? status = null,
    Object? qrCode = null,
    Object? purchaseDate = null,
    Object? checkInDate = freezed,
    Object? seatNumber = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventLocation: null == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as String,
      eventDateTime: null == eventDateTime
          ? _value.eventDateTime
          : eventDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventBannerUrl: freezed == eventBannerUrl
          ? _value.eventBannerUrl
          : eventBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeName: null == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeDescription: null == ticketTypeDescription
          ? _value.ticketTypeDescription
          : ticketTypeDescription // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketStatus,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seatNumber: freezed == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketEntityImplCopyWith<$Res>
    implements $TicketEntityCopyWith<$Res> {
  factory _$$TicketEntityImplCopyWith(
          _$TicketEntityImpl value, $Res Function(_$TicketEntityImpl) then) =
      __$$TicketEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String eventId,
      String userId,
      String eventTitle,
      String eventLocation,
      DateTime eventDateTime,
      String? eventBannerUrl,
      String ticketTypeId,
      String ticketTypeName,
      String ticketTypeDescription,
      double ticketPrice,
      TicketStatus status,
      String qrCode,
      DateTime purchaseDate,
      DateTime? checkInDate,
      String? seatNumber,
      Map<String, dynamic>? metadata,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$TicketEntityImplCopyWithImpl<$Res>
    extends _$TicketEntityCopyWithImpl<$Res, _$TicketEntityImpl>
    implements _$$TicketEntityImplCopyWith<$Res> {
  __$$TicketEntityImplCopyWithImpl(
      _$TicketEntityImpl _value, $Res Function(_$TicketEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? eventId = null,
    Object? userId = null,
    Object? eventTitle = null,
    Object? eventLocation = null,
    Object? eventDateTime = null,
    Object? eventBannerUrl = freezed,
    Object? ticketTypeId = null,
    Object? ticketTypeName = null,
    Object? ticketTypeDescription = null,
    Object? ticketPrice = null,
    Object? status = null,
    Object? qrCode = null,
    Object? purchaseDate = null,
    Object? checkInDate = freezed,
    Object? seatNumber = freezed,
    Object? metadata = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TicketEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventLocation: null == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as String,
      eventDateTime: null == eventDateTime
          ? _value.eventDateTime
          : eventDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventBannerUrl: freezed == eventBannerUrl
          ? _value.eventBannerUrl
          : eventBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeName: null == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeDescription: null == ticketTypeDescription
          ? _value.ticketTypeDescription
          : ticketTypeDescription // ignore: cast_nullable_to_non_nullable
              as String,
      ticketPrice: null == ticketPrice
          ? _value.ticketPrice
          : ticketPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TicketStatus,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: null == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      seatNumber: freezed == seatNumber
          ? _value.seatNumber
          : seatNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketEntityImpl extends _TicketEntity {
  const _$TicketEntityImpl(
      {required this.id,
      required this.eventId,
      required this.userId,
      required this.eventTitle,
      required this.eventLocation,
      required this.eventDateTime,
      this.eventBannerUrl,
      required this.ticketTypeId,
      required this.ticketTypeName,
      required this.ticketTypeDescription,
      required this.ticketPrice,
      required this.status,
      required this.qrCode,
      required this.purchaseDate,
      this.checkInDate,
      this.seatNumber,
      final Map<String, dynamic>? metadata,
      required this.createdAt,
      required this.updatedAt})
      : _metadata = metadata,
        super._();

  factory _$TicketEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String eventId;
  @override
  final String userId;
  @override
  final String eventTitle;
  @override
  final String eventLocation;
  @override
  final DateTime eventDateTime;
  @override
  final String? eventBannerUrl;
  @override
  final String ticketTypeId;
  @override
  final String ticketTypeName;
  @override
  final String ticketTypeDescription;
  @override
  final double ticketPrice;
  @override
  final TicketStatus status;
  @override
  final String qrCode;
  @override
  final DateTime purchaseDate;
  @override
  final DateTime? checkInDate;
  @override
  final String? seatNumber;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TicketEntity(id: $id, eventId: $eventId, userId: $userId, eventTitle: $eventTitle, eventLocation: $eventLocation, eventDateTime: $eventDateTime, eventBannerUrl: $eventBannerUrl, ticketTypeId: $ticketTypeId, ticketTypeName: $ticketTypeName, ticketTypeDescription: $ticketTypeDescription, ticketPrice: $ticketPrice, status: $status, qrCode: $qrCode, purchaseDate: $purchaseDate, checkInDate: $checkInDate, seatNumber: $seatNumber, metadata: $metadata, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            (identical(other.eventLocation, eventLocation) ||
                other.eventLocation == eventLocation) &&
            (identical(other.eventDateTime, eventDateTime) ||
                other.eventDateTime == eventDateTime) &&
            (identical(other.eventBannerUrl, eventBannerUrl) ||
                other.eventBannerUrl == eventBannerUrl) &&
            (identical(other.ticketTypeId, ticketTypeId) ||
                other.ticketTypeId == ticketTypeId) &&
            (identical(other.ticketTypeName, ticketTypeName) ||
                other.ticketTypeName == ticketTypeName) &&
            (identical(other.ticketTypeDescription, ticketTypeDescription) ||
                other.ticketTypeDescription == ticketTypeDescription) &&
            (identical(other.ticketPrice, ticketPrice) ||
                other.ticketPrice == ticketPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.seatNumber, seatNumber) ||
                other.seatNumber == seatNumber) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        eventId,
        userId,
        eventTitle,
        eventLocation,
        eventDateTime,
        eventBannerUrl,
        ticketTypeId,
        ticketTypeName,
        ticketTypeDescription,
        ticketPrice,
        status,
        qrCode,
        purchaseDate,
        checkInDate,
        seatNumber,
        const DeepCollectionEquality().hash(_metadata),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      __$$TicketEntityImplCopyWithImpl<_$TicketEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketEntityImplToJson(
      this,
    );
  }
}

abstract class _TicketEntity extends TicketEntity {
  const factory _TicketEntity(
      {required final String id,
      required final String eventId,
      required final String userId,
      required final String eventTitle,
      required final String eventLocation,
      required final DateTime eventDateTime,
      final String? eventBannerUrl,
      required final String ticketTypeId,
      required final String ticketTypeName,
      required final String ticketTypeDescription,
      required final double ticketPrice,
      required final TicketStatus status,
      required final String qrCode,
      required final DateTime purchaseDate,
      final DateTime? checkInDate,
      final String? seatNumber,
      final Map<String, dynamic>? metadata,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$TicketEntityImpl;
  const _TicketEntity._() : super._();

  factory _TicketEntity.fromJson(Map<String, dynamic> json) =
      _$TicketEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get eventId;
  @override
  String get userId;
  @override
  String get eventTitle;
  @override
  String get eventLocation;
  @override
  DateTime get eventDateTime;
  @override
  String? get eventBannerUrl;
  @override
  String get ticketTypeId;
  @override
  String get ticketTypeName;
  @override
  String get ticketTypeDescription;
  @override
  double get ticketPrice;
  @override
  TicketStatus get status;
  @override
  String get qrCode;
  @override
  DateTime get purchaseDate;
  @override
  DateTime? get checkInDate;
  @override
  String? get seatNumber;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of TicketEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketEntityImplCopyWith<_$TicketEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PurchaseTicketRequest _$PurchaseTicketRequestFromJson(
    Map<String, dynamic> json) {
  return _PurchaseTicketRequest.fromJson(json);
}

/// @nodoc
mixin _$PurchaseTicketRequest {
  String get eventId => throw _privateConstructorUsedError;
  String get ticketTypeId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this PurchaseTicketRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseTicketRequestCopyWith<PurchaseTicketRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseTicketRequestCopyWith<$Res> {
  factory $PurchaseTicketRequestCopyWith(PurchaseTicketRequest value,
          $Res Function(PurchaseTicketRequest) then) =
      _$PurchaseTicketRequestCopyWithImpl<$Res, PurchaseTicketRequest>;
  @useResult
  $Res call(
      {String eventId,
      String ticketTypeId,
      int quantity,
      PaymentMethod paymentMethod,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$PurchaseTicketRequestCopyWithImpl<$Res,
        $Val extends PurchaseTicketRequest>
    implements $PurchaseTicketRequestCopyWith<$Res> {
  _$PurchaseTicketRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? ticketTypeId = null,
    Object? quantity = null,
    Object? paymentMethod = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseTicketRequestImplCopyWith<$Res>
    implements $PurchaseTicketRequestCopyWith<$Res> {
  factory _$$PurchaseTicketRequestImplCopyWith(
          _$PurchaseTicketRequestImpl value,
          $Res Function(_$PurchaseTicketRequestImpl) then) =
      __$$PurchaseTicketRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String ticketTypeId,
      int quantity,
      PaymentMethod paymentMethod,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$PurchaseTicketRequestImplCopyWithImpl<$Res>
    extends _$PurchaseTicketRequestCopyWithImpl<$Res,
        _$PurchaseTicketRequestImpl>
    implements _$$PurchaseTicketRequestImplCopyWith<$Res> {
  __$$PurchaseTicketRequestImplCopyWithImpl(_$PurchaseTicketRequestImpl _value,
      $Res Function(_$PurchaseTicketRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? ticketTypeId = null,
    Object? quantity = null,
    Object? paymentMethod = null,
    Object? metadata = freezed,
  }) {
    return _then(_$PurchaseTicketRequestImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketTypeId: null == ticketTypeId
          ? _value.ticketTypeId
          : ticketTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseTicketRequestImpl implements _PurchaseTicketRequest {
  const _$PurchaseTicketRequestImpl(
      {required this.eventId,
      required this.ticketTypeId,
      required this.quantity,
      required this.paymentMethod,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$PurchaseTicketRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseTicketRequestImplFromJson(json);

  @override
  final String eventId;
  @override
  final String ticketTypeId;
  @override
  final int quantity;
  @override
  final PaymentMethod paymentMethod;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'PurchaseTicketRequest(eventId: $eventId, ticketTypeId: $ticketTypeId, quantity: $quantity, paymentMethod: $paymentMethod, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseTicketRequestImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.ticketTypeId, ticketTypeId) ||
                other.ticketTypeId == ticketTypeId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventId, ticketTypeId, quantity,
      paymentMethod, const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseTicketRequestImplCopyWith<_$PurchaseTicketRequestImpl>
      get copyWith => __$$PurchaseTicketRequestImplCopyWithImpl<
          _$PurchaseTicketRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseTicketRequestImplToJson(
      this,
    );
  }
}

abstract class _PurchaseTicketRequest implements PurchaseTicketRequest {
  const factory _PurchaseTicketRequest(
      {required final String eventId,
      required final String ticketTypeId,
      required final int quantity,
      required final PaymentMethod paymentMethod,
      final Map<String, dynamic>? metadata}) = _$PurchaseTicketRequestImpl;

  factory _PurchaseTicketRequest.fromJson(Map<String, dynamic> json) =
      _$PurchaseTicketRequestImpl.fromJson;

  @override
  String get eventId;
  @override
  String get ticketTypeId;
  @override
  int get quantity;
  @override
  PaymentMethod get paymentMethod;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of PurchaseTicketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseTicketRequestImplCopyWith<_$PurchaseTicketRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PurchaseResult _$PurchaseResultFromJson(Map<String, dynamic> json) {
  return _PurchaseResult.fromJson(json);
}

/// @nodoc
mixin _$PurchaseResult {
  String get transactionId => throw _privateConstructorUsedError;
  List<TicketEntity> get tickets => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  PaymentStatus get paymentStatus => throw _privateConstructorUsedError;
  String? get paymentReference => throw _privateConstructorUsedError;

  /// Serializes this PurchaseResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseResultCopyWith<PurchaseResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseResultCopyWith<$Res> {
  factory $PurchaseResultCopyWith(
          PurchaseResult value, $Res Function(PurchaseResult) then) =
      _$PurchaseResultCopyWithImpl<$Res, PurchaseResult>;
  @useResult
  $Res call(
      {String transactionId,
      List<TicketEntity> tickets,
      double totalAmount,
      PaymentStatus paymentStatus,
      String? paymentReference});
}

/// @nodoc
class _$PurchaseResultCopyWithImpl<$Res, $Val extends PurchaseResult>
    implements $PurchaseResultCopyWith<$Res> {
  _$PurchaseResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? tickets = null,
    Object? totalAmount = null,
    Object? paymentStatus = null,
    Object? paymentReference = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseResultImplCopyWith<$Res>
    implements $PurchaseResultCopyWith<$Res> {
  factory _$$PurchaseResultImplCopyWith(_$PurchaseResultImpl value,
          $Res Function(_$PurchaseResultImpl) then) =
      __$$PurchaseResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transactionId,
      List<TicketEntity> tickets,
      double totalAmount,
      PaymentStatus paymentStatus,
      String? paymentReference});
}

/// @nodoc
class __$$PurchaseResultImplCopyWithImpl<$Res>
    extends _$PurchaseResultCopyWithImpl<$Res, _$PurchaseResultImpl>
    implements _$$PurchaseResultImplCopyWith<$Res> {
  __$$PurchaseResultImplCopyWithImpl(
      _$PurchaseResultImpl _value, $Res Function(_$PurchaseResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? tickets = null,
    Object? totalAmount = null,
    Object? paymentStatus = null,
    Object? paymentReference = freezed,
  }) {
    return _then(_$PurchaseResultImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentStatus: null == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PaymentStatus,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseResultImpl implements _PurchaseResult {
  const _$PurchaseResultImpl(
      {required this.transactionId,
      required final List<TicketEntity> tickets,
      required this.totalAmount,
      required this.paymentStatus,
      this.paymentReference})
      : _tickets = tickets;

  factory _$PurchaseResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseResultImplFromJson(json);

  @override
  final String transactionId;
  final List<TicketEntity> _tickets;
  @override
  List<TicketEntity> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  final double totalAmount;
  @override
  final PaymentStatus paymentStatus;
  @override
  final String? paymentReference;

  @override
  String toString() {
    return 'PurchaseResult(transactionId: $transactionId, tickets: $tickets, totalAmount: $totalAmount, paymentStatus: $paymentStatus, paymentReference: $paymentReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseResultImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.paymentReference, paymentReference) ||
                other.paymentReference == paymentReference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      const DeepCollectionEquality().hash(_tickets),
      totalAmount,
      paymentStatus,
      paymentReference);

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseResultImplCopyWith<_$PurchaseResultImpl> get copyWith =>
      __$$PurchaseResultImplCopyWithImpl<_$PurchaseResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseResultImplToJson(
      this,
    );
  }
}

abstract class _PurchaseResult implements PurchaseResult {
  const factory _PurchaseResult(
      {required final String transactionId,
      required final List<TicketEntity> tickets,
      required final double totalAmount,
      required final PaymentStatus paymentStatus,
      final String? paymentReference}) = _$PurchaseResultImpl;

  factory _PurchaseResult.fromJson(Map<String, dynamic> json) =
      _$PurchaseResultImpl.fromJson;

  @override
  String get transactionId;
  @override
  List<TicketEntity> get tickets;
  @override
  double get totalAmount;
  @override
  PaymentStatus get paymentStatus;
  @override
  String? get paymentReference;

  /// Create a copy of PurchaseResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseResultImplCopyWith<_$PurchaseResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
