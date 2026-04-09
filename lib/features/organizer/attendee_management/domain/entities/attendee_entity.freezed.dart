// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendee_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendeeEntity _$AttendeeEntityFromJson(Map<String, dynamic> json) {
  return _AttendeeEntity.fromJson(json);
}

/// @nodoc
mixin _$AttendeeEntity {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get eventTitle => throw _privateConstructorUsedError;
  List<TicketEntity> get tickets => throw _privateConstructorUsedError;
  AttendeeStatus get status => throw _privateConstructorUsedError;
  DateTime get registrationDate => throw _privateConstructorUsedError;
  DateTime? get checkInDate => throw _privateConstructorUsedError;
  int get totalTickets => throw _privateConstructorUsedError;
  double get totalSpent => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this AttendeeEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendeeEntityCopyWith<AttendeeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendeeEntityCopyWith<$Res> {
  factory $AttendeeEntityCopyWith(
          AttendeeEntity value, $Res Function(AttendeeEntity) then) =
      _$AttendeeEntityCopyWithImpl<$Res, AttendeeEntity>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String email,
      String? phone,
      String? profileImageUrl,
      String eventId,
      String eventTitle,
      List<TicketEntity> tickets,
      AttendeeStatus status,
      DateTime registrationDate,
      DateTime? checkInDate,
      int totalTickets,
      double totalSpent,
      Map<String, dynamic>? metadata,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$AttendeeEntityCopyWithImpl<$Res, $Val extends AttendeeEntity>
    implements $AttendeeEntityCopyWith<$Res> {
  _$AttendeeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? profileImageUrl = freezed,
    Object? eventId = null,
    Object? eventTitle = null,
    Object? tickets = null,
    Object? status = null,
    Object? registrationDate = null,
    Object? checkInDate = freezed,
    Object? totalTickets = null,
    Object? totalSpent = null,
    Object? metadata = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalTickets: null == totalTickets
          ? _value.totalTickets
          : totalTickets // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$AttendeeEntityImplCopyWith<$Res>
    implements $AttendeeEntityCopyWith<$Res> {
  factory _$$AttendeeEntityImplCopyWith(_$AttendeeEntityImpl value,
          $Res Function(_$AttendeeEntityImpl) then) =
      __$$AttendeeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String email,
      String? phone,
      String? profileImageUrl,
      String eventId,
      String eventTitle,
      List<TicketEntity> tickets,
      AttendeeStatus status,
      DateTime registrationDate,
      DateTime? checkInDate,
      int totalTickets,
      double totalSpent,
      Map<String, dynamic>? metadata,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$AttendeeEntityImplCopyWithImpl<$Res>
    extends _$AttendeeEntityCopyWithImpl<$Res, _$AttendeeEntityImpl>
    implements _$$AttendeeEntityImplCopyWith<$Res> {
  __$$AttendeeEntityImplCopyWithImpl(
      _$AttendeeEntityImpl _value, $Res Function(_$AttendeeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? profileImageUrl = freezed,
    Object? eventId = null,
    Object? eventTitle = null,
    Object? tickets = null,
    Object? status = null,
    Object? registrationDate = null,
    Object? checkInDate = freezed,
    Object? totalTickets = null,
    Object? totalSpent = null,
    Object? metadata = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$AttendeeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      tickets: null == tickets
          ? _value._tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as List<TicketEntity>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkInDate: freezed == checkInDate
          ? _value.checkInDate
          : checkInDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalTickets: null == totalTickets
          ? _value.totalTickets
          : totalTickets // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$AttendeeEntityImpl extends _AttendeeEntity {
  const _$AttendeeEntityImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.email,
      this.phone,
      this.profileImageUrl,
      required this.eventId,
      required this.eventTitle,
      required final List<TicketEntity> tickets,
      required this.status,
      required this.registrationDate,
      this.checkInDate,
      this.totalTickets = 0,
      this.totalSpent = 0.0,
      final Map<String, dynamic>? metadata,
      this.notes,
      required this.createdAt,
      required this.updatedAt})
      : _tickets = tickets,
        _metadata = metadata,
        super._();

  factory _$AttendeeEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendeeEntityImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String? profileImageUrl;
  @override
  final String eventId;
  @override
  final String eventTitle;
  final List<TicketEntity> _tickets;
  @override
  List<TicketEntity> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  @override
  final AttendeeStatus status;
  @override
  final DateTime registrationDate;
  @override
  final DateTime? checkInDate;
  @override
  @JsonKey()
  final int totalTickets;
  @override
  @JsonKey()
  final double totalSpent;
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
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'AttendeeEntity(id: $id, userId: $userId, name: $name, email: $email, phone: $phone, profileImageUrl: $profileImageUrl, eventId: $eventId, eventTitle: $eventTitle, tickets: $tickets, status: $status, registrationDate: $registrationDate, checkInDate: $checkInDate, totalTickets: $totalTickets, totalSpent: $totalSpent, metadata: $metadata, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendeeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.registrationDate, registrationDate) ||
                other.registrationDate == registrationDate) &&
            (identical(other.checkInDate, checkInDate) ||
                other.checkInDate == checkInDate) &&
            (identical(other.totalTickets, totalTickets) ||
                other.totalTickets == totalTickets) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      email,
      phone,
      profileImageUrl,
      eventId,
      eventTitle,
      const DeepCollectionEquality().hash(_tickets),
      status,
      registrationDate,
      checkInDate,
      totalTickets,
      totalSpent,
      const DeepCollectionEquality().hash(_metadata),
      notes,
      createdAt,
      updatedAt);

  /// Create a copy of AttendeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendeeEntityImplCopyWith<_$AttendeeEntityImpl> get copyWith =>
      __$$AttendeeEntityImplCopyWithImpl<_$AttendeeEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendeeEntityImplToJson(
      this,
    );
  }
}

abstract class _AttendeeEntity extends AttendeeEntity {
  const factory _AttendeeEntity(
      {required final String id,
      required final String userId,
      required final String name,
      required final String email,
      final String? phone,
      final String? profileImageUrl,
      required final String eventId,
      required final String eventTitle,
      required final List<TicketEntity> tickets,
      required final AttendeeStatus status,
      required final DateTime registrationDate,
      final DateTime? checkInDate,
      final int totalTickets,
      final double totalSpent,
      final Map<String, dynamic>? metadata,
      final String? notes,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$AttendeeEntityImpl;
  const _AttendeeEntity._() : super._();

  factory _AttendeeEntity.fromJson(Map<String, dynamic> json) =
      _$AttendeeEntityImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String? get profileImageUrl;
  @override
  String get eventId;
  @override
  String get eventTitle;
  @override
  List<TicketEntity> get tickets;
  @override
  AttendeeStatus get status;
  @override
  DateTime get registrationDate;
  @override
  DateTime? get checkInDate;
  @override
  int get totalTickets;
  @override
  double get totalSpent;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of AttendeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendeeEntityImplCopyWith<_$AttendeeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
