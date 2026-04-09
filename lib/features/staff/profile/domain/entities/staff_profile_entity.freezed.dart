// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StaffProfileEntity {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;
  StaffProfileStatus get status => throw _privateConstructorUsedError;
  CurrentEventAssignment? get currentEvent =>
      throw _privateConstructorUsedError;
  StaffPreferences get preferences => throw _privateConstructorUsedError;
  List<String> get specializations => throw _privateConstructorUsedError;
  int get totalEventsWorked => throw _privateConstructorUsedError;
  int get totalCheckIns => throw _privateConstructorUsedError;
  double get averageRating => throw _privateConstructorUsedError;

  /// Create a copy of StaffProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffProfileEntityCopyWith<StaffProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffProfileEntityCopyWith<$Res> {
  factory $StaffProfileEntityCopyWith(
          StaffProfileEntity value, $Res Function(StaffProfileEntity) then) =
      _$StaffProfileEntityCopyWithImpl<$Res, StaffProfileEntity>;
  @useResult
  $Res call(
      {String id,
      String email,
      String name,
      String? phone,
      String? profileImageUrl,
      DateTime? createdAt,
      DateTime? lastLoginAt,
      StaffProfileStatus status,
      CurrentEventAssignment? currentEvent,
      StaffPreferences preferences,
      List<String> specializations,
      int totalEventsWorked,
      int totalCheckIns,
      double averageRating});

  $CurrentEventAssignmentCopyWith<$Res>? get currentEvent;
  $StaffPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class _$StaffProfileEntityCopyWithImpl<$Res, $Val extends StaffProfileEntity>
    implements $StaffProfileEntityCopyWith<$Res> {
  _$StaffProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? phone = freezed,
    Object? profileImageUrl = freezed,
    Object? createdAt = freezed,
    Object? lastLoginAt = freezed,
    Object? status = null,
    Object? currentEvent = freezed,
    Object? preferences = null,
    Object? specializations = null,
    Object? totalEventsWorked = null,
    Object? totalCheckIns = null,
    Object? averageRating = null,
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
              as StaffProfileStatus,
      currentEvent: freezed == currentEvent
          ? _value.currentEvent
          : currentEvent // ignore: cast_nullable_to_non_nullable
              as CurrentEventAssignment?,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as StaffPreferences,
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
    ) as $Val);
  }

  /// Create a copy of StaffProfileEntity
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

  /// Create a copy of StaffProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffPreferencesCopyWith<$Res> get preferences {
    return $StaffPreferencesCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffProfileEntityImplCopyWith<$Res>
    implements $StaffProfileEntityCopyWith<$Res> {
  factory _$$StaffProfileEntityImplCopyWith(_$StaffProfileEntityImpl value,
          $Res Function(_$StaffProfileEntityImpl) then) =
      __$$StaffProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String name,
      String? phone,
      String? profileImageUrl,
      DateTime? createdAt,
      DateTime? lastLoginAt,
      StaffProfileStatus status,
      CurrentEventAssignment? currentEvent,
      StaffPreferences preferences,
      List<String> specializations,
      int totalEventsWorked,
      int totalCheckIns,
      double averageRating});

  @override
  $CurrentEventAssignmentCopyWith<$Res>? get currentEvent;
  @override
  $StaffPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$StaffProfileEntityImplCopyWithImpl<$Res>
    extends _$StaffProfileEntityCopyWithImpl<$Res, _$StaffProfileEntityImpl>
    implements _$$StaffProfileEntityImplCopyWith<$Res> {
  __$$StaffProfileEntityImplCopyWithImpl(_$StaffProfileEntityImpl _value,
      $Res Function(_$StaffProfileEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? name = null,
    Object? phone = freezed,
    Object? profileImageUrl = freezed,
    Object? createdAt = freezed,
    Object? lastLoginAt = freezed,
    Object? status = null,
    Object? currentEvent = freezed,
    Object? preferences = null,
    Object? specializations = null,
    Object? totalEventsWorked = null,
    Object? totalCheckIns = null,
    Object? averageRating = null,
  }) {
    return _then(_$StaffProfileEntityImpl(
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
              as StaffProfileStatus,
      currentEvent: freezed == currentEvent
          ? _value.currentEvent
          : currentEvent // ignore: cast_nullable_to_non_nullable
              as CurrentEventAssignment?,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as StaffPreferences,
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
    ));
  }
}

/// @nodoc

class _$StaffProfileEntityImpl implements _StaffProfileEntity {
  const _$StaffProfileEntityImpl(
      {required this.id,
      required this.email,
      required this.name,
      this.phone,
      this.profileImageUrl,
      this.createdAt,
      this.lastLoginAt,
      this.status = StaffProfileStatus.active,
      this.currentEvent,
      this.preferences = const StaffPreferences(),
      final List<String> specializations = const [],
      this.totalEventsWorked = 0,
      this.totalCheckIns = 0,
      this.averageRating = 0.0})
      : _specializations = specializations;

