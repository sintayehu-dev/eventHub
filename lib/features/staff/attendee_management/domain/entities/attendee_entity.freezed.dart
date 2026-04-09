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

/// @nodoc
mixin _$AttendeeEntity {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String get ticketId => throw _privateConstructorUsedError;
  String get ticketType => throw _privateConstructorUsedError;
  AttendeeStatus get status => throw _privateConstructorUsedError;
  DateTime get registrationDate => throw _privateConstructorUsedError;
  DateTime? get checkInTime => throw _privateConstructorUsedError;
  String? get checkInStaffId => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

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
      String eventId,
      String name,
      String email,
      String? phone,
      String ticketId,
      String ticketType,
      AttendeeStatus status,
      DateTime registrationDate,
      DateTime? checkInTime,
      String? checkInStaffId,
      String? notes,
      Map<String, dynamic>? metadata});
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
    Object? eventId = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? ticketId = null,
    Object? ticketType = null,
    Object? status = null,
    Object? registrationDate = null,
    Object? checkInTime = freezed,
    Object? checkInStaffId = freezed,
    Object? notes = freezed,
    Object? metadata = freezed,
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
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
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
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketType: null == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkInTime: freezed == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkInStaffId: freezed == checkInStaffId
          ? _value.checkInStaffId
          : checkInStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
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
      String eventId,
      String name,
      String email,
      String? phone,
      String ticketId,
      String ticketType,
      AttendeeStatus status,
      DateTime registrationDate,
      DateTime? checkInTime,
      String? checkInStaffId,
      String? notes,
      Map<String, dynamic>? metadata});
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
    Object? eventId = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? ticketId = null,
    Object? ticketType = null,
    Object? status = null,
    Object? registrationDate = null,
    Object? checkInTime = freezed,
    Object? checkInStaffId = freezed,
    Object? notes = freezed,
    Object? metadata = freezed,
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
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
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
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      ticketType: null == ticketType
          ? _value.ticketType
          : ticketType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      checkInTime: freezed == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      checkInStaffId: freezed == checkInStaffId
          ? _value.checkInStaffId
          : checkInStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$AttendeeEntityImpl implements _AttendeeEntity {
  const _$AttendeeEntityImpl(
      {required this.id,
      required this.userId,
      required this.eventId,
      required this.name,
      required this.email,
      this.phone,
      required this.ticketId,
      required this.ticketType,
      required this.status,
      required this.registrationDate,
      this.checkInTime,
      this.checkInStaffId,
      this.notes,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  @override
  final String id;
  @override
  final String userId;
  @override
  final String eventId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String ticketId;
  @override
  final String ticketType;
  @override
  final AttendeeStatus status;
  @override
  final DateTime registrationDate;
  @override
  final DateTime? checkInTime;
  @override
  final String? checkInStaffId;
  @override
  final String? notes;
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
    return 'AttendeeEntity(id: $id, userId: $userId, eventId: $eventId, name: $name, email: $email, phone: $phone, ticketId: $ticketId, ticketType: $ticketType, status: $status, registrationDate: $registrationDate, checkInTime: $checkInTime, checkInStaffId: $checkInStaffId, notes: $notes, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendeeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.ticketType, ticketType) ||
                other.ticketType == ticketType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.registrationDate, registrationDate) ||
                other.registrationDate == registrationDate) &&
            (identical(other.checkInTime, checkInTime) ||
                other.checkInTime == checkInTime) &&
            (identical(other.checkInStaffId, checkInStaffId) ||
                other.checkInStaffId == checkInStaffId) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      eventId,
      name,
      email,
      phone,
      ticketId,
      ticketType,
      status,
      registrationDate,
      checkInTime,
      checkInStaffId,
      notes,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of AttendeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendeeEntityImplCopyWith<_$AttendeeEntityImpl> get copyWith =>
      __$$AttendeeEntityImplCopyWithImpl<_$AttendeeEntityImpl>(
          this, _$identity);
}

