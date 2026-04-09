// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProfileEntity {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  UserProfileStatus get status => throw _privateConstructorUsedError;
  UserPreferences get preferences =>
      throw _privateConstructorUsedError; // Role-specific data
  StaffProfileData? get staffData => throw _privateConstructorUsedError;
  OrganizerProfileData? get organizerData => throw _privateConstructorUsedError;
  AttendeeProfileData? get attendeeData => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileEntityCopyWith<UserProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileEntityCopyWith<$Res> {
  factory $UserProfileEntityCopyWith(
          UserProfileEntity value, $Res Function(UserProfileEntity) then) =
      _$UserProfileEntityCopyWithImpl<$Res, UserProfileEntity>;
  @useResult
  $Res call(
      {String id,
      String email,
      String name,
      UserRole role,
      String? phone,
      String? profileImageUrl,
      DateTime? createdAt,
      DateTime? lastLoginAt,
      UserProfileStatus status,
      UserPreferences preferences,
      StaffProfileData? staffData,
      OrganizerProfileData? organizerData,
      AttendeeProfileData? attendeeData});

  $UserPreferencesCopyWith<$Res> get preferences;
  $StaffProfileDataCopyWith<$Res>? get staffData;
  $OrganizerProfileDataCopyWith<$Res>? get organizerData;
  $AttendeeProfileDataCopyWith<$Res>? get attendeeData;
}