  @override
  final String id;
  @override
  final String email;
  @override
  final String name;
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
  final StaffProfileStatus status;
  @override
  final CurrentEventAssignment? currentEvent;
  @override
  @JsonKey()
  final StaffPreferences preferences;
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
  String toString() {
    return 'StaffProfileEntity(id: $id, email: $email, name: $name, phone: $phone, profileImageUrl: $profileImageUrl, createdAt: $createdAt, lastLoginAt: $lastLoginAt, status: $status, currentEvent: $currentEvent, preferences: $preferences, specializations: $specializations, totalEventsWorked: $totalEventsWorked, totalCheckIns: $totalCheckIns, averageRating: $averageRating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffProfileEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentEvent, currentEvent) ||
                other.currentEvent == currentEvent) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations) &&
            (identical(other.totalEventsWorked, totalEventsWorked) ||
                other.totalEventsWorked == totalEventsWorked) &&
            (identical(other.totalCheckIns, totalCheckIns) ||
                other.totalCheckIns == totalCheckIns) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      name,
      phone,
      profileImageUrl,
      createdAt,
      lastLoginAt,
      status,
      currentEvent,
      preferences,
      const DeepCollectionEquality().hash(_specializations),
      totalEventsWorked,
      totalCheckIns,
      averageRating);

  /// Create a copy of StaffProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffProfileEntityImplCopyWith<_$StaffProfileEntityImpl> get copyWith =>
      __$$StaffProfileEntityImplCopyWithImpl<_$StaffProfileEntityImpl>(
          this, _$identity);
}

abstract class _StaffProfileEntity implements StaffProfileEntity {
  const factory _StaffProfileEntity(
      {required final String id,
      required final String email,
      required final String name,
      final String? phone,
      final String? profileImageUrl,
      final DateTime? createdAt,
      final DateTime? lastLoginAt,
      final StaffProfileStatus status,
      final CurrentEventAssignment? currentEvent,
      final StaffPreferences preferences,
      final List<String> specializations,
      final int totalEventsWorked,
      final int totalCheckIns,
      final double averageRating}) = _$StaffProfileEntityImpl;

  @override
  String get id;
  @override
  String get email;
  @override
  String get name;
  @override
  String? get phone;
  @override
  String? get profileImageUrl;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get lastLoginAt;
  @override
  StaffProfileStatus get status;
  @override
  CurrentEventAssignment? get currentEvent;
  @override
  StaffPreferences get preferences;
  @override
  List<String> get specializations;
  @override
  int get totalEventsWorked;
  @override
  int get totalCheckIns;
  @override
  double get averageRating;

  /// Create a copy of StaffProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffProfileEntityImplCopyWith<_$StaffProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrentEventAssignment {
  String get eventId => throw _privateConstructorUsedError;
  String get eventTitle => throw _privateConstructorUsedError;
  String get eventLocation => throw _privateConstructorUsedError;
  DateTime get eventDate => throw _privateConstructorUsedError;
  String get assignedRole => throw _privateConstructorUsedError;
  String get assignedGate => throw _privateConstructorUsedError;
  DateTime get shiftStart => throw _privateConstructorUsedError;
  DateTime get shiftEnd => throw _privateConstructorUsedError;
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
      String assignedGate,
      DateTime shiftStart,
      DateTime shiftEnd,
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
    Object? assignedGate = null,
    Object? shiftStart = null,
    Object? shiftEnd = null,
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
      assignedGate: null == assignedGate
          ? _value.assignedGate
          : assignedGate // ignore: cast_nullable_to_non_nullable
              as String,
      shiftStart: null == shiftStart
          ? _value.shiftStart
          : shiftStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shiftEnd: null == shiftEnd
          ? _value.shiftEnd
          : shiftEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      String assignedGate,
      DateTime shiftStart,
      DateTime shiftEnd,
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
    Object? assignedGate = null,
    Object? shiftStart = null,
    Object? shiftEnd = null,
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
      assignedGate: null == assignedGate
          ? _value.assignedGate
          : assignedGate // ignore: cast_nullable_to_non_nullable
              as String,
      shiftStart: null == shiftStart
          ? _value.shiftStart
          : shiftStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      shiftEnd: null == shiftEnd
          ? _value.shiftEnd
          : shiftEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      required this.assignedGate,
      required this.shiftStart,
      required this.shiftEnd,
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
  final String assignedGate;
  @override
  final DateTime shiftStart;
  @override
  final DateTime shiftEnd;
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
      required final String assignedGate,
      required final DateTime shiftStart,
      required final DateTime shiftEnd,
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
  String get assignedGate;
  @override
  DateTime get shiftStart;
  @override
  DateTime get shiftEnd;
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
mixin _$StaffPreferences {
  bool get notificationsEnabled => throw _privateConstructorUsedError;
  bool get shiftReminders => throw _privateConstructorUsedError;
  bool get eventUpdates => throw _privateConstructorUsedError;
  bool get soundEnabled => throw _privateConstructorUsedError;
  bool get vibrationEnabled => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;

  /// Create a copy of StaffPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffPreferencesCopyWith<StaffPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffPreferencesCopyWith<$Res> {
  factory $StaffPreferencesCopyWith(
          StaffPreferences value, $Res Function(StaffPreferences) then) =
      _$StaffPreferencesCopyWithImpl<$Res, StaffPreferences>;
  @useResult
  $Res call(
      {bool notificationsEnabled,
      bool shiftReminders,
      bool eventUpdates,
      bool soundEnabled,
      bool vibrationEnabled,
      String language,
      String theme});
}

/// @nodoc
class _$StaffPreferencesCopyWithImpl<$Res, $Val extends StaffPreferences>
    implements $StaffPreferencesCopyWith<$Res> {
  _$StaffPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationsEnabled = null,
    Object? shiftReminders = null,
    Object? eventUpdates = null,
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
      shiftReminders: null == shiftReminders
          ? _value.shiftReminders
          : shiftReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      eventUpdates: null == eventUpdates
          ? _value.eventUpdates
          : eventUpdates // ignore: cast_nullable_to_non_nullable
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
abstract class _$$StaffPreferencesImplCopyWith<$Res>
    implements $StaffPreferencesCopyWith<$Res> {
  factory _$$StaffPreferencesImplCopyWith(_$StaffPreferencesImpl value,
          $Res Function(_$StaffPreferencesImpl) then) =
      __$$StaffPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool notificationsEnabled,
      bool shiftReminders,
      bool eventUpdates,
      bool soundEnabled,
      bool vibrationEnabled,
      String language,
      String theme});
}

