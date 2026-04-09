// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_discovery_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventDiscoveryEntity _$EventDiscoveryEntityFromJson(Map<String, dynamic> json) {
  return _EventDiscoveryEntity.fromJson(json);
}

/// @nodoc
mixin _$EventDiscoveryEntity {
  String get id => throw _privateConstructorUsedError;
  String get organizerId => throw _privateConstructorUsedError;
  String get organizerName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get bannerUrl => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;
  EventCategory get category => throw _privateConstructorUsedError;
  List<TicketTypeInfo> get ticketTypes => throw _privateConstructorUsedError;
  int get maxCapacity => throw _privateConstructorUsedError;
  int get availableTickets => throw _privateConstructorUsedError;
  double get minPrice => throw _privateConstructorUsedError;
  double get maxPrice => throw _privateConstructorUsedError;
  EventStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  double? get distance =>
      throw _privateConstructorUsedError; // Distance from user location
  bool? get isFavorite =>
      throw _privateConstructorUsedError; // User's favorite status
  int? get attendeeCount => throw _privateConstructorUsedError;

  /// Serializes this EventDiscoveryEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventDiscoveryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventDiscoveryEntityCopyWith<EventDiscoveryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDiscoveryEntityCopyWith<$Res> {
  factory $EventDiscoveryEntityCopyWith(EventDiscoveryEntity value,
          $Res Function(EventDiscoveryEntity) then) =
      _$EventDiscoveryEntityCopyWithImpl<$Res, EventDiscoveryEntity>;
  @useResult
  $Res call(
      {String id,
      String organizerId,
      String organizerName,
      String title,
      String description,
      String? bannerUrl,
      String location,
      DateTime dateTime,
      EventCategory category,
      List<TicketTypeInfo> ticketTypes,
      int maxCapacity,
      int availableTickets,
      double minPrice,
      double maxPrice,
      EventStatus status,
      DateTime createdAt,
      double? distance,
      bool? isFavorite,
      int? attendeeCount});
}

/// @nodoc
class _$EventDiscoveryEntityCopyWithImpl<$Res,
        $Val extends EventDiscoveryEntity>
    implements $EventDiscoveryEntityCopyWith<$Res> {
  _$EventDiscoveryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventDiscoveryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizerId = null,
    Object? organizerName = null,
    Object? title = null,
    Object? description = null,
    Object? bannerUrl = freezed,
    Object? location = null,
    Object? dateTime = null,
    Object? category = null,
    Object? ticketTypes = null,
    Object? maxCapacity = null,
    Object? availableTickets = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? status = null,
    Object? createdAt = null,
    Object? distance = freezed,
    Object? isFavorite = freezed,
    Object? attendeeCount = freezed,
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
      organizerName: null == organizerName
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
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
              as List<TicketTypeInfo>,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      availableTickets: null == availableTickets
          ? _value.availableTickets
          : availableTickets // ignore: cast_nullable_to_non_nullable
              as int,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      attendeeCount: freezed == attendeeCount
          ? _value.attendeeCount
          : attendeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventDiscoveryEntityImplCopyWith<$Res>
    implements $EventDiscoveryEntityCopyWith<$Res> {
  factory _$$EventDiscoveryEntityImplCopyWith(_$EventDiscoveryEntityImpl value,
          $Res Function(_$EventDiscoveryEntityImpl) then) =
      __$$EventDiscoveryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String organizerId,
      String organizerName,
      String title,
      String description,
      String? bannerUrl,
      String location,
      DateTime dateTime,
      EventCategory category,
      List<TicketTypeInfo> ticketTypes,
      int maxCapacity,
      int availableTickets,
      double minPrice,
      double maxPrice,
      EventStatus status,
      DateTime createdAt,
      double? distance,
      bool? isFavorite,
      int? attendeeCount});
}

