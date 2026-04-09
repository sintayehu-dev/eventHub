// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckInEntity {
  String get id => throw _privateConstructorUsedError;
  String get ticketId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get staffId => throw _privateConstructorUsedError;
  DateTime get checkInTime => throw _privateConstructorUsedError;
  CheckInStatus get status => throw _privateConstructorUsedError;
  String get qrCode => throw _privateConstructorUsedError;
  String? get ticketHolderName => throw _privateConstructorUsedError;
  String? get ticketTypeName => throw _privateConstructorUsedError;
  String? get eventTitle => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Create a copy of CheckInEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInEntityCopyWith<CheckInEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInEntityCopyWith<$Res> {
  factory $CheckInEntityCopyWith(
          CheckInEntity value, $Res Function(CheckInEntity) then) =
      _$CheckInEntityCopyWithImpl<$Res, CheckInEntity>;
  @useResult
  $Res call(
      {String id,
      String ticketId,
      String eventId,
      String staffId,
      DateTime checkInTime,
      CheckInStatus status,
      String qrCode,
      String? ticketHolderName,
      String? ticketTypeName,
      String? eventTitle,
      String? notes});
}

/// @nodoc
class _$CheckInEntityCopyWithImpl<$Res, $Val extends CheckInEntity>
    implements $CheckInEntityCopyWith<$Res> {
  _$CheckInEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? eventId = null,
    Object? staffId = null,
    Object? checkInTime = null,
    Object? status = null,
    Object? qrCode = null,
    Object? ticketHolderName = freezed,
    Object? ticketTypeName = freezed,
    Object? eventTitle = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      checkInTime: null == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckInStatus,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      ticketHolderName: freezed == ticketHolderName
          ? _value.ticketHolderName
          : ticketHolderName // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTypeName: freezed == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTitle: freezed == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckInEntityImplCopyWith<$Res>
    implements $CheckInEntityCopyWith<$Res> {
  factory _$$CheckInEntityImplCopyWith(
          _$CheckInEntityImpl value, $Res Function(_$CheckInEntityImpl) then) =
      __$$CheckInEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ticketId,
      String eventId,
      String staffId,
      DateTime checkInTime,
      CheckInStatus status,
      String qrCode,
      String? ticketHolderName,
      String? ticketTypeName,
      String? eventTitle,
      String? notes});
}