/// @nodoc
class __$$StaffPreferencesImplCopyWithImpl<$Res>
    extends _$StaffPreferencesCopyWithImpl<$Res, _$StaffPreferencesImpl>
    implements _$$StaffPreferencesImplCopyWith<$Res> {
  __$$StaffPreferencesImplCopyWithImpl(_$StaffPreferencesImpl _value,
      $Res Function(_$StaffPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationsEnabled = null,
    Object? shiftReminders = null,
    Object? eventUpdates = null,
    Object? soundEnabled = null,
    Object? vibrationEnabled = null,
    Object? language = null,
    Object? theme = null,
  }) {
    return _then(_$StaffPreferencesImpl(
      notificationsEnabled: null == notificationsEnabled
          ? _value.notificationsEnabled
          : notificationsEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      shiftReminders: null == shiftReminders
          ? _value.shiftReminders
          : shiftReminders // ignore: cast_nullable_to_non_nullable
              as bool,
      eventUpdates: null == eventUpdates
          ? _value.eventUpdates
          : eventUpdates // ignore: cast_nullable_to_non_nullable
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

class _$StaffPreferencesImpl implements _StaffPreferences {
  const _$StaffPreferencesImpl(
      {this.notificationsEnabled = true,
      this.shiftReminders = true,
      this.eventUpdates = true,
      this.soundEnabled = false,
      this.vibrationEnabled = false,
      this.language = 'en',
      this.theme = 'light'});

  @override
  @JsonKey()
  final bool notificationsEnabled;
  @override
  @JsonKey()
  final bool shiftReminders;
  @override
  @JsonKey()
  final bool eventUpdates;
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
    return 'StaffPreferences(notificationsEnabled: $notificationsEnabled, shiftReminders: $shiftReminders, eventUpdates: $eventUpdates, soundEnabled: $soundEnabled, vibrationEnabled: $vibrationEnabled, language: $language, theme: $theme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffPreferencesImpl &&
            (identical(other.notificationsEnabled, notificationsEnabled) ||
                other.notificationsEnabled == notificationsEnabled) &&
            (identical(other.shiftReminders, shiftReminders) ||
                other.shiftReminders == shiftReminders) &&
            (identical(other.eventUpdates, eventUpdates) ||
                other.eventUpdates == eventUpdates) &&
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
      shiftReminders,
      eventUpdates,
      soundEnabled,
      vibrationEnabled,
      language,
      theme);

  /// Create a copy of StaffPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffPreferencesImplCopyWith<_$StaffPreferencesImpl> get copyWith =>
      __$$StaffPreferencesImplCopyWithImpl<_$StaffPreferencesImpl>(
          this, _$identity);
}

abstract class _StaffPreferences implements StaffPreferences {
  const factory _StaffPreferences(
      {final bool notificationsEnabled,
      final bool shiftReminders,
      final bool eventUpdates,
      final bool soundEnabled,
      final bool vibrationEnabled,
      final String language,
      final String theme}) = _$StaffPreferencesImpl;

  @override
  bool get notificationsEnabled;
  @override
  bool get shiftReminders;
  @override
  bool get eventUpdates;
  @override
  bool get soundEnabled;
  @override
  bool get vibrationEnabled;
  @override
  String get language;
  @override
  String get theme;

  /// Create a copy of StaffPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffPreferencesImplCopyWith<_$StaffPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