/// @nodoc
class __$$EventDiscoveryEntityImplCopyWithImpl<$Res>
    extends _$EventDiscoveryEntityCopyWithImpl<$Res, _$EventDiscoveryEntityImpl>
    implements _$$EventDiscoveryEntityImplCopyWith<$Res> {
  __$$EventDiscoveryEntityImplCopyWithImpl(_$EventDiscoveryEntityImpl _value,
      $Res Function(_$EventDiscoveryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventDiscoveryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizerId = null,
    Object? organizerName = null,
    Object? title = null,
    Object? description = null,
    Object? bannerUrl = freezed,
    Object? location = null,
    Object? dateTime = null,
    Object? category = null,
    Object? ticketTypes = null,
    Object? maxCapacity = null,
    Object? availableTickets = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? status = null,
    Object? createdAt = null,
    Object? distance = freezed,
    Object? isFavorite = freezed,
    Object? attendeeCount = freezed,
  }) {
    return _then(_$EventDiscoveryEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerName: null == organizerName
          ? _value.organizerName
          : organizerName // ignore: cast_nullable_to_non_nullable
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
              as List<TicketTypeInfo>,
      maxCapacity: null == maxCapacity
          ? _value.maxCapacity
          : maxCapacity // ignore: cast_nullable_to_non_nullable
              as int,
      availableTickets: null == availableTickets
          ? _value.availableTickets
          : availableTickets // ignore: cast_nullable_to_non_nullable
              as int,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      attendeeCount: freezed == attendeeCount
          ? _value.attendeeCount
          : attendeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventDiscoveryEntityImpl extends _EventDiscoveryEntity {
  const _$EventDiscoveryEntityImpl(
      {required this.id,
      required this.organizerId,
      required this.organizerName,
      required this.title,
      required this.description,
      this.bannerUrl,
      required this.location,
      required this.dateTime,
      required this.category,
      required final List<TicketTypeInfo> ticketTypes,
      required this.maxCapacity,
      required this.availableTickets,
      required this.minPrice,
      required this.maxPrice,
      required this.status,
      required this.createdAt,
      this.distance,
      this.isFavorite,
      this.attendeeCount})
      : _ticketTypes = ticketTypes,
        super._();

  factory _$EventDiscoveryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventDiscoveryEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String organizerId;
  @override
  final String organizerName;
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
  final List<TicketTypeInfo> _ticketTypes;
  @override
  List<TicketTypeInfo> get ticketTypes {
    if (_ticketTypes is EqualUnmodifiableListView) return _ticketTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ticketTypes);
  }

  @override
  final int maxCapacity;
  @override
  final int availableTickets;
  @override
  final double minPrice;
  @override
  final double maxPrice;
  @override
  final EventStatus status;
  @override
  final DateTime createdAt;
  @override
  final double? distance;
// Distance from user location
  @override
  final bool? isFavorite;
// User's favorite status
  @override
  final int? attendeeCount;

  @override
  String toString() {
    return 'EventDiscoveryEntity(id: $id, organizerId: $organizerId, organizerName: $organizerName, title: $title, description: $description, bannerUrl: $bannerUrl, location: $location, dateTime: $dateTime, category: $category, ticketTypes: $ticketTypes, maxCapacity: $maxCapacity, availableTickets: $availableTickets, minPrice: $minPrice, maxPrice: $maxPrice, status: $status, createdAt: $createdAt, distance: $distance, isFavorite: $isFavorite, attendeeCount: $attendeeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventDiscoveryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.organizerName, organizerName) ||
                other.organizerName == organizerName) &&
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
            (identical(other.availableTickets, availableTickets) ||
                other.availableTickets == availableTickets) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.attendeeCount, attendeeCount) ||
                other.attendeeCount == attendeeCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        organizerId,
        organizerName,
        title,
        description,
        bannerUrl,
        location,
        dateTime,
        category,
        const DeepCollectionEquality().hash(_ticketTypes),
        maxCapacity,
        availableTickets,
        minPrice,
        maxPrice,
        status,
        createdAt,
        distance,
        isFavorite,
        attendeeCount
      ]);

  /// Create a copy of EventDiscoveryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventDiscoveryEntityImplCopyWith<_$EventDiscoveryEntityImpl>
      get copyWith =>
          __$$EventDiscoveryEntityImplCopyWithImpl<_$EventDiscoveryEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventDiscoveryEntityImplToJson(
      this,
    );
  }
}

