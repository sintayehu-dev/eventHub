// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventEntity _$EventEntityFromJson(Map<String, dynamic> json) {
  return _EventEntity.fromJson(json);
}

/// @nodoc
mixin _$EventEntity {
  String get id => throw _privateConstructorUsedError;
  String get organizerId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  EventCategory get category => throw _privateConstructorUsedError;
  List<TicketTypeEntity> get ticketTypes => throw _privateConstructorUsedError;
  int get maxCapacity => throw _privateConstructorUsedError;
  EventStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this EventEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventEntityCopyWith<EventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEntityCopyWith<$Res> {
  factory $EventEntityCopyWith(
          EventEntity value, $Res Function(EventEntity) then) =
      _$EventEntityCopyWithImpl<$Res, EventEntity>;
  @useResult
  $Res call(
      {String id,
      String organizerId,
      String title,
      String description,
      String? bannerUrl,
      String location,
      DateTime dateTime,
      EventCategory category,
      List<TicketTypeEntity> ticketTypes,
      int maxCapacity,
      EventStatus status,
      DateTime createdAt,
      DateTime updatedAt,
      String? cancellationReason,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$EventEntityCopyWithImpl<$Res, $Val extends EventEntity>
    implements $EventEntityCopyWith<$Res> {
  _$EventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizerId = null,
    Object? title = null,
    Object? description = null,
    Object? bannerUrl = freezed,
    Object? location = null,
    Object? dateTime = null,
    Object? category = null,
    Object? ticketTypes = null,
    Object? maxCapacity = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? cancellationReason = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      ticketTypes: null == ticketTypes
          ? _value.ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketTypeEntity>,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventEntityImplCopyWith<$Res>
    implements $EventEntityCopyWith<$Res> {
  factory _$$EventEntityImplCopyWith(
          _$EventEntityImpl value, $Res Function(_$EventEntityImpl) then) =
      __$$EventEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String organizerId,
      String title,
      String description,
      String? bannerUrl,
      String location,
      DateTime dateTime,
      EventCategory category,
      List<TicketTypeEntity> ticketTypes,
      int maxCapacity,
      EventStatus status,
      DateTime createdAt,
      DateTime updatedAt,
      String? cancellationReason,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$EventEntityImplCopyWithImpl<$Res>
    extends _$EventEntityCopyWithImpl<$Res, _$EventEntityImpl>
    implements _$$EventEntityImplCopyWith<$Res> {
  __$$EventEntityImplCopyWithImpl(
      _$EventEntityImpl _value, $Res Function(_$EventEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizerId = null,
    Object? title = null,
    Object? description = null,
    Object? bannerUrl = freezed,
    Object? location = null,
    Object? dateTime = null,
    Object? category = null,
    Object? ticketTypes = null,
    Object? maxCapacity = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? cancellationReason = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$EventEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bannerUrl: freezed == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      ticketTypes: null == ticketTypes
          ? _value._ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<TicketTypeEntity>,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventEntityImpl extends _EventEntity {
  const _$EventEntityImpl(
      {required this.id,
      required this.organizerId,
      required this.title,
      required this.description,
      this.bannerUrl,
      required this.location,
      required this.dateTime,
      required this.category,
      required final List<TicketTypeEntity> ticketTypes,
      required this.maxCapacity,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      this.cancellationReason,
      final Map<String, dynamic>? metadata})
      : _ticketTypes = ticketTypes,
        _metadata = metadata,
        super._();

  factory _$EventEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String organizerId;
  @override
  final String title;
  @override
  final String description;
  @override
  final String? bannerUrl;
  @override
  final String location;
  @override
  final DateTime dateTime;
  @override
  final EventCategory category;
  final List<TicketTypeEntity> _ticketTypes;
  @override
  List<TicketTypeEntity> get ticketTypes {
    if (_ticketTypes is EqualUnmodifiableListView) return _ticketTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ticketTypes);
  }

  @override
  final int maxCapacity;
  @override
  final EventStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? cancellationReason;
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
    return 'EventEntity(id: $id, organizerId: $organizerId, title: $title, description: $description, bannerUrl: $bannerUrl, location: $location, dateTime: $dateTime, category: $category, ticketTypes: $ticketTypes, maxCapacity: $maxCapacity, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, cancellationReason: $cancellationReason, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._ticketTypes, _ticketTypes) &&
            (identical(other.maxCapacity, maxCapacity) ||
                other.maxCapacity == maxCapacity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      organizerId,
      title,
      description,
      bannerUrl,
      location,
      dateTime,
      category,
      const DeepCollectionEquality().hash(_ticketTypes),
      maxCapacity,
      status,
      createdAt,
      updatedAt,
      cancellationReason,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventEntityImplCopyWith<_$EventEntityImpl> get copyWith =>
      __$$EventEntityImplCopyWithImpl<_$EventEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventEntityImplToJson(
      this,
    );
  }
}

abstract class _EventEntity extends EventEntity {
  const factory _EventEntity(
      {required final String id,
      required final String organizerId,
      required final String title,
      required final String description,
      final String? bannerUrl,
      required final String location,
      required final DateTime dateTime,
      required final EventCategory category,
      required final List<TicketTypeEntity> ticketTypes,
      required final int maxCapacity,
      required final EventStatus status,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? cancellationReason,
      final Map<String, dynamic>? metadata}) = _$EventEntityImpl;
  const _EventEntity._() : super._();

  factory _EventEntity.fromJson(Map<String, dynamic> json) =
      _$EventEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get organizerId;
  @override
  String get title;
  @override
  String get description;
  @override
  String? get bannerUrl;
  @override
  String get location;
  @override
  DateTime get dateTime;
  @override
  EventCategory get category;
  @override
  List<TicketTypeEntity> get ticketTypes;
  @override
  int get maxCapacity;
  @override
  EventStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get cancellationReason;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of EventEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventEntityImplCopyWith<_$EventEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TicketTypeEntity _$TicketTypeEntityFromJson(Map<String, dynamic> json) {
  return _TicketTypeEntity.fromJson(json);
}

/// @nodoc
mixin _$TicketTypeEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get availableQuantity => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  DateTime? get saleStartDate => throw _privateConstructorUsedError;
  DateTime? get saleEndDate => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this TicketTypeEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketTypeEntityCopyWith<TicketTypeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketTypeEntityCopyWith<$Res> {
  factory $TicketTypeEntityCopyWith(
          TicketTypeEntity value, $Res Function(TicketTypeEntity) then) =
      _$TicketTypeEntityCopyWithImpl<$Res, TicketTypeEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      int quantity,
      int availableQuantity,
      bool isActive,
      DateTime? saleStartDate,
      DateTime? saleEndDate,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$TicketTypeEntityCopyWithImpl<$Res, $Val extends TicketTypeEntity>
    implements $TicketTypeEntityCopyWith<$Res> {
  _$TicketTypeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? quantity = null,
    Object? availableQuantity = null,
    Object? isActive = null,
    Object? saleStartDate = freezed,
    Object? saleEndDate = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      saleStartDate: freezed == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleEndDate: freezed == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketTypeEntityImplCopyWith<$Res>
    implements $TicketTypeEntityCopyWith<$Res> {
  factory _$$TicketTypeEntityImplCopyWith(_$TicketTypeEntityImpl value,
          $Res Function(_$TicketTypeEntityImpl) then) =
      __$$TicketTypeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      int quantity,
      int availableQuantity,
      bool isActive,
      DateTime? saleStartDate,
      DateTime? saleEndDate,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$TicketTypeEntityImplCopyWithImpl<$Res>
    extends _$TicketTypeEntityCopyWithImpl<$Res, _$TicketTypeEntityImpl>
    implements _$$TicketTypeEntityImplCopyWith<$Res> {
  __$$TicketTypeEntityImplCopyWithImpl(_$TicketTypeEntityImpl _value,
      $Res Function(_$TicketTypeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? quantity = null,
    Object? availableQuantity = null,
    Object? isActive = null,
    Object? saleStartDate = freezed,
    Object? saleEndDate = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$TicketTypeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      saleStartDate: freezed == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleEndDate: freezed == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketTypeEntityImpl extends _TicketTypeEntity {
  const _$TicketTypeEntityImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.availableQuantity,
      required this.isActive,
      this.saleStartDate,
      this.saleEndDate,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata,
        super._();

  factory _$TicketTypeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketTypeEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final int availableQuantity;
  @override
  final bool isActive;
  @override
  final DateTime? saleStartDate;
  @override
  final DateTime? saleEndDate;
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
    return 'TicketTypeEntity(id: $id, name: $name, description: $description, price: $price, quantity: $quantity, availableQuantity: $availableQuantity, isActive: $isActive, saleStartDate: $saleStartDate, saleEndDate: $saleEndDate, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketTypeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.availableQuantity, availableQuantity) ||
                other.availableQuantity == availableQuantity) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.saleStartDate, saleStartDate) ||
                other.saleStartDate == saleStartDate) &&
            (identical(other.saleEndDate, saleEndDate) ||
                other.saleEndDate == saleEndDate) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      quantity,
      availableQuantity,
      isActive,
      saleStartDate,
      saleEndDate,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of TicketTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketTypeEntityImplCopyWith<_$TicketTypeEntityImpl> get copyWith =>
      __$$TicketTypeEntityImplCopyWithImpl<_$TicketTypeEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketTypeEntityImplToJson(
      this,
    );
  }
}

abstract class _TicketTypeEntity extends TicketTypeEntity {
  const factory _TicketTypeEntity(
      {required final String id,
      required final String name,
      required final String description,
      required final double price,
      required final int quantity,
      required final int availableQuantity,
      required final bool isActive,
      final DateTime? saleStartDate,
      final DateTime? saleEndDate,
      final Map<String, dynamic>? metadata}) = _$TicketTypeEntityImpl;
  const _TicketTypeEntity._() : super._();

  factory _TicketTypeEntity.fromJson(Map<String, dynamic> json) =
      _$TicketTypeEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  int get quantity;
  @override
  int get availableQuantity;
  @override
  bool get isActive;
  @override
  DateTime? get saleStartDate;
  @override
  DateTime? get saleEndDate;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of TicketTypeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketTypeEntityImplCopyWith<_$TicketTypeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateEventRequest _$CreateEventRequestFromJson(Map<String, dynamic> json) {
  return _CreateEventRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateEventRequest {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get bannerImagePath => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  EventCategory get category => throw _privateConstructorUsedError;
  List<CreateTicketTypeRequest> get ticketTypes =>
      throw _privateConstructorUsedError;
  int get maxCapacity => throw _privateConstructorUsedError;
  List<CreateStaffMemberRequest> get staffMembers =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this CreateEventRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateEventRequestCopyWith<CreateEventRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEventRequestCopyWith<$Res> {
  factory $CreateEventRequestCopyWith(
          CreateEventRequest value, $Res Function(CreateEventRequest) then) =
      _$CreateEventRequestCopyWithImpl<$Res, CreateEventRequest>;
  @useResult
  $Res call(
      {String title,
      String description,
      String? bannerImagePath,
      String location,
      DateTime dateTime,
      EventCategory category,
      List<CreateTicketTypeRequest> ticketTypes,
      int maxCapacity,
      List<CreateStaffMemberRequest> staffMembers,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$CreateEventRequestCopyWithImpl<$Res, $Val extends CreateEventRequest>
    implements $CreateEventRequestCopyWith<$Res> {
  _$CreateEventRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? bannerImagePath = freezed,
    Object? location = null,
    Object? dateTime = null,
    Object? category = null,
    Object? ticketTypes = null,
    Object? maxCapacity = null,
    Object? staffMembers = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImagePath: freezed == bannerImagePath
          ? _value.bannerImagePath
          : bannerImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      ticketTypes: null == ticketTypes
          ? _value.ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<CreateTicketTypeRequest>,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      staffMembers: null == staffMembers
          ? _value.staffMembers
          : staffMembers // ignore: cast_nullable_to_non_nullable
              as List<CreateStaffMemberRequest>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateEventRequestImplCopyWith<$Res>
    implements $CreateEventRequestCopyWith<$Res> {
  factory _$$CreateEventRequestImplCopyWith(_$CreateEventRequestImpl value,
          $Res Function(_$CreateEventRequestImpl) then) =
      __$$CreateEventRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      String? bannerImagePath,
      String location,
      DateTime dateTime,
      EventCategory category,
      List<CreateTicketTypeRequest> ticketTypes,
      int maxCapacity,
      List<CreateStaffMemberRequest> staffMembers,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$CreateEventRequestImplCopyWithImpl<$Res>
    extends _$CreateEventRequestCopyWithImpl<$Res, _$CreateEventRequestImpl>
    implements _$$CreateEventRequestImplCopyWith<$Res> {
  __$$CreateEventRequestImplCopyWithImpl(_$CreateEventRequestImpl _value,
      $Res Function(_$CreateEventRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? bannerImagePath = freezed,
    Object? location = null,
    Object? dateTime = null,
    Object? category = null,
    Object? ticketTypes = null,
    Object? maxCapacity = null,
    Object? staffMembers = null,
    Object? metadata = freezed,
  }) {
    return _then(_$CreateEventRequestImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImagePath: freezed == bannerImagePath
          ? _value.bannerImagePath
          : bannerImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EventCategory,
      ticketTypes: null == ticketTypes
          ? _value._ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<CreateTicketTypeRequest>,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      staffMembers: null == staffMembers
          ? _value._staffMembers
          : staffMembers // ignore: cast_nullable_to_non_nullable
              as List<CreateStaffMemberRequest>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateEventRequestImpl implements _CreateEventRequest {
  const _$CreateEventRequestImpl(
      {required this.title,
      required this.description,
      this.bannerImagePath,
      required this.location,
      required this.dateTime,
      required this.category,
      required final List<CreateTicketTypeRequest> ticketTypes,
      required this.maxCapacity,
      final List<CreateStaffMemberRequest> staffMembers = const [],
      final Map<String, dynamic>? metadata})
      : _ticketTypes = ticketTypes,
        _staffMembers = staffMembers,
        _metadata = metadata;

  factory _$CreateEventRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateEventRequestImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String? bannerImagePath;
  @override
  final String location;
  @override
  final DateTime dateTime;
  @override
  final EventCategory category;
  final List<CreateTicketTypeRequest> _ticketTypes;
  @override
  List<CreateTicketTypeRequest> get ticketTypes {
    if (_ticketTypes is EqualUnmodifiableListView) return _ticketTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ticketTypes);
  }

  @override
  final int maxCapacity;
  final List<CreateStaffMemberRequest> _staffMembers;
  @override
  @JsonKey()
  List<CreateStaffMemberRequest> get staffMembers {
    if (_staffMembers is EqualUnmodifiableListView) return _staffMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_staffMembers);
  }

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
    return 'CreateEventRequest(title: $title, description: $description, bannerImagePath: $bannerImagePath, location: $location, dateTime: $dateTime, category: $category, ticketTypes: $ticketTypes, maxCapacity: $maxCapacity, staffMembers: $staffMembers, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEventRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bannerImagePath, bannerImagePath) ||
                other.bannerImagePath == bannerImagePath) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._ticketTypes, _ticketTypes) &&
            (identical(other.maxCapacity, maxCapacity) ||
                other.maxCapacity == maxCapacity) &&
            const DeepCollectionEquality()
                .equals(other._staffMembers, _staffMembers) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      bannerImagePath,
      location,
      dateTime,
      category,
      const DeepCollectionEquality().hash(_ticketTypes),
      maxCapacity,
      const DeepCollectionEquality().hash(_staffMembers),
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEventRequestImplCopyWith<_$CreateEventRequestImpl> get copyWith =>
      __$$CreateEventRequestImplCopyWithImpl<_$CreateEventRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateEventRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateEventRequest implements CreateEventRequest {
  const factory _CreateEventRequest(
      {required final String title,
      required final String description,
      final String? bannerImagePath,
      required final String location,
      required final DateTime dateTime,
      required final EventCategory category,
      required final List<CreateTicketTypeRequest> ticketTypes,
      required final int maxCapacity,
      final List<CreateStaffMemberRequest> staffMembers,
      final Map<String, dynamic>? metadata}) = _$CreateEventRequestImpl;

  factory _CreateEventRequest.fromJson(Map<String, dynamic> json) =
      _$CreateEventRequestImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String? get bannerImagePath;
  @override
  String get location;
  @override
  DateTime get dateTime;
  @override
  EventCategory get category;
  @override
  List<CreateTicketTypeRequest> get ticketTypes;
  @override
  int get maxCapacity;
  @override
  List<CreateStaffMemberRequest> get staffMembers;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of CreateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateEventRequestImplCopyWith<_$CreateEventRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CreateTicketTypeRequest _$CreateTicketTypeRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateTicketTypeRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateTicketTypeRequest {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DateTime? get saleStartDate => throw _privateConstructorUsedError;
  DateTime? get saleEndDate => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this CreateTicketTypeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTicketTypeRequestCopyWith<CreateTicketTypeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTicketTypeRequestCopyWith<$Res> {
  factory $CreateTicketTypeRequestCopyWith(CreateTicketTypeRequest value,
          $Res Function(CreateTicketTypeRequest) then) =
      _$CreateTicketTypeRequestCopyWithImpl<$Res, CreateTicketTypeRequest>;
  @useResult
  $Res call(
      {String name,
      String description,
      double price,
      int quantity,
      DateTime? saleStartDate,
      DateTime? saleEndDate,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$CreateTicketTypeRequestCopyWithImpl<$Res,
        $Val extends CreateTicketTypeRequest>
    implements $CreateTicketTypeRequestCopyWith<$Res> {
  _$CreateTicketTypeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? quantity = null,
    Object? saleStartDate = freezed,
    Object? saleEndDate = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      saleStartDate: freezed == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleEndDate: freezed == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateTicketTypeRequestImplCopyWith<$Res>
    implements $CreateTicketTypeRequestCopyWith<$Res> {
  factory _$$CreateTicketTypeRequestImplCopyWith(
          _$CreateTicketTypeRequestImpl value,
          $Res Function(_$CreateTicketTypeRequestImpl) then) =
      __$$CreateTicketTypeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      double price,
      int quantity,
      DateTime? saleStartDate,
      DateTime? saleEndDate,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$CreateTicketTypeRequestImplCopyWithImpl<$Res>
    extends _$CreateTicketTypeRequestCopyWithImpl<$Res,
        _$CreateTicketTypeRequestImpl>
    implements _$$CreateTicketTypeRequestImplCopyWith<$Res> {
  __$$CreateTicketTypeRequestImplCopyWithImpl(
      _$CreateTicketTypeRequestImpl _value,
      $Res Function(_$CreateTicketTypeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? quantity = null,
    Object? saleStartDate = freezed,
    Object? saleEndDate = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$CreateTicketTypeRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      saleStartDate: freezed == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleEndDate: freezed == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTicketTypeRequestImpl implements _CreateTicketTypeRequest {
  const _$CreateTicketTypeRequestImpl(
      {required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      this.saleStartDate,
      this.saleEndDate,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$CreateTicketTypeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTicketTypeRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final DateTime? saleStartDate;
  @override
  final DateTime? saleEndDate;
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
    return 'CreateTicketTypeRequest(name: $name, description: $description, price: $price, quantity: $quantity, saleStartDate: $saleStartDate, saleEndDate: $saleEndDate, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTicketTypeRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.saleStartDate, saleStartDate) ||
                other.saleStartDate == saleStartDate) &&
            (identical(other.saleEndDate, saleEndDate) ||
                other.saleEndDate == saleEndDate) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      price,
      quantity,
      saleStartDate,
      saleEndDate,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of CreateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTicketTypeRequestImplCopyWith<_$CreateTicketTypeRequestImpl>
      get copyWith => __$$CreateTicketTypeRequestImplCopyWithImpl<
          _$CreateTicketTypeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTicketTypeRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateTicketTypeRequest implements CreateTicketTypeRequest {
  const factory _CreateTicketTypeRequest(
      {required final String name,
      required final String description,
      required final double price,
      required final int quantity,
      final DateTime? saleStartDate,
      final DateTime? saleEndDate,
      final Map<String, dynamic>? metadata}) = _$CreateTicketTypeRequestImpl;

  factory _CreateTicketTypeRequest.fromJson(Map<String, dynamic> json) =
      _$CreateTicketTypeRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  int get quantity;
  @override
  DateTime? get saleStartDate;
  @override
  DateTime? get saleEndDate;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of CreateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTicketTypeRequestImplCopyWith<_$CreateTicketTypeRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CreateStaffMemberRequest _$CreateStaffMemberRequestFromJson(
    Map<String, dynamic> json) {
  return _CreateStaffMemberRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateStaffMemberRequest {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  List<String> get permissions => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this CreateStaffMemberRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateStaffMemberRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateStaffMemberRequestCopyWith<CreateStaffMemberRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateStaffMemberRequestCopyWith<$Res> {
  factory $CreateStaffMemberRequestCopyWith(CreateStaffMemberRequest value,
          $Res Function(CreateStaffMemberRequest) then) =
      _$CreateStaffMemberRequestCopyWithImpl<$Res, CreateStaffMemberRequest>;
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      String role,
      List<String> permissions,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$CreateStaffMemberRequestCopyWithImpl<$Res,
        $Val extends CreateStaffMemberRequest>
    implements $CreateStaffMemberRequestCopyWith<$Res> {
  _$CreateStaffMemberRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateStaffMemberRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? role = null,
    Object? permissions = null,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateStaffMemberRequestImplCopyWith<$Res>
    implements $CreateStaffMemberRequestCopyWith<$Res> {
  factory _$$CreateStaffMemberRequestImplCopyWith(
          _$CreateStaffMemberRequestImpl value,
          $Res Function(_$CreateStaffMemberRequestImpl) then) =
      __$$CreateStaffMemberRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      String role,
      List<String> permissions,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$CreateStaffMemberRequestImplCopyWithImpl<$Res>
    extends _$CreateStaffMemberRequestCopyWithImpl<$Res,
        _$CreateStaffMemberRequestImpl>
    implements _$$CreateStaffMemberRequestImplCopyWith<$Res> {
  __$$CreateStaffMemberRequestImplCopyWithImpl(
      _$CreateStaffMemberRequestImpl _value,
      $Res Function(_$CreateStaffMemberRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateStaffMemberRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? role = null,
    Object? permissions = null,
    Object? metadata = freezed,
  }) {
    return _then(_$CreateStaffMemberRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateStaffMemberRequestImpl implements _CreateStaffMemberRequest {
  const _$CreateStaffMemberRequestImpl(
      {required this.name,
      required this.email,
      required this.password,
      required this.role,
      required final List<String> permissions,
      final Map<String, dynamic>? metadata})
      : _permissions = permissions,
        _metadata = metadata;

  factory _$CreateStaffMemberRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateStaffMemberRequestImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final String role;
  final List<String> _permissions;
  @override
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

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
    return 'CreateStaffMemberRequest(name: $name, email: $email, password: $password, role: $role, permissions: $permissions, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStaffMemberRequestImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      password,
      role,
      const DeepCollectionEquality().hash(_permissions),
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of CreateStaffMemberRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStaffMemberRequestImplCopyWith<_$CreateStaffMemberRequestImpl>
      get copyWith => __$$CreateStaffMemberRequestImplCopyWithImpl<
          _$CreateStaffMemberRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateStaffMemberRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateStaffMemberRequest implements CreateStaffMemberRequest {
  const factory _CreateStaffMemberRequest(
      {required final String name,
      required final String email,
      required final String password,
      required final String role,
      required final List<String> permissions,
      final Map<String, dynamic>? metadata}) = _$CreateStaffMemberRequestImpl;

  factory _CreateStaffMemberRequest.fromJson(Map<String, dynamic> json) =
      _$CreateStaffMemberRequestImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  String get role;
  @override
  List<String> get permissions;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of CreateStaffMemberRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateStaffMemberRequestImplCopyWith<_$CreateStaffMemberRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UpdateEventRequest _$UpdateEventRequestFromJson(Map<String, dynamic> json) {
  return _UpdateEventRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateEventRequest {
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get bannerImagePath => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  EventCategory? get category => throw _privateConstructorUsedError;
  List<UpdateTicketTypeRequest>? get ticketTypes =>
      throw _privateConstructorUsedError;
  int? get maxCapacity => throw _privateConstructorUsedError;
  EventStatus? get status => throw _privateConstructorUsedError;
  String? get cancellationReason => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this UpdateEventRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateEventRequestCopyWith<UpdateEventRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEventRequestCopyWith<$Res> {
  factory $UpdateEventRequestCopyWith(
          UpdateEventRequest value, $Res Function(UpdateEventRequest) then) =
      _$UpdateEventRequestCopyWithImpl<$Res, UpdateEventRequest>;
  @useResult
  $Res call(
      {String? title,
      String? description,
      String? bannerImagePath,
      String? location,
      DateTime? dateTime,
      EventCategory? category,
      List<UpdateTicketTypeRequest>? ticketTypes,
      int? maxCapacity,
      EventStatus? status,
      String? cancellationReason,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$UpdateEventRequestCopyWithImpl<$Res, $Val extends UpdateEventRequest>
    implements $UpdateEventRequestCopyWith<$Res> {
  _$UpdateEventRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? bannerImagePath = freezed,
    Object? location = freezed,
    Object? dateTime = freezed,
    Object? category = freezed,
    Object? ticketTypes = freezed,
    Object? maxCapacity = freezed,
    Object? status = freezed,
    Object? cancellationReason = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerImagePath: freezed == bannerImagePath
          ? _value.bannerImagePath
          : bannerImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EventCategory?,
      ticketTypes: freezed == ticketTypes
          ? _value.ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<UpdateTicketTypeRequest>?,
      maxCapacity: freezed == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateEventRequestImplCopyWith<$Res>
    implements $UpdateEventRequestCopyWith<$Res> {
  factory _$$UpdateEventRequestImplCopyWith(_$UpdateEventRequestImpl value,
          $Res Function(_$UpdateEventRequestImpl) then) =
      __$$UpdateEventRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? description,
      String? bannerImagePath,
      String? location,
      DateTime? dateTime,
      EventCategory? category,
      List<UpdateTicketTypeRequest>? ticketTypes,
      int? maxCapacity,
      EventStatus? status,
      String? cancellationReason,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$UpdateEventRequestImplCopyWithImpl<$Res>
    extends _$UpdateEventRequestCopyWithImpl<$Res, _$UpdateEventRequestImpl>
    implements _$$UpdateEventRequestImplCopyWith<$Res> {
  __$$UpdateEventRequestImplCopyWithImpl(_$UpdateEventRequestImpl _value,
      $Res Function(_$UpdateEventRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? bannerImagePath = freezed,
    Object? location = freezed,
    Object? dateTime = freezed,
    Object? category = freezed,
    Object? ticketTypes = freezed,
    Object? maxCapacity = freezed,
    Object? status = freezed,
    Object? cancellationReason = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$UpdateEventRequestImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      bannerImagePath: freezed == bannerImagePath
          ? _value.bannerImagePath
          : bannerImagePath // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EventCategory?,
      ticketTypes: freezed == ticketTypes
          ? _value._ticketTypes
          : ticketTypes // ignore: cast_nullable_to_non_nullable
              as List<UpdateTicketTypeRequest>?,
      maxCapacity: freezed == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateEventRequestImpl implements _UpdateEventRequest {
  const _$UpdateEventRequestImpl(
      {this.title,
      this.description,
      this.bannerImagePath,
      this.location,
      this.dateTime,
      this.category,
      final List<UpdateTicketTypeRequest>? ticketTypes,
      this.maxCapacity,
      this.status,
      this.cancellationReason,
      final Map<String, dynamic>? metadata})
      : _ticketTypes = ticketTypes,
        _metadata = metadata;

  factory _$UpdateEventRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateEventRequestImplFromJson(json);

  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? bannerImagePath;
  @override
  final String? location;
  @override
  final DateTime? dateTime;
  @override
  final EventCategory? category;
  final List<UpdateTicketTypeRequest>? _ticketTypes;
  @override
  List<UpdateTicketTypeRequest>? get ticketTypes {
    final value = _ticketTypes;
    if (value == null) return null;
    if (_ticketTypes is EqualUnmodifiableListView) return _ticketTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? maxCapacity;
  @override
  final EventStatus? status;
  @override
  final String? cancellationReason;
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
    return 'UpdateEventRequest(title: $title, description: $description, bannerImagePath: $bannerImagePath, location: $location, dateTime: $dateTime, category: $category, ticketTypes: $ticketTypes, maxCapacity: $maxCapacity, status: $status, cancellationReason: $cancellationReason, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEventRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.bannerImagePath, bannerImagePath) ||
                other.bannerImagePath == bannerImagePath) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._ticketTypes, _ticketTypes) &&
            (identical(other.maxCapacity, maxCapacity) ||
                other.maxCapacity == maxCapacity) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      bannerImagePath,
      location,
      dateTime,
      category,
      const DeepCollectionEquality().hash(_ticketTypes),
      maxCapacity,
      status,
      cancellationReason,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of UpdateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEventRequestImplCopyWith<_$UpdateEventRequestImpl> get copyWith =>
      __$$UpdateEventRequestImplCopyWithImpl<_$UpdateEventRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateEventRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateEventRequest implements UpdateEventRequest {
  const factory _UpdateEventRequest(
      {final String? title,
      final String? description,
      final String? bannerImagePath,
      final String? location,
      final DateTime? dateTime,
      final EventCategory? category,
      final List<UpdateTicketTypeRequest>? ticketTypes,
      final int? maxCapacity,
      final EventStatus? status,
      final String? cancellationReason,
      final Map<String, dynamic>? metadata}) = _$UpdateEventRequestImpl;

  factory _UpdateEventRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateEventRequestImpl.fromJson;

  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get bannerImagePath;
  @override
  String? get location;
  @override
  DateTime? get dateTime;
  @override
  EventCategory? get category;
  @override
  List<UpdateTicketTypeRequest>? get ticketTypes;
  @override
  int? get maxCapacity;
  @override
  EventStatus? get status;
  @override
  String? get cancellationReason;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of UpdateEventRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEventRequestImplCopyWith<_$UpdateEventRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UpdateTicketTypeRequest _$UpdateTicketTypeRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateTicketTypeRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateTicketTypeRequest {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  DateTime? get saleStartDate => throw _privateConstructorUsedError;
  DateTime? get saleEndDate => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this UpdateTicketTypeRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTicketTypeRequestCopyWith<UpdateTicketTypeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTicketTypeRequestCopyWith<$Res> {
  factory $UpdateTicketTypeRequestCopyWith(UpdateTicketTypeRequest value,
          $Res Function(UpdateTicketTypeRequest) then) =
      _$UpdateTicketTypeRequestCopyWithImpl<$Res, UpdateTicketTypeRequest>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? description,
      double? price,
      int? quantity,
      bool? isActive,
      DateTime? saleStartDate,
      DateTime? saleEndDate,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$UpdateTicketTypeRequestCopyWithImpl<$Res,
        $Val extends UpdateTicketTypeRequest>
    implements $UpdateTicketTypeRequestCopyWith<$Res> {
  _$UpdateTicketTypeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? isActive = freezed,
    Object? saleStartDate = freezed,
    Object? saleEndDate = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      saleStartDate: freezed == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleEndDate: freezed == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTicketTypeRequestImplCopyWith<$Res>
    implements $UpdateTicketTypeRequestCopyWith<$Res> {
  factory _$$UpdateTicketTypeRequestImplCopyWith(
          _$UpdateTicketTypeRequestImpl value,
          $Res Function(_$UpdateTicketTypeRequestImpl) then) =
      __$$UpdateTicketTypeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? description,
      double? price,
      int? quantity,
      bool? isActive,
      DateTime? saleStartDate,
      DateTime? saleEndDate,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$UpdateTicketTypeRequestImplCopyWithImpl<$Res>
    extends _$UpdateTicketTypeRequestCopyWithImpl<$Res,
        _$UpdateTicketTypeRequestImpl>
    implements _$$UpdateTicketTypeRequestImplCopyWith<$Res> {
  __$$UpdateTicketTypeRequestImplCopyWithImpl(
      _$UpdateTicketTypeRequestImpl _value,
      $Res Function(_$UpdateTicketTypeRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? isActive = freezed,
    Object? saleStartDate = freezed,
    Object? saleEndDate = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$UpdateTicketTypeRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      saleStartDate: freezed == saleStartDate
          ? _value.saleStartDate
          : saleStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleEndDate: freezed == saleEndDate
          ? _value.saleEndDate
          : saleEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateTicketTypeRequestImpl implements _UpdateTicketTypeRequest {
  const _$UpdateTicketTypeRequestImpl(
      {required this.id,
      this.name,
      this.description,
      this.price,
      this.quantity,
      this.isActive,
      this.saleStartDate,
      this.saleEndDate,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$UpdateTicketTypeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateTicketTypeRequestImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? price;
  @override
  final int? quantity;
  @override
  final bool? isActive;
  @override
  final DateTime? saleStartDate;
  @override
  final DateTime? saleEndDate;
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
    return 'UpdateTicketTypeRequest(id: $id, name: $name, description: $description, price: $price, quantity: $quantity, isActive: $isActive, saleStartDate: $saleStartDate, saleEndDate: $saleEndDate, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTicketTypeRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.saleStartDate, saleStartDate) ||
                other.saleStartDate == saleStartDate) &&
            (identical(other.saleEndDate, saleEndDate) ||
                other.saleEndDate == saleEndDate) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      price,
      quantity,
      isActive,
      saleStartDate,
      saleEndDate,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of UpdateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTicketTypeRequestImplCopyWith<_$UpdateTicketTypeRequestImpl>
      get copyWith => __$$UpdateTicketTypeRequestImplCopyWithImpl<
          _$UpdateTicketTypeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTicketTypeRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateTicketTypeRequest implements UpdateTicketTypeRequest {
  const factory _UpdateTicketTypeRequest(
      {required final String id,
      final String? name,
      final String? description,
      final double? price,
      final int? quantity,
      final bool? isActive,
      final DateTime? saleStartDate,
      final DateTime? saleEndDate,
      final Map<String, dynamic>? metadata}) = _$UpdateTicketTypeRequestImpl;

  factory _UpdateTicketTypeRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateTicketTypeRequestImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  double? get price;
  @override
  int? get quantity;
  @override
  bool? get isActive;
  @override
  DateTime? get saleStartDate;
  @override
  DateTime? get saleEndDate;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of UpdateTicketTypeRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTicketTypeRequestImplCopyWith<_$UpdateTicketTypeRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