/// @nodoc
class _$UserProfileEntityCopyWithImpl<$Res, $Val extends UserProfileEntity>
    implements $UserProfileEntityCopyWith<$Res> {
  _$UserProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? role = null,
    Object? phone = freezed,
    Object? profileImageUrl = freezed,
    Object? createdAt = freezed,
    Object? lastLoginAt = freezed,
    Object? status = null,
    Object? preferences = null,
    Object? staffData = freezed,
    Object? organizerData = freezed,
    Object? attendeeData = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserProfileStatus,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
      staffData: freezed == staffData
          ? _value.staffData
          : staffData // ignore: cast_nullable_to_non_nullable
              as StaffProfileData?,
      organizerData: freezed == organizerData
          ? _value.organizerData
          : organizerData // ignore: cast_nullable_to_non_nullable
              as OrganizerProfileData?,
      attendeeData: freezed == attendeeData
          ? _value.attendeeData
          : attendeeData // ignore: cast_nullable_to_non_nullable
              as AttendeeProfileData?,
    ) as $Val);
  }

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res> get preferences {
    return $UserPreferencesCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffProfileDataCopyWith<$Res>? get staffData {
    if (_value.staffData == null) {
      return null;
    }

    return $StaffProfileDataCopyWith<$Res>(_value.staffData!, (value) {
      return _then(_value.copyWith(staffData: value) as $Val);
    });
  }

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizerProfileDataCopyWith<$Res>? get organizerData {
    if (_value.organizerData == null) {
      return null;
    }

    return $OrganizerProfileDataCopyWith<$Res>(_value.organizerData!, (value) {
      return _then(_value.copyWith(organizerData: value) as $Val);
    });
  }

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendeeProfileDataCopyWith<$Res>? get attendeeData {
    if (_value.attendeeData == null) {
      return null;
    }

    return $AttendeeProfileDataCopyWith<$Res>(_value.attendeeData!, (value) {
      return _then(_value.copyWith(attendeeData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileEntityImplCopyWith<$Res>
    implements $UserProfileEntityCopyWith<$Res> {
  factory _$$UserProfileEntityImplCopyWith(_$UserProfileEntityImpl value,
          $Res Function(_$UserProfileEntityImpl) then) =
      __$$UserProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String name,
      UserRole role,
      String? phone,
      String? profileImageUrl,
      DateTime? createdAt,
      DateTime? lastLoginAt,
      UserProfileStatus status,
      UserPreferences preferences,
      StaffProfileData? staffData,
      OrganizerProfileData? organizerData,
      AttendeeProfileData? attendeeData});

  @override
  $UserPreferencesCopyWith<$Res> get preferences;
  @override
  $StaffProfileDataCopyWith<$Res>? get staffData;
  @override
  $OrganizerProfileDataCopyWith<$Res>? get organizerData;
  @override
  $AttendeeProfileDataCopyWith<$Res>? get attendeeData;
}

/// @nodoc
class __$$UserProfileEntityImplCopyWithImpl<$Res>
    extends _$UserProfileEntityCopyWithImpl<$Res, _$UserProfileEntityImpl>
    implements _$$UserProfileEntityImplCopyWith<$Res> {
  __$$UserProfileEntityImplCopyWithImpl(_$UserProfileEntityImpl _value,
      $Res Function(_$UserProfileEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? role = null,
    Object? phone = freezed,
    Object? profileImageUrl = freezed,
    Object? createdAt = freezed,
    Object? lastLoginAt = freezed,
    Object? status = null,
    Object? preferences = null,
    Object? staffData = freezed,
    Object? organizerData = freezed,
    Object? attendeeData = freezed,
  }) {
    return _then(_$UserProfileEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserProfileStatus,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
      staffData: freezed == staffData
          ? _value.staffData
          : staffData // ignore: cast_nullable_to_non_nullable
              as StaffProfileData?,
      organizerData: freezed == organizerData
          ? _value.organizerData
          : organizerData // ignore: cast_nullable_to_non_nullable
              as OrganizerProfileData?,
      attendeeData: freezed == attendeeData
          ? _value.attendeeData
          : attendeeData // ignore: cast_nullable_to_non_nullable
              as AttendeeProfileData?,
    ));
  }
}

/// @nodoc

class _$UserProfileEntityImpl implements _UserProfileEntity {
  const _$UserProfileEntityImpl(
      {required this.id,
      required this.email,
      required this.name,
      required this.role,
      this.phone,
      this.profileImageUrl,
      this.createdAt,
      this.lastLoginAt,
      this.status = UserProfileStatus.active,
      this.preferences = const UserPreferences(),
      this.staffData,
      this.organizerData,
      this.attendeeData});

  @override
  final String id;
  @override
  final String email;
  @override
  final String name;
  @override
  final UserRole role;
  @override
  final String? phone;
  @override
  final String? profileImageUrl;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? lastLoginAt;
  @override
  @JsonKey()
  final UserProfileStatus status;
  @override
  @JsonKey()
  final UserPreferences preferences;
// Role-specific data
  @override
  final StaffProfileData? staffData;
  @override
  final OrganizerProfileData? organizerData;
  @override
  final AttendeeProfileData? attendeeData;

  @override
  String toString() {
    return 'UserProfileEntity(id: $id, email: $email, name: $name, role: $role, phone: $phone, profileImageUrl: $profileImageUrl, createdAt: $createdAt, lastLoginAt: $lastLoginAt, status: $status, preferences: $preferences, staffData: $staffData, organizerData: $organizerData, attendeeData: $attendeeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.staffData, staffData) ||
                other.staffData == staffData) &&
            (identical(other.organizerData, organizerData) ||
                other.organizerData == organizerData) &&
            (identical(other.attendeeData, attendeeData) ||
                other.attendeeData == attendeeData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      name,
      role,
      phone,
      profileImageUrl,
      createdAt,
      lastLoginAt,
      status,
      preferences,
      staffData,
      organizerData,
      attendeeData);

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileEntityImplCopyWith<_$UserProfileEntityImpl> get copyWith =>
      __$$UserProfileEntityImplCopyWithImpl<_$UserProfileEntityImpl>(
          this, _$identity);
}

abstract class _UserProfileEntity implements UserProfileEntity {
  const factory _UserProfileEntity(
      {required final String id,
      required final String email,
      required final String name,
      required final UserRole role,
      final String? phone,
      final String? profileImageUrl,
      final DateTime? createdAt,
      final DateTime? lastLoginAt,
      final UserProfileStatus status,
      final UserPreferences preferences,
      final StaffProfileData? staffData,
      final OrganizerProfileData? organizerData,
      final AttendeeProfileData? attendeeData}) = _$UserProfileEntityImpl;

  @override
  String get id;
  @override
  String get email;
  @override
  String get name;
  @override
  UserRole get role;
  @override
  String? get phone;
  @override
  String? get profileImageUrl;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastLoginAt;
  @override
  UserProfileStatus get status;
  @override
  UserPreferences get preferences; // Role-specific data
  @override
  StaffProfileData? get staffData;
  @override
  OrganizerProfileData? get organizerData;
  @override
  AttendeeProfileData? get attendeeData;

  /// Create a copy of UserProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileEntityImplCopyWith<_$UserProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StaffProfileData {
  CurrentEventAssignment? get currentEvent =>
      throw _privateConstructorUsedError;
  List<String> get specializations => throw _privateConstructorUsedError;
  int get totalEventsWorked => throw _privateConstructorUsedError;
  int get totalCheckIns => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;
  int get totalHoursWorked => throw _privateConstructorUsedError;

  /// Create a copy of StaffProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffProfileDataCopyWith<StaffProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffProfileDataCopyWith<$Res> {
  factory $StaffProfileDataCopyWith(
          StaffProfileData value, $Res Function(StaffProfileData) then) =
      _$StaffProfileDataCopyWithImpl<$Res, StaffProfileData>;
  @useResult
  $Res call(
      {CurrentEventAssignment? currentEvent,
      List<String> specializations,
      int totalEventsWorked,
      int totalCheckIns,
      double averageRating,
      int totalHoursWorked});

  $CurrentEventAssignmentCopyWith<$Res>? get currentEvent;
}

/// @nodoc
class _$StaffProfileDataCopyWithImpl<$Res, $Val extends StaffProfileData>
    implements $StaffProfileDataCopyWith<$Res> {
  _$StaffProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentEvent = freezed,
    Object? specializations = null,
    Object? totalEventsWorked = null,
    Object? totalCheckIns = null,
    Object? averageRating = null,
    Object? totalHoursWorked = null,
  }) {
    return _then(_value.copyWith(
      currentEvent: freezed == currentEvent
          ? _value.currentEvent
          : currentEvent // ignore: cast_nullable_to_non_nullable
              as CurrentEventAssignment?,
      specializations: null == specializations
          ? _value.specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalEventsWorked: null == totalEventsWorked
          ? _value.totalEventsWorked
          : totalEventsWorked // ignore: cast_nullable_to_non_nullable
              as int,
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalHoursWorked: null == totalHoursWorked
          ? _value.totalHoursWorked
          : totalHoursWorked // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of StaffProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentEventAssignmentCopyWith<$Res>? get currentEvent {
    if (_value.currentEvent == null) {
      return null;
    }

    return $CurrentEventAssignmentCopyWith<$Res>(_value.currentEvent!, (value) {
      return _then(_value.copyWith(currentEvent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffProfileDataImplCopyWith<$Res>
    implements $StaffProfileDataCopyWith<$Res> {
  factory _$$StaffProfileDataImplCopyWith(_$StaffProfileDataImpl value,
          $Res Function(_$StaffProfileDataImpl) then) =
      __$$StaffProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CurrentEventAssignment? currentEvent,
      List<String> specializations,
      int totalEventsWorked,
      int totalCheckIns,
      double averageRating,
      int totalHoursWorked});

  @override
  $CurrentEventAssignmentCopyWith<$Res>? get currentEvent;
}

/// @nodoc
class __$$StaffProfileDataImplCopyWithImpl<$Res>
    extends _$StaffProfileDataCopyWithImpl<$Res, _$StaffProfileDataImpl>
    implements _$$StaffProfileDataImplCopyWith<$Res> {
  __$$StaffProfileDataImplCopyWithImpl(_$StaffProfileDataImpl _value,
      $Res Function(_$StaffProfileDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentEvent = freezed,
    Object? specializations = null,
    Object? totalEventsWorked = null,
    Object? totalCheckIns = null,
    Object? averageRating = null,
    Object? totalHoursWorked = null,
  }) {
    return _then(_$StaffProfileDataImpl(
      currentEvent: freezed == currentEvent
          ? _value.currentEvent
          : currentEvent // ignore: cast_nullable_to_non_nullable
              as CurrentEventAssignment?,
      specializations: null == specializations
          ? _value._specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalEventsWorked: null == totalEventsWorked
          ? _value.totalEventsWorked
          : totalEventsWorked // ignore: cast_nullable_to_non_nullable
              as int,
      totalCheckIns: null == totalCheckIns
          ? _value.totalCheckIns
          : totalCheckIns // ignore: cast_nullable_to_non_nullable
              as int,
      averageRating: null == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double,
      totalHoursWorked: null == totalHoursWorked
          ? _value.totalHoursWorked
          : totalHoursWorked // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$StaffProfileDataImpl implements _StaffProfileData {
  const _$StaffProfileDataImpl(
      {this.currentEvent,
      final List<String> specializations = const [],
      this.totalEventsWorked = 0,
      this.totalCheckIns = 0,
      this.averageRating = 0.0,
      this.totalHoursWorked = 0})
      : _specializations = specializations;

  @override
  final CurrentEventAssignment? currentEvent;
  final List<String> _specializations;
  @override
  @JsonKey()
  List<String> get specializations {
    if (_specializations is EqualUnmodifiableListView) return _specializations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specializations);
  }

  @override
  @JsonKey()
  final int totalEventsWorked;
  @override
  @JsonKey()
  final int totalCheckIns;
  @override
  @JsonKey()
  final double averageRating;
  @override
  @JsonKey()
  final int totalHoursWorked;

  @override
  String toString() {
    return 'StaffProfileData(currentEvent: $currentEvent, specializations: $specializations, totalEventsWorked: $totalEventsWorked, totalCheckIns: $totalCheckIns, averageRating: $averageRating, totalHoursWorked: $totalHoursWorked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffProfileDataImpl &&
            (identical(other.currentEvent, currentEvent) ||
                other.currentEvent == currentEvent) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations) &&
            (identical(other.totalEventsWorked, totalEventsWorked) ||
                other.totalEventsWorked == totalEventsWorked) &&
            (identical(other.totalCheckIns, totalCheckIns) ||
                other.totalCheckIns == totalCheckIns) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalHoursWorked, totalHoursWorked) ||
                other.totalHoursWorked == totalHoursWorked));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentEvent,
      const DeepCollectionEquality().hash(_specializations),
      totalEventsWorked,
      totalCheckIns,
      averageRating,
      totalHoursWorked);

  /// Create a copy of StaffProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffProfileDataImplCopyWith<_$StaffProfileDataImpl> get copyWith =>
      __$$StaffProfileDataImplCopyWithImpl<_$StaffProfileDataImpl>(
          this, _$identity);
}

abstract class _StaffProfileData implements StaffProfileData {
  const factory _StaffProfileData(
      {final CurrentEventAssignment? currentEvent,
      final List<String> specializations,
      final int totalEventsWorked,
      final int totalCheckIns,
      final double averageRating,
      final int totalHoursWorked}) = _$StaffProfileDataImpl;

  @override
  CurrentEventAssignment? get currentEvent;
  @override
  List<String> get specializations;
  @override
  int get totalEventsWorked;
  @override
  int get totalCheckIns;
  @override
  double get averageRating;
  @override
  int get totalHoursWorked;

  /// Create a copy of StaffProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffProfileDataImplCopyWith<_$StaffProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrganizerProfileData {
  String? get organizationName => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get totalEventsCreated => throw _privateConstructorUsedError;
  int get totalAttendeesServed => throw _privateConstructorUsedError;
  double get averageEventRating => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Create a copy of OrganizerProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrganizerProfileDataCopyWith<OrganizerProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizerProfileDataCopyWith<$Res> {
  factory $OrganizerProfileDataCopyWith(OrganizerProfileData value,
          $Res Function(OrganizerProfileData) then) =
      _$OrganizerProfileDataCopyWithImpl<$Res, OrganizerProfileData>;
  @useResult
  $Res call(
      {String? organizationName,
      String? website,
      String? description,
      int totalEventsCreated,
      int totalAttendeesServed,
      double averageEventRating,
      bool isVerified});
}

/// @nodoc
class _$OrganizerProfileDataCopyWithImpl<$Res,
        $Val extends OrganizerProfileData>
    implements $OrganizerProfileDataCopyWith<$Res> {
  _$OrganizerProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrganizerProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationName = freezed,
    Object? website = freezed,
    Object? description = freezed,
    Object? totalEventsCreated = null,
    Object? totalAttendeesServed = null,
    Object? averageEventRating = null,
    Object? isVerified = null,
  }) {
    return _then(_value.copyWith(
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      totalEventsCreated: null == totalEventsCreated
          ? _value.totalEventsCreated
          : totalEventsCreated // ignore: cast_nullable_to_non_nullable
              as int,
      totalAttendeesServed: null == totalAttendeesServed
          ? _value.totalAttendeesServed
          : totalAttendeesServed // ignore: cast_nullable_to_non_nullable
              as int,
      averageEventRating: null == averageEventRating
          ? _value.averageEventRating
          : averageEventRating // ignore: cast_nullable_to_non_nullable
              as double,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganizerProfileDataImplCopyWith<$Res>
    implements $OrganizerProfileDataCopyWith<$Res> {
  factory _$$OrganizerProfileDataImplCopyWith(_$OrganizerProfileDataImpl value,
          $Res Function(_$OrganizerProfileDataImpl) then) =
      __$$OrganizerProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? organizationName,
      String? website,
      String? description,
      int totalEventsCreated,
      int totalAttendeesServed,
      double averageEventRating,
      bool isVerified});
}

/// @nodoc
class __$$OrganizerProfileDataImplCopyWithImpl<$Res>
    extends _$OrganizerProfileDataCopyWithImpl<$Res, _$OrganizerProfileDataImpl>
    implements _$$OrganizerProfileDataImplCopyWith<$Res> {
  __$$OrganizerProfileDataImplCopyWithImpl(_$OrganizerProfileDataImpl _value,
      $Res Function(_$OrganizerProfileDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrganizerProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationName = freezed,
    Object? website = freezed,
    Object? description = freezed,
    Object? totalEventsCreated = null,
    Object? totalAttendeesServed = null,
    Object? averageEventRating = null,
    Object? isVerified = null,
  }) {
    return _then(_$OrganizerProfileDataImpl(
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      totalEventsCreated: null == totalEventsCreated
          ? _value.totalEventsCreated
          : totalEventsCreated // ignore: cast_nullable_to_non_nullable
              as int,
      totalAttendeesServed: null == totalAttendeesServed
          ? _value.totalAttendeesServed
          : totalAttendeesServed // ignore: cast_nullable_to_non_nullable
              as int,
      averageEventRating: null == averageEventRating
          ? _value.averageEventRating
          : averageEventRating // ignore: cast_nullable_to_non_nullable
              as double,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OrganizerProfileDataImpl implements _OrganizerProfileData {
  const _$OrganizerProfileDataImpl(
      {this.organizationName,
      this.website,
      this.description,
      this.totalEventsCreated = 0,
      this.totalAttendeesServed = 0,
      this.averageEventRating = 0.0,
      this.isVerified = false});

  @override
  final String? organizationName;
  @override
  final String? website;
  @override
  final String? description;
  @override
  @JsonKey()
  final int totalEventsCreated;
  @override
  @JsonKey()
  final int totalAttendeesServed;
  @override
  @JsonKey()
  final double averageEventRating;
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'OrganizerProfileData(organizationName: $organizationName, website: $website, description: $description, totalEventsCreated: $totalEventsCreated, totalAttendeesServed: $totalAttendeesServed, averageEventRating: $averageEventRating, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizerProfileDataImpl &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.totalEventsCreated, totalEventsCreated) ||
                other.totalEventsCreated == totalEventsCreated) &&
            (identical(other.totalAttendeesServed, totalAttendeesServed) ||
                other.totalAttendeesServed == totalAttendeesServed) &&
            (identical(other.averageEventRating, averageEventRating) ||
                other.averageEventRating == averageEventRating) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      organizationName,
      website,
      description,
      totalEventsCreated,
      totalAttendeesServed,
      averageEventRating,
      isVerified);

  /// Create a copy of OrganizerProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizerProfileDataImplCopyWith<_$OrganizerProfileDataImpl>
      get copyWith =>
          __$$OrganizerProfileDataImplCopyWithImpl<_$OrganizerProfileDataImpl>(
              this, _$identity);
}

abstract class _OrganizerProfileData implements OrganizerProfileData {
  const factory _OrganizerProfileData(
      {final String? organizationName,
      final String? website,
      final String? description,
      final int totalEventsCreated,
      final int totalAttendeesServed,
      final double averageEventRating,
      final bool isVerified}) = _$OrganizerProfileDataImpl;

  @override
  String? get organizationName;
  @override
  String? get website;
  @override
  String? get description;
  @override
  int get totalEventsCreated;
  @override
  int get totalAttendeesServed;
  @override
  double get averageEventRating;
  @override
  bool get isVerified;

  /// Create a copy of OrganizerProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizerProfileDataImplCopyWith<_$OrganizerProfileDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendeeProfileData {
  List<String> get interests => throw _privateConstructorUsedError;
  int get totalEventsAttended => throw _privateConstructorUsedError;
  List<String> get favoriteEventTypes => throw _privateConstructorUsedError;
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get emergencyContact => throw _privateConstructorUsedError;
  String? get emergencyContactPhone => throw _privateConstructorUsedError;

  /// Create a copy of AttendeeProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendeeProfileDataCopyWith<AttendeeProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendeeProfileDataCopyWith<$Res> {
  factory $AttendeeProfileDataCopyWith(
          AttendeeProfileData value, $Res Function(AttendeeProfileData) then) =
      _$AttendeeProfileDataCopyWithImpl<$Res, AttendeeProfileData>;
  @useResult
  $Res call(
      {List<String> interests,
      int totalEventsAttended,
      List<String> favoriteEventTypes,
      String? dateOfBirth,
      String? emergencyContact,
      String? emergencyContactPhone});
}

/// @nodoc
class _$AttendeeProfileDataCopyWithImpl<$Res, $Val extends AttendeeProfileData>
    implements $AttendeeProfileDataCopyWith<$Res> {
  _$AttendeeProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendeeProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interests = null,
    Object? totalEventsAttended = null,
    Object? favoriteEventTypes = null,
    Object? dateOfBirth = freezed,
    Object? emergencyContact = freezed,
    Object? emergencyContactPhone = freezed,
  }) {
    return _then(_value.copyWith(
      interests: null == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalEventsAttended: null == totalEventsAttended
          ? _value.totalEventsAttended
          : totalEventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteEventTypes: null == favoriteEventTypes
          ? _value.favoriteEventTypes
          : favoriteEventTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContact: freezed == emergencyContact
          ? _value.emergencyContact
          : emergencyContact // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactPhone: freezed == emergencyContactPhone
          ? _value.emergencyContactPhone
          : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendeeProfileDataImplCopyWith<$Res>
    implements $AttendeeProfileDataCopyWith<$Res> {
  factory _$$AttendeeProfileDataImplCopyWith(_$AttendeeProfileDataImpl value,
          $Res Function(_$AttendeeProfileDataImpl) then) =
      __$$AttendeeProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> interests,
      int totalEventsAttended,
      List<String> favoriteEventTypes,
      String? dateOfBirth,
      String? emergencyContact,
      String? emergencyContactPhone});
}

/// @nodoc
class __$$AttendeeProfileDataImplCopyWithImpl<$Res>
    extends _$AttendeeProfileDataCopyWithImpl<$Res, _$AttendeeProfileDataImpl>
    implements _$$AttendeeProfileDataImplCopyWith<$Res> {
  __$$AttendeeProfileDataImplCopyWithImpl(_$AttendeeProfileDataImpl _value,
      $Res Function(_$AttendeeProfileDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeProfileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interests = null,
    Object? totalEventsAttended = null,
    Object? favoriteEventTypes = null,
    Object? dateOfBirth = freezed,
    Object? emergencyContact = freezed,
    Object? emergencyContactPhone = freezed,
  }) {
    return _then(_$AttendeeProfileDataImpl(
      interests: null == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>,
      totalEventsAttended: null == totalEventsAttended
          ? _value.totalEventsAttended
          : totalEventsAttended // ignore: cast_nullable_to_non_nullable
              as int,
      favoriteEventTypes: null == favoriteEventTypes
          ? _value._favoriteEventTypes
          : favoriteEventTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContact: freezed == emergencyContact
          ? _value.emergencyContact
          : emergencyContact // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContactPhone: freezed == emergencyContactPhone
          ? _value.emergencyContactPhone
          : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AttendeeProfileDataImpl implements _AttendeeProfileData {
  const _$AttendeeProfileDataImpl(
      {final List<String> interests = const [],
      this.totalEventsAttended = 0,
      final List<String> favoriteEventTypes = const [],
      this.dateOfBirth,
      this.emergencyContact,
      this.emergencyContactPhone})
      : _interests = interests,
        _favoriteEventTypes = favoriteEventTypes;

  final List<String> _interests;
  @override
  @JsonKey()
  List<String> get interests {
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interests);
  }

  @override
  @JsonKey()
  final int totalEventsAttended;
  final List<String> _favoriteEventTypes;
  @override
  @JsonKey()
  List<String> get favoriteEventTypes {
    if (_favoriteEventTypes is EqualUnmodifiableListView)
      return _favoriteEventTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteEventTypes);
  }

  @override
  final String? dateOfBirth;
  @override
  final String? emergencyContact;
  @override
  final String? emergencyContactPhone;

  @override
  String toString() {
    return 'AttendeeProfileData(interests: $interests, totalEventsAttended: $totalEventsAttended, favoriteEventTypes: $favoriteEventTypes, dateOfBirth: $dateOfBirth, emergencyContact: $emergencyContact, emergencyContactPhone: $emergencyContactPhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendeeProfileDataImpl &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            (identical(other.totalEventsAttended, totalEventsAttended) ||
                other.totalEventsAttended == totalEventsAttended) &&
            const DeepCollectionEquality()
                .equals(other._favoriteEventTypes, _favoriteEventTypes) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.emergencyContact, emergencyContact) ||
                other.emergencyContact == emergencyContact) &&
            (identical(other.emergencyContactPhone, emergencyContactPhone) ||
                other.emergencyContactPhone == emergencyContactPhone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_interests),
      totalEventsAttended,
      const DeepCollectionEquality().hash(_favoriteEventTypes),
      dateOfBirth,
      emergencyContact,
      emergencyContactPhone);

  /// Create a copy of AttendeeProfileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendeeProfileDataImplCopyWith<_$AttendeeProfileDataImpl> get copyWith =>
      __$$AttendeeProfileDataImplCopyWithImpl<_$AttendeeProfileDataImpl>(
          this, _$identity);
}

abstract class _AttendeeProfileData implements AttendeeProfileData {
  const factory _AttendeeProfileData(
      {final List<String> interests,
      final int totalEventsAttended,
      final List<String> favoriteEventTypes,
      final String? dateOfBirth,
      final String? emergencyContact,
      final String? emergencyContactPhone}) = _$AttendeeProfileDataImpl;

  @override
  List<String> get interests;
  @override
  int get totalEventsAttended;
  @override
  List<String> get favoriteEventTypes;
  @override
  String? get dateOfBirth;
  @override
  String? get emergencyContact;
  @override
  String? get emergencyContactPhone;

  /// Create a copy of AttendeeProfileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendeeProfileDataImplCopyWith<_$AttendeeProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrentEventAssignment {
  String get eventId => throw _privateConstructorUsedError;
  String get eventTitle => throw _privateConstructorUsedError;
  String get eventLocation => throw _privateConstructorUsedError;
  DateTime get eventDate => throw _privateConstructorUsedError;
  String get assignedRole => throw _privateConstructorUsedError;
  String? get assignedGate => throw _privateConstructorUsedError;
  DateTime? get shiftStart => throw _privateConstructorUsedError;
  DateTime? get shiftEnd => throw _privateConstructorUsedError;
  EventAssignmentStatus get status => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of CurrentEventAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentEventAssignmentCopyWith<CurrentEventAssignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentEventAssignmentCopyWith<$Res> {
  factory $CurrentEventAssignmentCopyWith(CurrentEventAssignment value,
          $Res Function(CurrentEventAssignment) then) =
      _$CurrentEventAssignmentCopyWithImpl<$Res, CurrentEventAssignment>;
  @useResult
  $Res call(
      {String eventId,
      String eventTitle,
      String eventLocation,
      DateTime eventDate,
      String assignedRole,
      String? assignedGate,
      DateTime? shiftStart,
      DateTime? shiftEnd,
      EventAssignmentStatus status,
      String? notes});
}

/// @nodoc
class _$CurrentEventAssignmentCopyWithImpl<$Res,
        $Val extends CurrentEventAssignment>
    implements $CurrentEventAssignmentCopyWith<$Res> {
  _$CurrentEventAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentEventAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventTitle = null,
    Object? eventLocation = null,
    Object? eventDate = null,
    Object? assignedRole = null,
    Object? assignedGate = freezed,
    Object? shiftStart = freezed,
    Object? shiftEnd = freezed,
    Object? status = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventLocation: null == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as String,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedRole: null == assignedRole
          ? _value.assignedRole
          : assignedRole // ignore: cast_nullable_to_non_nullable
              as String,
      assignedGate: freezed == assignedGate
          ? _value.assignedGate
          : assignedGate // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftStart: freezed == shiftStart
          ? _value.shiftStart
          : shiftStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shiftEnd: freezed == shiftEnd
          ? _value.shiftEnd
          : shiftEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventAssignmentStatus,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentEventAssignmentImplCopyWith<$Res>
    implements $CurrentEventAssignmentCopyWith<$Res> {
  factory _$$CurrentEventAssignmentImplCopyWith(
          _$CurrentEventAssignmentImpl value,
          $Res Function(_$CurrentEventAssignmentImpl) then) =
      __$$CurrentEventAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String eventTitle,
      String eventLocation,
      DateTime eventDate,
      String assignedRole,
      String? assignedGate,
      DateTime? shiftStart,
      DateTime? shiftEnd,
      EventAssignmentStatus status,
      String? notes});
}

/// @nodoc
class __$$CurrentEventAssignmentImplCopyWithImpl<$Res>
    extends _$CurrentEventAssignmentCopyWithImpl<$Res,
        _$CurrentEventAssignmentImpl>
    implements _$$CurrentEventAssignmentImplCopyWith<$Res> {
  __$$CurrentEventAssignmentImplCopyWithImpl(
      _$CurrentEventAssignmentImpl _value,
      $Res Function(_$CurrentEventAssignmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentEventAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? eventTitle = null,
    Object? eventLocation = null,
    Object? eventDate = null,
    Object? assignedRole = null,
    Object? assignedGate = freezed,
    Object? shiftStart = freezed,
    Object? shiftEnd = freezed,
    Object? status = null,
    Object? notes = freezed,
  }) {
    return _then(_$CurrentEventAssignmentImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventTitle: null == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String,
      eventLocation: null == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as String,
      eventDate: null == eventDate
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      assignedRole: null == assignedRole
          ? _value.assignedRole
          : assignedRole // ignore: cast_nullable_to_non_nullable
              as String,
      assignedGate: freezed == assignedGate
          ? _value.assignedGate
          : assignedGate // ignore: cast_nullable_to_non_nullable
              as String?,
      shiftStart: freezed == shiftStart
          ? _value.shiftStart
          : shiftStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shiftEnd: freezed == shiftEnd
          ? _value.shiftEnd
          : shiftEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventAssignmentStatus,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CurrentEventAssignmentImpl implements _CurrentEventAssignment {
  const _$CurrentEventAssignmentImpl(
      {required this.eventId,
      required this.eventTitle,
      required this.eventLocation,
      required this.eventDate,
      required this.assignedRole,
      this.assignedGate,
      this.shiftStart,
      this.shiftEnd,
      this.status = EventAssignmentStatus.active,
      this.notes});

  @override
  final String eventId;
  @override
  final String eventTitle;
  @override
  final String eventLocation;
  @override
  final DateTime eventDate;
  @override
  final String assignedRole;
  @override
  final String? assignedGate;
  @override
  final DateTime? shiftStart;
  @override
  final DateTime? shiftEnd;
  @override
  @JsonKey()
  final EventAssignmentStatus status;
  @override
  final String? notes;

  @override
  String toString() {
    return 'CurrentEventAssignment(eventId: $eventId, eventTitle: $eventTitle, eventLocation: $eventLocation, eventDate: $eventDate, assignedRole: $assignedRole, assignedGate: $assignedGate, shiftStart: $shiftStart, shiftEnd: $shiftEnd, status: $status, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentEventAssignmentImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            (identical(other.eventLocation, eventLocation) ||
                other.eventLocation == eventLocation) &&
            (identical(other.eventDate, eventDate) ||
                other.eventDate == eventDate) &&
            (identical(other.assignedRole, assignedRole) ||
                other.assignedRole == assignedRole) &&
            (identical(other.assignedGate, assignedGate) ||
                other.assignedGate == assignedGate) &&
            (identical(other.shiftStart, shiftStart) ||
                other.shiftStart == shiftStart) &&
            (identical(other.shiftEnd, shiftEnd) ||
                other.shiftEnd == shiftEnd) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      eventId,
      eventTitle,
      eventLocation,
      eventDate,
      assignedRole,
      assignedGate,
      shiftStart,
      shiftEnd,
      status,
      notes);

  /// Create a copy of CurrentEventAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentEventAssignmentImplCopyWith<_$CurrentEventAssignmentImpl>
      get copyWith => __$$CurrentEventAssignmentImplCopyWithImpl<
          _$CurrentEventAssignmentImpl>(this, _$identity);
}

abstract class _CurrentEventAssignment implements CurrentEventAssignment {
  const factory _CurrentEventAssignment(
      {required final String eventId,
      required final String eventTitle,
      required final String eventLocation,
      required final DateTime eventDate,
      required final String assignedRole,
      final String? assignedGate,
      final DateTime? shiftStart,
      final DateTime? shiftEnd,
      final EventAssignmentStatus status,
      final String? notes}) = _$CurrentEventAssignmentImpl;

  @override
  String get eventId;
  @override
  String get eventTitle;
  @override
  String get eventLocation;
  @override
  DateTime get eventDate;
  @override
  String get assignedRole;
  @override
  String? get assignedGate;
  @override
  DateTime? get shiftStart;
  @override
  DateTime? get shiftEnd;
  @override
  EventAssignmentStatus get status;
  @override
  String? get notes;

  /// Create a copy of CurrentEventAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentEventAssignmentImplCopyWith<_$CurrentEventAssignmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserPreferences {
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  bool get emailNotifications => throw _privateConstructorUsedError;
  bool get pushNotifications => throw _privateConstructorUsedError;
  bool get soundEnabled => throw _privateConstructorUsedError;
  bool get vibrationEnabled => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {bool notificationsEnabled,
      bool emailNotifications,
      bool pushNotifications,
      bool soundEnabled,
      bool vibrationEnabled,
      String language,
      String theme});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationsEnabled = null,
    Object? emailNotifications = null,
    Object? pushNotifications = null,
    Object? soundEnabled = null,
    Object? vibrationEnabled = null,
    Object? language = null,
    Object? theme = null,
  }) {
    return _then(_value.copyWith(
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool notificationsEnabled,
      bool emailNotifications,
      bool pushNotifications,
      bool soundEnabled,
      bool vibrationEnabled,
      String language,
      String theme});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationsEnabled = null,
    Object? emailNotifications = null,
    Object? pushNotifications = null,
    Object? soundEnabled = null,
    Object? vibrationEnabled = null,
    Object? language = null,
    Object? theme = null,
  }) {
    return _then(_$UserPreferencesImpl(
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      soundEnabled: null == soundEnabled
          ? _value.soundEnabled
          : soundEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      vibrationEnabled: null == vibrationEnabled
          ? _value.vibrationEnabled
          : vibrationEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {this.notificationsEnabled = true,
      this.emailNotifications = true,
      this.pushNotifications = true,
      this.soundEnabled = false,
      this.vibrationEnabled = false,
      this.language = 'en',
      this.theme = 'system'});

  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final bool emailNotifications;
  @override
  @JsonKey()
  final bool pushNotifications;
  @override
  @JsonKey()
  final bool soundEnabled;
  @override
  @JsonKey()
  final bool vibrationEnabled;
  @override
  @JsonKey()
  final String language;
  @override
  @JsonKey()
  final String theme;

  @override
  String toString() {
    return 'UserPreferences(notificationsEnabled: $notificationsEnabled, emailNotifications: $emailNotifications, pushNotifications: $pushNotifications, soundEnabled: $soundEnabled, vibrationEnabled: $vibrationEnabled, language: $language, theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.soundEnabled, soundEnabled) ||
                other.soundEnabled == soundEnabled) &&
            (identical(other.vibrationEnabled, vibrationEnabled) ||
                other.vibrationEnabled == vibrationEnabled) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.theme, theme) || other.theme == theme));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      notificationsEnabled,
      emailNotifications,
      pushNotifications,
      soundEnabled,
      vibrationEnabled,
      language,
      theme);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
      {final bool notificationsEnabled,
      final bool emailNotifications,
      final bool pushNotifications,
      final bool soundEnabled,
      final bool vibrationEnabled,
      final String language,
      final String theme}) = _$UserPreferencesImpl;

  @override
  bool get notificationsEnabled;
  @override
  bool get emailNotifications;
  @override
  bool get pushNotifications;
  @override
  bool get soundEnabled;
  @override
  bool get vibrationEnabled;
  @override
  String get language;
  @override
  String get theme;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