abstract class _EventDiscoveryEntity extends EventDiscoveryEntity {
  const factory _EventDiscoveryEntity(
      {required final String id,
      required final String organizerId,
      required final String organizerName,
      required final String title,
      required final String description,
      final String? bannerUrl,
      required final String location,
      required final DateTime dateTime,
      required final EventCategory category,
      required final List<TicketTypeInfo> ticketTypes,
      required final int maxCapacity,
      required final int availableTickets,
      required final double minPrice,
      required final double maxPrice,
      required final EventStatus status,
      required final DateTime createdAt,
      final double? distance,
      final bool? isFavorite,
      final int? attendeeCount}) = _$EventDiscoveryEntityImpl;
  const _EventDiscoveryEntity._() : super._();

  factory _EventDiscoveryEntity.fromJson(Map<String, dynamic> json) =
      _$EventDiscoveryEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get organizerId;
  @override
  String get organizerName;
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
  List<TicketTypeInfo> get ticketTypes;
  @override
  int get maxCapacity;
  @override
  int get availableTickets;
  @override
  double get minPrice;
  @override
  double get maxPrice;
  @override
  EventStatus get status;
  @override
  DateTime get createdAt;
  @override
  double? get distance; // Distance from user location
  @override
  bool? get isFavorite; // User's favorite status
  @override
  int? get attendeeCount;

  /// Create a copy of EventDiscoveryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventDiscoveryEntityImplCopyWith<_$EventDiscoveryEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TicketTypeInfo _$TicketTypeInfoFromJson(Map<String, dynamic> json) {
  return _TicketTypeInfo.fromJson(json);
}

/// @nodoc
mixin _$TicketTypeInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int get availableQuantity => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this TicketTypeInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketTypeInfoCopyWith<TicketTypeInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketTypeInfoCopyWith<$Res> {
  factory $TicketTypeInfoCopyWith(
          TicketTypeInfo value, $Res Function(TicketTypeInfo) then) =
      _$TicketTypeInfoCopyWithImpl<$Res, TicketTypeInfo>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      int availableQuantity,
      int totalQuantity,
      bool isActive});
}

/// @nodoc
class _$TicketTypeInfoCopyWithImpl<$Res, $Val extends TicketTypeInfo>
    implements $TicketTypeInfoCopyWith<$Res> {
  _$TicketTypeInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? availableQuantity = null,
    Object? totalQuantity = null,
    Object? isActive = null,
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
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketTypeInfoImplCopyWith<$Res>
    implements $TicketTypeInfoCopyWith<$Res> {
  factory _$$TicketTypeInfoImplCopyWith(_$TicketTypeInfoImpl value,
          $Res Function(_$TicketTypeInfoImpl) then) =
      __$$TicketTypeInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      double price,
      int availableQuantity,
      int totalQuantity,
      bool isActive});
}