/// @nodoc
class __$$CheckInEntityImplCopyWithImpl<$Res>
    extends _$CheckInEntityCopyWithImpl<$Res, _$CheckInEntityImpl>
    implements _$$CheckInEntityImplCopyWith<$Res> {
  __$$CheckInEntityImplCopyWithImpl(
      _$CheckInEntityImpl _value, $Res Function(_$CheckInEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckInEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ticketId = null,
    Object? eventId = null,
    Object? staffId = null,
    Object? checkInTime = null,
    Object? status = null,
    Object? qrCode = null,
    Object? ticketHolderName = freezed,
    Object? ticketTypeName = freezed,
    Object? eventTitle = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$CheckInEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      checkInTime: null == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckInStatus,
      qrCode: null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
      ticketHolderName: freezed == ticketHolderName
          ? _value.ticketHolderName
          : ticketHolderName // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTypeName: freezed == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTitle: freezed == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CheckInEntityImpl implements _CheckInEntity {
  const _$CheckInEntityImpl(
      {required this.id,
      required this.ticketId,
      required this.eventId,
      required this.staffId,
      required this.checkInTime,
      required this.status,
      required this.qrCode,
      this.ticketHolderName,
      this.ticketTypeName,
      this.eventTitle,
      this.notes});

  @override
  final String id;
  @override
  final String ticketId;
  @override
  final String eventId;
  @override
  final String staffId;
  @override
  final DateTime checkInTime;
  @override
  final CheckInStatus status;
  @override
  final String qrCode;
  @override
  final String? ticketHolderName;
  @override
  final String? ticketTypeName;
  @override
  final String? eventTitle;
  @override
  final String? notes;

  @override
  String toString() {
    return 'CheckInEntity(id: $id, ticketId: $ticketId, eventId: $eventId, staffId: $staffId, checkInTime: $checkInTime, status: $status, qrCode: $qrCode, ticketHolderName: $ticketHolderName, ticketTypeName: $ticketTypeName, eventTitle: $eventTitle, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.checkInTime, checkInTime) ||
                other.checkInTime == checkInTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode) &&
            (identical(other.ticketHolderName, ticketHolderName) ||
                other.ticketHolderName == ticketHolderName) &&
            (identical(other.ticketTypeName, ticketTypeName) ||
                other.ticketTypeName == ticketTypeName) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ticketId,
      eventId,
      staffId,
      checkInTime,
      status,
      qrCode,
      ticketHolderName,
      ticketTypeName,
      eventTitle,
      notes);

  /// Create a copy of CheckInEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInEntityImplCopyWith<_$CheckInEntityImpl> get copyWith =>
      __$$CheckInEntityImplCopyWithImpl<_$CheckInEntityImpl>(this, _$identity);
}

abstract class _CheckInEntity implements CheckInEntity {
  const factory _CheckInEntity(
      {required final String id,
      required final String ticketId,
      required final String eventId,
      required final String staffId,
      required final DateTime checkInTime,
      required final CheckInStatus status,
      required final String qrCode,
      final String? ticketHolderName,
      final String? ticketTypeName,
      final String? eventTitle,
      final String? notes}) = _$CheckInEntityImpl;

  @override
  String get id;
  @override
  String get ticketId;
  @override
  String get eventId;
  @override
  String get staffId;
  @override
  DateTime get checkInTime;
  @override
  CheckInStatus get status;
  @override
  String get qrCode;
  @override
  String? get ticketHolderName;
  @override
  String? get ticketTypeName;
  @override
  String? get eventTitle;
  @override
  String? get notes;

  /// Create a copy of CheckInEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInEntityImplCopyWith<_$CheckInEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TicketValidationResult {
  bool get isValid => throw _privateConstructorUsedError;
  String get ticketId => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  CheckInStatus get status => throw _privateConstructorUsedError;
  String? get ticketHolderName => throw _privateConstructorUsedError;
  String? get ticketTypeName => throw _privateConstructorUsedError;
  String? get eventTitle => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  DateTime? get eventDateTime => throw _privateConstructorUsedError;
  String? get eventLocation => throw _privateConstructorUsedError;

  /// Create a copy of TicketValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketValidationResultCopyWith<TicketValidationResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketValidationResultCopyWith<$Res> {
  factory $TicketValidationResultCopyWith(TicketValidationResult value,
          $Res Function(TicketValidationResult) then) =
      _$TicketValidationResultCopyWithImpl<$Res, TicketValidationResult>;
  @useResult
  $Res call(
      {bool isValid,
      String ticketId,
      String eventId,
      CheckInStatus status,
      String? ticketHolderName,
      String? ticketTypeName,
      String? eventTitle,
      String? errorMessage,
      DateTime? eventDateTime,
      String? eventLocation});
}

/// @nodoc
class _$TicketValidationResultCopyWithImpl<$Res,
        $Val extends TicketValidationResult>
    implements $TicketValidationResultCopyWith<$Res> {
  _$TicketValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? ticketId = null,
    Object? eventId = null,
    Object? status = null,
    Object? ticketHolderName = freezed,
    Object? ticketTypeName = freezed,
    Object? eventTitle = freezed,
    Object? errorMessage = freezed,
    Object? eventDateTime = freezed,
    Object? eventLocation = freezed,
  }) {
    return _then(_value.copyWith(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckInStatus,
      ticketHolderName: freezed == ticketHolderName
          ? _value.ticketHolderName
          : ticketHolderName // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTypeName: freezed == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTitle: freezed == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDateTime: freezed == eventDateTime
          ? _value.eventDateTime
          : eventDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventLocation: freezed == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketValidationResultImplCopyWith<$Res>
    implements $TicketValidationResultCopyWith<$Res> {
  factory _$$TicketValidationResultImplCopyWith(
          _$TicketValidationResultImpl value,
          $Res Function(_$TicketValidationResultImpl) then) =
      __$$TicketValidationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isValid,
      String ticketId,
      String eventId,
      CheckInStatus status,
      String? ticketHolderName,
      String? ticketTypeName,
      String? eventTitle,
      String? errorMessage,
      DateTime? eventDateTime,
      String? eventLocation});
}

/// @nodoc
class __$$TicketValidationResultImplCopyWithImpl<$Res>
    extends _$TicketValidationResultCopyWithImpl<$Res,
        _$TicketValidationResultImpl>
    implements _$$TicketValidationResultImplCopyWith<$Res> {
  __$$TicketValidationResultImplCopyWithImpl(
      _$TicketValidationResultImpl _value,
      $Res Function(_$TicketValidationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? ticketId = null,
    Object? eventId = null,
    Object? status = null,
    Object? ticketHolderName = freezed,
    Object? ticketTypeName = freezed,
    Object? eventTitle = freezed,
    Object? errorMessage = freezed,
    Object? eventDateTime = freezed,
    Object? eventLocation = freezed,
  }) {
    return _then(_$TicketValidationResultImpl(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      ticketId: null == ticketId
          ? _value.ticketId
          : ticketId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckInStatus,
      ticketHolderName: freezed == ticketHolderName
          ? _value.ticketHolderName
          : ticketHolderName // ignore: cast_nullable_to_non_nullable
              as String?,
      ticketTypeName: freezed == ticketTypeName
          ? _value.ticketTypeName
          : ticketTypeName // ignore: cast_nullable_to_non_nullable
              as String?,
      eventTitle: freezed == eventTitle
          ? _value.eventTitle
          : eventTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDateTime: freezed == eventDateTime
          ? _value.eventDateTime
          : eventDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventLocation: freezed == eventLocation
          ? _value.eventLocation
          : eventLocation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TicketValidationResultImpl implements _TicketValidationResult {
  const _$TicketValidationResultImpl(
      {required this.isValid,
      required this.ticketId,
      required this.eventId,
      required this.status,
      this.ticketHolderName,
      this.ticketTypeName,
      this.eventTitle,
      this.errorMessage,
      this.eventDateTime,
      this.eventLocation});

  @override
  final bool isValid;
  @override
  final String ticketId;
  @override
  final String eventId;
  @override
  final CheckInStatus status;
  @override
  final String? ticketHolderName;
  @override
  final String? ticketTypeName;
  @override
  final String? eventTitle;
  @override
  final String? errorMessage;
  @override
  final DateTime? eventDateTime;
  @override
  final String? eventLocation;

  @override
  String toString() {
    return 'TicketValidationResult(isValid: $isValid, ticketId: $ticketId, eventId: $eventId, status: $status, ticketHolderName: $ticketHolderName, ticketTypeName: $ticketTypeName, eventTitle: $eventTitle, errorMessage: $errorMessage, eventDateTime: $eventDateTime, eventLocation: $eventLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketValidationResultImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.ticketHolderName, ticketHolderName) ||
                other.ticketHolderName == ticketHolderName) &&
            (identical(other.ticketTypeName, ticketTypeName) ||
                other.ticketTypeName == ticketTypeName) &&
            (identical(other.eventTitle, eventTitle) ||
                other.eventTitle == eventTitle) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.eventDateTime, eventDateTime) ||
                other.eventDateTime == eventDateTime) &&
            (identical(other.eventLocation, eventLocation) ||
                other.eventLocation == eventLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isValid,
      ticketId,
      eventId,
      status,
      ticketHolderName,
      ticketTypeName,
      eventTitle,
      errorMessage,
      eventDateTime,
      eventLocation);

  /// Create a copy of TicketValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketValidationResultImplCopyWith<_$TicketValidationResultImpl>
      get copyWith => __$$TicketValidationResultImplCopyWithImpl<
          _$TicketValidationResultImpl>(this, _$identity);
}

abstract class _TicketValidationResult implements TicketValidationResult {
  const factory _TicketValidationResult(
      {required final bool isValid,
      required final String ticketId,
      required final String eventId,
      required final CheckInStatus status,
      final String? ticketHolderName,
      final String? ticketTypeName,
      final String? eventTitle,
      final String? errorMessage,
      final DateTime? eventDateTime,
      final String? eventLocation}) = _$TicketValidationResultImpl;

  @override
  bool get isValid;
  @override
  String get ticketId;
  @override
  String get eventId;
  @override
  CheckInStatus get status;
  @override
  String? get ticketHolderName;
  @override
  String? get ticketTypeName;
  @override
  String? get eventTitle;
  @override
  String? get errorMessage;
  @override
  DateTime? get eventDateTime;
  @override
  String? get eventLocation;

  /// Create a copy of TicketValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketValidationResultImplCopyWith<_$TicketValidationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CheckInStats {
  int get totalTickets => throw _privateConstructorUsedError;
  int get checkedIn => throw _privateConstructorUsedError;
  int get remaining => throw _privateConstructorUsedError;
  double get checkInRate => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Create a copy of CheckInStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInStatsCopyWith<CheckInStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInStatsCopyWith<$Res> {
  factory $CheckInStatsCopyWith(
          CheckInStats value, $Res Function(CheckInStats) then) =
      _$CheckInStatsCopyWithImpl<$Res, CheckInStats>;
  @useResult
  $Res call(
      {int totalTickets,
      int checkedIn,
      int remaining,
      double checkInRate,
      DateTime lastUpdated});
}

/// @nodoc
class _$CheckInStatsCopyWithImpl<$Res, $Val extends CheckInStats>
    implements $CheckInStatsCopyWith<$Res> {
  _$CheckInStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTickets = null,
    Object? checkedIn = null,
    Object? remaining = null,
    Object? checkInRate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      totalTickets: null == totalTickets
          ? _value.totalTickets
          : totalTickets // ignore: cast_nullable_to_non_nullable
              as int,
      checkedIn: null == checkedIn
          ? _value.checkedIn
          : checkedIn // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
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
abstract class _$$CheckInStatsImplCopyWith<$Res>
    implements $CheckInStatsCopyWith<$Res> {
  factory _$$CheckInStatsImplCopyWith(
          _$CheckInStatsImpl value, $Res Function(_$CheckInStatsImpl) then) =
      __$$CheckInStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalTickets,
      int checkedIn,
      int remaining,
      double checkInRate,
      DateTime lastUpdated});
}

/// @nodoc
class __$$CheckInStatsImplCopyWithImpl<$Res>
    extends _$CheckInStatsCopyWithImpl<$Res, _$CheckInStatsImpl>
    implements _$$CheckInStatsImplCopyWith<$Res> {
  __$$CheckInStatsImplCopyWithImpl(
      _$CheckInStatsImpl _value, $Res Function(_$CheckInStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CheckInStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalTickets = null,
    Object? checkedIn = null,
    Object? remaining = null,
    Object? checkInRate = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$CheckInStatsImpl(
      totalTickets: null == totalTickets
          ? _value.totalTickets
          : totalTickets // ignore: cast_nullable_to_non_nullable
              as int,
      checkedIn: null == checkedIn
          ? _value.checkedIn
          : checkedIn // ignore: cast_nullable_to_non_nullable
              as int,
      remaining: null == remaining
          ? _value.remaining
          : remaining // ignore: cast_nullable_to_non_nullable
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

class _$CheckInStatsImpl implements _CheckInStats {
  const _$CheckInStatsImpl(
      {required this.totalTickets,
      required this.checkedIn,
      required this.remaining,
      required this.checkInRate,
      required this.lastUpdated});

  @override
  final int totalTickets;
  @override
  final int checkedIn;
  @override
  final int remaining;
  @override
  final double checkInRate;
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'CheckInStats(totalTickets: $totalTickets, checkedIn: $checkedIn, remaining: $remaining, checkInRate: $checkInRate, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInStatsImpl &&
            (identical(other.totalTickets, totalTickets) ||
                other.totalTickets == totalTickets) &&
            (identical(other.checkedIn, checkedIn) ||
                other.checkedIn == checkedIn) &&
            (identical(other.remaining, remaining) ||
                other.remaining == remaining) &&
            (identical(other.checkInRate, checkInRate) ||
                other.checkInRate == checkInRate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalTickets, checkedIn,
      remaining, checkInRate, lastUpdated);

  /// Create a copy of CheckInStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInStatsImplCopyWith<_$CheckInStatsImpl> get copyWith =>
      __$$CheckInStatsImplCopyWithImpl<_$CheckInStatsImpl>(this, _$identity);
}

abstract class _CheckInStats implements CheckInStats {
  const factory _CheckInStats(
      {required final int totalTickets,
      required final int checkedIn,
      required final int remaining,
      required final double checkInRate,
      required final DateTime lastUpdated}) = _$CheckInStatsImpl;

  @override
  int get totalTickets;
  @override
  int get checkedIn;
  @override
  int get remaining;
  @override
  double get checkInRate;
  @override
  DateTime get lastUpdated;

  /// Create a copy of CheckInStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInStatsImplCopyWith<_$CheckInStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