abstract class _AttendeeEntity implements AttendeeEntity {
  const factory _AttendeeEntity(
      {required final String id,
      required final String userId,
      required final String eventId,
      required final String name,
      required final String email,
      final String? phone,
      required final String ticketId,
      required final String ticketType,
      required final AttendeeStatus status,
      required final DateTime registrationDate,
      final DateTime? checkInTime,
      final String? checkInStaffId,
      final String? notes,
      final Map<String, dynamic>? metadata}) = _$AttendeeEntityImpl;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get eventId;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String get ticketId;
  @override
  String get ticketType;
  @override
  AttendeeStatus get status;
  @override
  DateTime get registrationDate;
  @override
  DateTime? get checkInTime;
  @override
  String? get checkInStaffId;
  @override
  String? get notes;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of AttendeeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendeeEntityImplCopyWith<_$AttendeeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendeeSearchResult {
  List<AttendeeEntity> get attendees => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;

  /// Create a copy of AttendeeSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendeeSearchResultCopyWith<AttendeeSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendeeSearchResultCopyWith<$Res> {
  factory $AttendeeSearchResultCopyWith(AttendeeSearchResult value,
          $Res Function(AttendeeSearchResult) then) =
      _$AttendeeSearchResultCopyWithImpl<$Res, AttendeeSearchResult>;
  @useResult
  $Res call(
      {List<AttendeeEntity> attendees,
      int totalCount,
      bool hasMore,
      String? nextCursor});
}

/// @nodoc
class _$AttendeeSearchResultCopyWithImpl<$Res,
        $Val extends AttendeeSearchResult>
    implements $AttendeeSearchResultCopyWith<$Res> {
  _$AttendeeSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendeeSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendees = null,
    Object? totalCount = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
  }) {
    return _then(_value.copyWith(
      attendees: null == attendees
          ? _value.attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<AttendeeEntity>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendeeSearchResultImplCopyWith<$Res>
    implements $AttendeeSearchResultCopyWith<$Res> {
  factory _$$AttendeeSearchResultImplCopyWith(_$AttendeeSearchResultImpl value,
          $Res Function(_$AttendeeSearchResultImpl) then) =
      __$$AttendeeSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AttendeeEntity> attendees,
      int totalCount,
      bool hasMore,
      String? nextCursor});
}

/// @nodoc
class __$$AttendeeSearchResultImplCopyWithImpl<$Res>
    extends _$AttendeeSearchResultCopyWithImpl<$Res, _$AttendeeSearchResultImpl>
    implements _$$AttendeeSearchResultImplCopyWith<$Res> {
  __$$AttendeeSearchResultImplCopyWithImpl(_$AttendeeSearchResultImpl _value,
      $Res Function(_$AttendeeSearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendees = null,
    Object? totalCount = null,
    Object? hasMore = null,
    Object? nextCursor = freezed,
  }) {
    return _then(_$AttendeeSearchResultImpl(
      attendees: null == attendees
          ? _value._attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<AttendeeEntity>,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AttendeeSearchResultImpl implements _AttendeeSearchResult {
  const _$AttendeeSearchResultImpl(
      {required final List<AttendeeEntity> attendees,
      required this.totalCount,
      required this.hasMore,
      this.nextCursor})
      : _attendees = attendees;

  final List<AttendeeEntity> _attendees;
  @override
  List<AttendeeEntity> get attendees {
    if (_attendees is EqualUnmodifiableListView) return _attendees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendees);
  }

  @override
  final int totalCount;
  @override
  final bool hasMore;
  @override
  final String? nextCursor;

  @override
  String toString() {
    return 'AttendeeSearchResult(attendees: $attendees, totalCount: $totalCount, hasMore: $hasMore, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendeeSearchResultImpl &&
            const DeepCollectionEquality()
                .equals(other._attendees, _attendees) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_attendees),
      totalCount,
      hasMore,
      nextCursor);

  /// Create a copy of AttendeeSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendeeSearchResultImplCopyWith<_$AttendeeSearchResultImpl>
      get copyWith =>
          __$$AttendeeSearchResultImplCopyWithImpl<_$AttendeeSearchResultImpl>(
              this, _$identity);
}

abstract class _AttendeeSearchResult implements AttendeeSearchResult {
  const factory _AttendeeSearchResult(
      {required final List<AttendeeEntity> attendees,
      required final int totalCount,
      required final bool hasMore,
      final String? nextCursor}) = _$AttendeeSearchResultImpl;

  @override
  List<AttendeeEntity> get attendees;
  @override
  int get totalCount;
  @override
  bool get hasMore;
  @override
  String? get nextCursor;

  /// Create a copy of AttendeeSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendeeSearchResultImplCopyWith<_$AttendeeSearchResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendeeStats {
  int get totalRegistered => throw _privateConstructorUsedError;
  int get checkedIn => throw _privateConstructorUsedError;
  int get noShow => throw _privateConstructorUsedError;
  int get cancelled => throw _privateConstructorUsedError;
  double get checkInRate => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Create a copy of AttendeeStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendeeStatsCopyWith<AttendeeStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendeeStatsCopyWith<$Res> {
  factory $AttendeeStatsCopyWith(
          AttendeeStats value, $Res Function(AttendeeStats) then) =
      _$AttendeeStatsCopyWithImpl<$Res, AttendeeStats>;
  @useResult
  $Res call(
      {int totalRegistered,
      int checkedIn,
      int noShow,
      int cancelled,
      double checkInRate,
      DateTime lastUpdated});
}

/// @nodoc
class _$AttendeeStatsCopyWithImpl<$Res, $Val extends AttendeeStats>
    implements $AttendeeStatsCopyWith<$Res> {
  _$AttendeeStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendeeStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRegistered = null,
    Object? checkedIn = null,
    Object? noShow = null,
    Object? cancelled = null,
    Object? checkInRate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      totalRegistered: null == totalRegistered
          ? _value.totalRegistered
          : totalRegistered // ignore: cast_nullable_to_non_nullable
              as int,
      checkedIn: null == checkedIn
          ? _value.checkedIn
          : checkedIn // ignore: cast_nullable_to_non_nullable
              as int,
      noShow: null == noShow
          ? _value.noShow
          : noShow // ignore: cast_nullable_to_non_nullable
              as int,
      cancelled: null == cancelled
          ? _value.cancelled
          : cancelled // ignore: cast_nullable_to_non_nullable
              as int,
      checkInRate: null == checkInRate
          ? _value.checkInRate
          : checkInRate // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendeeStatsImplCopyWith<$Res>
    implements $AttendeeStatsCopyWith<$Res> {
  factory _$$AttendeeStatsImplCopyWith(
          _$AttendeeStatsImpl value, $Res Function(_$AttendeeStatsImpl) then) =
      __$$AttendeeStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalRegistered,
      int checkedIn,
      int noShow,
      int cancelled,
      double checkInRate,
      DateTime lastUpdated});
}

/// @nodoc
class __$$AttendeeStatsImplCopyWithImpl<$Res>
    extends _$AttendeeStatsCopyWithImpl<$Res, _$AttendeeStatsImpl>
    implements _$$AttendeeStatsImplCopyWith<$Res> {
  __$$AttendeeStatsImplCopyWithImpl(
      _$AttendeeStatsImpl _value, $Res Function(_$AttendeeStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRegistered = null,
    Object? checkedIn = null,
    Object? noShow = null,
    Object? cancelled = null,
    Object? checkInRate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$AttendeeStatsImpl(
      totalRegistered: null == totalRegistered
          ? _value.totalRegistered
          : totalRegistered // ignore: cast_nullable_to_non_nullable
              as int,
      checkedIn: null == checkedIn
          ? _value.checkedIn
          : checkedIn // ignore: cast_nullable_to_non_nullable
              as int,
      noShow: null == noShow
          ? _value.noShow
          : noShow // ignore: cast_nullable_to_non_nullable
              as int,
      cancelled: null == cancelled
          ? _value.cancelled
          : cancelled // ignore: cast_nullable_to_non_nullable
              as int,
      checkInRate: null == checkInRate
          ? _value.checkInRate
          : checkInRate // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AttendeeStatsImpl implements _AttendeeStats {
  const _$AttendeeStatsImpl(
      {required this.totalRegistered,
      required this.checkedIn,
      required this.noShow,
      required this.cancelled,
      required this.checkInRate,
      required this.lastUpdated});

  @override
  final int totalRegistered;
  @override
  final int checkedIn;
  @override
  final int noShow;
  @override
  final int cancelled;
  @override
  final double checkInRate;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'AttendeeStats(totalRegistered: $totalRegistered, checkedIn: $checkedIn, noShow: $noShow, cancelled: $cancelled, checkInRate: $checkInRate, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendeeStatsImpl &&
            (identical(other.totalRegistered, totalRegistered) ||
                other.totalRegistered == totalRegistered) &&
            (identical(other.checkedIn, checkedIn) ||
                other.checkedIn == checkedIn) &&
            (identical(other.noShow, noShow) || other.noShow == noShow) &&
            (identical(other.cancelled, cancelled) ||
                other.cancelled == cancelled) &&
            (identical(other.checkInRate, checkInRate) ||
                other.checkInRate == checkInRate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalRegistered, checkedIn,
      noShow, cancelled, checkInRate, lastUpdated);

  /// Create a copy of AttendeeStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendeeStatsImplCopyWith<_$AttendeeStatsImpl> get copyWith =>
      __$$AttendeeStatsImplCopyWithImpl<_$AttendeeStatsImpl>(this, _$identity);
}

abstract class _AttendeeStats implements AttendeeStats {
  const factory _AttendeeStats(
      {required final int totalRegistered,
      required final int checkedIn,
      required final int noShow,
      required final int cancelled,
      required final double checkInRate,
      required final DateTime lastUpdated}) = _$AttendeeStatsImpl;

  @override
  int get totalRegistered;
  @override
  int get checkedIn;
  @override
  int get noShow;
  @override
  int get cancelled;
  @override
  double get checkInRate;
  @override
  DateTime get lastUpdated;

  /// Create a copy of AttendeeStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendeeStatsImplCopyWith<_$AttendeeStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