/// @nodoc
class __$$TicketTypeInfoImplCopyWithImpl<$Res>
    extends _$TicketTypeInfoCopyWithImpl<$Res, _$TicketTypeInfoImpl>
    implements _$$TicketTypeInfoImplCopyWith<$Res> {
  __$$TicketTypeInfoImplCopyWithImpl(
      _$TicketTypeInfoImpl _value, $Res Function(_$TicketTypeInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? availableQuantity = null,
    Object? totalQuantity = null,
    Object? isActive = null,
  }) {
    return _then(_$TicketTypeInfoImpl(
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
      availableQuantity: null == availableQuantity
          ? _value.availableQuantity
          : availableQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketTypeInfoImpl extends _TicketTypeInfo {
  const _$TicketTypeInfoImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.availableQuantity,
      required this.totalQuantity,
      required this.isActive})
      : super._();

  factory _$TicketTypeInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketTypeInfoImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double price;
  @override
  final int availableQuantity;
  @override
  final int totalQuantity;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'TicketTypeInfo(id: $id, name: $name, description: $description, price: $price, availableQuantity: $availableQuantity, totalQuantity: $totalQuantity, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketTypeInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.availableQuantity, availableQuantity) ||
                other.availableQuantity == availableQuantity) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, price,
      availableQuantity, totalQuantity, isActive);

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketTypeInfoImplCopyWith<_$TicketTypeInfoImpl> get copyWith =>
      __$$TicketTypeInfoImplCopyWithImpl<_$TicketTypeInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketTypeInfoImplToJson(
      this,
    );
  }
}

abstract class _TicketTypeInfo extends TicketTypeInfo {
  const factory _TicketTypeInfo(
      {required final String id,
      required final String name,
      required final String description,
      required final double price,
      required final int availableQuantity,
      required final int totalQuantity,
      required final bool isActive}) = _$TicketTypeInfoImpl;
  const _TicketTypeInfo._() : super._();

  factory _TicketTypeInfo.fromJson(Map<String, dynamic> json) =
      _$TicketTypeInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  int get availableQuantity;
  @override
  int get totalQuantity;
  @override
  bool get isActive;

  /// Create a copy of TicketTypeInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketTypeInfoImplCopyWith<_$TicketTypeInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EventSearchFilters _$EventSearchFiltersFromJson(Map<String, dynamic> json) {
  return _EventSearchFilters.fromJson(json);
}

/// @nodoc
mixin _$EventSearchFilters {
  String? get query => throw _privateConstructorUsedError;
  EventCategory? get category => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  double? get minPrice => throw _privateConstructorUsedError;
  double? get maxPrice => throw _privateConstructorUsedError;
  double? get maxDistance => throw _privateConstructorUsedError;
  bool? get freeOnly => throw _privateConstructorUsedError;
  bool? get availableOnly => throw _privateConstructorUsedError;
  EventSortBy? get sortBy => throw _privateConstructorUsedError;

  /// Serializes this EventSearchFilters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventSearchFiltersCopyWith<EventSearchFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventSearchFiltersCopyWith<$Res> {
  factory $EventSearchFiltersCopyWith(
          EventSearchFilters value, $Res Function(EventSearchFilters) then) =
      _$EventSearchFiltersCopyWithImpl<$Res, EventSearchFilters>;
  @useResult
  $Res call(
      {String? query,
      EventCategory? category,
      DateTime? startDate,
      DateTime? endDate,
      double? minPrice,
      double? maxPrice,
      double? maxDistance,
      bool? freeOnly,
      bool? availableOnly,
      EventSortBy? sortBy});
}

/// @nodoc
class _$EventSearchFiltersCopyWithImpl<$Res, $Val extends EventSearchFilters>
    implements $EventSearchFiltersCopyWith<$Res> {
  _$EventSearchFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? category = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? maxDistance = freezed,
    Object? freeOnly = freezed,
    Object? availableOnly = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_value.copyWith(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EventCategory?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDistance: freezed == maxDistance
          ? _value.maxDistance
          : maxDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      freeOnly: freezed == freeOnly
          ? _value.freeOnly
          : freeOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      availableOnly: freezed == availableOnly
          ? _value.availableOnly
          : availableOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as EventSortBy?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventSearchFiltersImplCopyWith<$Res>
    implements $EventSearchFiltersCopyWith<$Res> {
  factory _$$EventSearchFiltersImplCopyWith(_$EventSearchFiltersImpl value,
          $Res Function(_$EventSearchFiltersImpl) then) =
      __$$EventSearchFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? query,
      EventCategory? category,
      DateTime? startDate,
      DateTime? endDate,
      double? minPrice,
      double? maxPrice,
      double? maxDistance,
      bool? freeOnly,
      bool? availableOnly,
      EventSortBy? sortBy});
}

