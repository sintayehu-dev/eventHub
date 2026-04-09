// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_member_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StaffMemberEntity _$StaffMemberEntityFromJson(Map<String, dynamic> json) {
  return _StaffMemberEntity.fromJson(json);
}

/// @nodoc
mixin _$StaffMemberEntity {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  String get organizerId => throw _privateConstructorUsedError;
  StaffRole get role => throw _privateConstructorUsedError;
  StaffStatus get status => throw _privateConstructorUsedError;
  List<String> get permissions => throw _privateConstructorUsedError;
  List<String> get assignedEventIds => throw _privateConstructorUsedError;
  String? get currentEventId => throw _privateConstructorUsedError;
  DateTime get joinDate => throw _privateConstructorUsedError;
  DateTime? get lastActiveDate => throw _privateConstructorUsedError;
  int get totalEventsWorked => throw _privateConstructorUsedError;
  int get totalHoursWorked => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this StaffMemberEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StaffMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffMemberEntityCopyWith<StaffMemberEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffMemberEntityCopyWith<$Res> {
  factory $StaffMemberEntityCopyWith(
          StaffMemberEntity value, $Res Function(StaffMemberEntity) then) =
      _$StaffMemberEntityCopyWithImpl<$Res, StaffMemberEntity>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String email,
      String? phone,
      String? profileImageUrl,
      String organizerId,
      StaffRole role,
      StaffStatus status,
      List<String> permissions,
      List<String> assignedEventIds,
      String? currentEventId,
      DateTime joinDate,
      DateTime? lastActiveDate,
      int totalEventsWorked,
      int totalHoursWorked,
      Map<String, dynamic>? metadata,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$StaffMemberEntityCopyWithImpl<$Res, $Val extends StaffMemberEntity>
    implements $StaffMemberEntityCopyWith<$Res> {
  _$StaffMemberEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffMemberEntity
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
    Object? organizerId = null,
    Object? role = null,
    Object? status = null,
    Object? permissions = null,
    Object? assignedEventIds = null,
    Object? currentEventId = freezed,
    Object? joinDate = null,
    Object? lastActiveDate = freezed,
    Object? totalEventsWorked = null,
    Object? totalHoursWorked = null,
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
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as StaffRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StaffStatus,
      permissions: null == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      assignedEventIds: null == assignedEventIds
          ? _value.assignedEventIds
          : assignedEventIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentEventId: freezed == currentEventId
          ? _value.currentEventId
          : currentEventId // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveDate: freezed == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalEventsWorked: null == totalEventsWorked
          ? _value.totalEventsWorked
          : totalEventsWorked // ignore: cast_nullable_to_non_nullable
              as int,
      totalHoursWorked: null == totalHoursWorked
          ? _value.totalHoursWorked
          : totalHoursWorked // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$StaffMemberEntityImplCopyWith<$Res>
    implements $StaffMemberEntityCopyWith<$Res> {
  factory _$$StaffMemberEntityImplCopyWith(_$StaffMemberEntityImpl value,
          $Res Function(_$StaffMemberEntityImpl) then) =
      __$$StaffMemberEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String email,
      String? phone,
      String? profileImageUrl,
      String organizerId,
      StaffRole role,
      StaffStatus status,
      List<String> permissions,
      List<String> assignedEventIds,
      String? currentEventId,
      DateTime joinDate,
      DateTime? lastActiveDate,
      int totalEventsWorked,
      int totalHoursWorked,
      Map<String, dynamic>? metadata,
      String? notes,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$StaffMemberEntityImplCopyWithImpl<$Res>
    extends _$StaffMemberEntityCopyWithImpl<$Res, _$StaffMemberEntityImpl>
    implements _$$StaffMemberEntityImplCopyWith<$Res> {
  __$$StaffMemberEntityImplCopyWithImpl(_$StaffMemberEntityImpl _value,
      $Res Function(_$StaffMemberEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffMemberEntity
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
    Object? organizerId = null,
    Object? role = null,
    Object? status = null,
    Object? permissions = null,
    Object? assignedEventIds = null,
    Object? currentEventId = freezed,
    Object? joinDate = null,
    Object? lastActiveDate = freezed,
    Object? totalEventsWorked = null,
    Object? totalHoursWorked = null,
    Object? metadata = freezed,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$StaffMemberEntityImpl(
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
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as StaffRole,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StaffStatus,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      assignedEventIds: null == assignedEventIds
          ? _value._assignedEventIds
          : assignedEventIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      currentEventId: freezed == currentEventId
          ? _value.currentEventId
          : currentEventId // ignore: cast_nullable_to_non_nullable
              as String?,
      joinDate: null == joinDate
          ? _value.joinDate
          : joinDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveDate: freezed == lastActiveDate
          ? _value.lastActiveDate
          : lastActiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalEventsWorked: null == totalEventsWorked
          ? _value.totalEventsWorked
          : totalEventsWorked // ignore: cast_nullable_to_non_nullable
              as int,
      totalHoursWorked: null == totalHoursWorked
          ? _value.totalHoursWorked
          : totalHoursWorked // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$StaffMemberEntityImpl extends _StaffMemberEntity {
  const _$StaffMemberEntityImpl(
      {required this.id,
      required this.userId,
      required this.name,
      required this.email,
      this.phone,
      this.profileImageUrl,
      required this.organizerId,
      required this.role,
      required this.status,
      required final List<String> permissions,
      required final List<String> assignedEventIds,
      this.currentEventId,
      required this.joinDate,
      this.lastActiveDate,
      this.totalEventsWorked = 0,
      this.totalHoursWorked = 0,
      final Map<String, dynamic>? metadata,
      this.notes,
      required this.createdAt,
      required this.updatedAt})
      : _permissions = permissions,
        _assignedEventIds = assignedEventIds,
        _metadata = metadata,
        super._();

  factory _$StaffMemberEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffMemberEntityImplFromJson(json);

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
  final String organizerId;
  @override
  final StaffRole role;
  @override
  final StaffStatus status;
  final List<String> _permissions;
  @override
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  final List<String> _assignedEventIds;
  @override
  List<String> get assignedEventIds {
    if (_assignedEventIds is EqualUnmodifiableListView)
      return _assignedEventIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignedEventIds);
  }

  @override
  final String? currentEventId;
  @override
  final DateTime joinDate;
  @override
  final DateTime? lastActiveDate;
  @override
  @JsonKey()
  final int totalEventsWorked;
  @override
  @JsonKey()
  final int totalHoursWorked;
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
    return 'StaffMemberEntity(id: $id, userId: $userId, name: $name, email: $email, phone: $phone, profileImageUrl: $profileImageUrl, organizerId: $organizerId, role: $role, status: $status, permissions: $permissions, assignedEventIds: $assignedEventIds, currentEventId: $currentEventId, joinDate: $joinDate, lastActiveDate: $lastActiveDate, totalEventsWorked: $totalEventsWorked, totalHoursWorked: $totalHoursWorked, metadata: $metadata, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffMemberEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            const DeepCollectionEquality()
                .equals(other._assignedEventIds, _assignedEventIds) &&
            (identical(other.currentEventId, currentEventId) ||
                other.currentEventId == currentEventId) &&
            (identical(other.joinDate, joinDate) ||
                other.joinDate == joinDate) &&
            (identical(other.lastActiveDate, lastActiveDate) ||
                other.lastActiveDate == lastActiveDate) &&
            (identical(other.totalEventsWorked, totalEventsWorked) ||
                other.totalEventsWorked == totalEventsWorked) &&
            (identical(other.totalHoursWorked, totalHoursWorked) ||
                other.totalHoursWorked == totalHoursWorked) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
        userId,
        name,
        email,
        phone,
        profileImageUrl,
        organizerId,
        role,
        status,
        const DeepCollectionEquality().hash(_permissions),
        const DeepCollectionEquality().hash(_assignedEventIds),
        currentEventId,
        joinDate,
        lastActiveDate,
        totalEventsWorked,
        totalHoursWorked,
        const DeepCollectionEquality().hash(_metadata),
        notes,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of StaffMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffMemberEntityImplCopyWith<_$StaffMemberEntityImpl> get copyWith =>
      __$$StaffMemberEntityImplCopyWithImpl<_$StaffMemberEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffMemberEntityImplToJson(
      this,
    );
  }
}

abstract class _StaffMemberEntity extends StaffMemberEntity {
  const factory _StaffMemberEntity(
      {required final String id,
      required final String userId,
      required final String name,
      required final String email,
      final String? phone,
      final String? profileImageUrl,
      required final String organizerId,
      required final StaffRole role,
      required final StaffStatus status,
      required final List<String> permissions,
      required final List<String> assignedEventIds,
      final String? currentEventId,
      required final DateTime joinDate,
      final DateTime? lastActiveDate,
      final int totalEventsWorked,
      final int totalHoursWorked,
      final Map<String, dynamic>? metadata,
      final String? notes,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$StaffMemberEntityImpl;
  const _StaffMemberEntity._() : super._();

  factory _StaffMemberEntity.fromJson(Map<String, dynamic> json) =
      _$StaffMemberEntityImpl.fromJson;

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
  String get organizerId;
  @override
  StaffRole get role;
  @override
  StaffStatus get status;
  @override
  List<String> get permissions;
  @override
  List<String> get assignedEventIds;
  @override
  String? get currentEventId;
  @override
  DateTime get joinDate;
  @override
  DateTime? get lastActiveDate;
  @override
  int get totalEventsWorked;
  @override
  int get totalHoursWorked;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of StaffMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffMemberEntityImplCopyWith<_$StaffMemberEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