/// @nodoc
class __$$EventSearchFiltersImplCopyWithImpl<$Res>
    extends _$EventSearchFiltersCopyWithImpl<$Res, _$EventSearchFiltersImpl>
    implements _$$EventSearchFiltersImplCopyWith<$Res> {
  __$$EventSearchFiltersImplCopyWithImpl(_$EventSearchFiltersImpl _value,
      $Res Function(_$EventSearchFiltersImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
    Object? category = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? maxDistance = freezed,
    Object? freeOnly = freezed,
    Object? availableOnly = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_$EventSearchFiltersImpl(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as EventCategory?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxDistance: freezed == maxDistance
          ? _value.maxDistance
          : maxDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      freeOnly: freezed == freeOnly
          ? _value.freeOnly
          : freeOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      availableOnly: freezed == availableOnly
          ? _value.availableOnly
          : availableOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as EventSortBy?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventSearchFiltersImpl implements _EventSearchFilters {
  const _$EventSearchFiltersImpl(
      {this.query,
      this.category,
      this.startDate,
      this.endDate,
      this.minPrice,
      this.maxPrice,
      this.maxDistance,
      this.freeOnly,
      this.availableOnly,
      this.sortBy});

  factory _$EventSearchFiltersImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventSearchFiltersImplFromJson(json);

  @override
  final String? query;
  @override
  final EventCategory? category;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final double? minPrice;
  @override
  final double? maxPrice;
  @override
  final double? maxDistance;
  @override
  final bool? freeOnly;
  @override
  final bool? availableOnly;
  @override
  final EventSortBy? sortBy;

  @override
  String toString() {
    return 'EventSearchFilters(query: $query, category: $category, startDate: $startDate, endDate: $endDate, minPrice: $minPrice, maxPrice: $maxPrice, maxDistance: $maxDistance, freeOnly: $freeOnly, availableOnly: $availableOnly, sortBy: $sortBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSearchFiltersImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.maxDistance, maxDistance) ||
                other.maxDistance == maxDistance) &&
            (identical(other.freeOnly, freeOnly) ||
                other.freeOnly == freeOnly) &&
            (identical(other.availableOnly, availableOnly) ||
                other.availableOnly == availableOnly) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      query,
      category,
      startDate,
      endDate,
      minPrice,
      maxPrice,
      maxDistance,
      freeOnly,
      availableOnly,
      sortBy);

  /// Create a copy of EventSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSearchFiltersImplCopyWith<_$EventSearchFiltersImpl> get copyWith =>
      __$$EventSearchFiltersImplCopyWithImpl<_$EventSearchFiltersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventSearchFiltersImplToJson(
      this,
    );
  }
}

abstract class _EventSearchFilters implements EventSearchFilters {
  const factory _EventSearchFilters(
      {final String? query,
      final EventCategory? category,
      final DateTime? startDate,
      final DateTime? endDate,
      final double? minPrice,
      final double? maxPrice,
      final double? maxDistance,
      final bool? freeOnly,
      final bool? availableOnly,
      final EventSortBy? sortBy}) = _$EventSearchFiltersImpl;

  factory _EventSearchFilters.fromJson(Map<String, dynamic> json) =
      _$EventSearchFiltersImpl.fromJson;

  @override
  String? get query;
  @override
  EventCategory? get category;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  double? get minPrice;
  @override
  double? get maxPrice;
  @override
  double? get maxDistance;
  @override
  bool? get freeOnly;
  @override
  bool? get availableOnly;
  @override
  EventSortBy? get sortBy;

  /// Create a copy of EventSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventSearchFiltersImplCopyWith<_$EventSearchFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
