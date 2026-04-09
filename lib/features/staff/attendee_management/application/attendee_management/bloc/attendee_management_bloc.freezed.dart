// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendee_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AttendeeManagementEvent {
  String get eventId => throw _privateConstructorUsedError;
  String get staffId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            String staffId,
            AttendeeStatus? status,
            String? searchQuery,
            int limit,
            String? cursor)
        loadEventAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId)
        loadAttendeeById,
    required TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)
        updateAttendeeStatus,
    required TResult Function(String eventId, String staffId) loadAttendeeStats,
    required TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)
        manualCheckIn,
    required TResult Function(String eventId, String staffId) refreshAttendees,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult? Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult? Function(String eventId, String staffId)? loadAttendeeStats,
    TResult? Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult? Function(String eventId, String staffId)? refreshAttendees,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult Function(String eventId, String staffId)? loadAttendeeStats,
    TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult Function(String eventId, String staffId)? refreshAttendees,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadAttendeeById value) loadAttendeeById,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_LoadAttendeeStats value) loadAttendeeStats,
    required TResult Function(_ManualCheckIn value) manualCheckIn,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult? Function(_ManualCheckIn value)? manualCheckIn,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult Function(_ManualCheckIn value)? manualCheckIn,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendeeManagementEventCopyWith<AttendeeManagementEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendeeManagementEventCopyWith<$Res> {
  factory $AttendeeManagementEventCopyWith(AttendeeManagementEvent value,
          $Res Function(AttendeeManagementEvent) then) =
      _$AttendeeManagementEventCopyWithImpl<$Res, AttendeeManagementEvent>;
  @useResult
  $Res call({String eventId, String staffId});
}

/// @nodoc
class _$AttendeeManagementEventCopyWithImpl<$Res,
        $Val extends AttendeeManagementEvent>
    implements $AttendeeManagementEventCopyWith<$Res> {
  _$AttendeeManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? staffId = null,
  }) {
    return _then(_value.copyWith(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadEventAttendeesImplCopyWith<$Res>
    implements $AttendeeManagementEventCopyWith<$Res> {
  factory _$$LoadEventAttendeesImplCopyWith(_$LoadEventAttendeesImpl value,
          $Res Function(_$LoadEventAttendeesImpl) then) =
      __$$LoadEventAttendeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String staffId,
      AttendeeStatus? status,
      String? searchQuery,
      int limit,
      String? cursor});
}

/// @nodoc
class __$$LoadEventAttendeesImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res,
        _$LoadEventAttendeesImpl>
    implements _$$LoadEventAttendeesImplCopyWith<$Res> {
  __$$LoadEventAttendeesImplCopyWithImpl(_$LoadEventAttendeesImpl _value,
      $Res Function(_$LoadEventAttendeesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? staffId = null,
    Object? status = freezed,
    Object? searchQuery = freezed,
    Object? limit = null,
    Object? cursor = freezed,
  }) {
    return _then(_$LoadEventAttendeesImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      cursor: freezed == cursor
          ? _value.cursor
          : cursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadEventAttendeesImpl implements _LoadEventAttendees {
  const _$LoadEventAttendeesImpl(
      {required this.eventId,
      required this.staffId,
      this.status,
      this.searchQuery,
      this.limit = 20,
      this.cursor});

  @override
  final String eventId;
  @override
  final String staffId;
  @override
  final AttendeeStatus? status;
  @override
  final String? searchQuery;
  @override
  @JsonKey()
  final int limit;
  @override
  final String? cursor;

  @override
  String toString() {
    return 'AttendeeManagementEvent.loadEventAttendees(eventId: $eventId, staffId: $staffId, status: $status, searchQuery: $searchQuery, limit: $limit, cursor: $cursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventAttendeesImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.cursor, cursor) || other.cursor == cursor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, eventId, staffId, status, searchQuery, limit, cursor);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventAttendeesImplCopyWith<_$LoadEventAttendeesImpl> get copyWith =>
      __$$LoadEventAttendeesImplCopyWithImpl<_$LoadEventAttendeesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            String staffId,
            AttendeeStatus? status,
            String? searchQuery,
            int limit,
            String? cursor)
        loadEventAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId)
        loadAttendeeById,
    required TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)
        updateAttendeeStatus,
    required TResult Function(String eventId, String staffId) loadAttendeeStats,
    required TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)
        manualCheckIn,
    required TResult Function(String eventId, String staffId) refreshAttendees,
  }) {
    return loadEventAttendees(
        eventId, staffId, status, searchQuery, limit, cursor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult? Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult? Function(String eventId, String staffId)? loadAttendeeStats,
    TResult? Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult? Function(String eventId, String staffId)? refreshAttendees,
  }) {
    return loadEventAttendees?.call(
        eventId, staffId, status, searchQuery, limit, cursor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult Function(String eventId, String staffId)? loadAttendeeStats,
    TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult Function(String eventId, String staffId)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (loadEventAttendees != null) {
      return loadEventAttendees(
          eventId, staffId, status, searchQuery, limit, cursor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadAttendeeById value) loadAttendeeById,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_LoadAttendeeStats value) loadAttendeeStats,
    required TResult Function(_ManualCheckIn value) manualCheckIn,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
  }) {
    return loadEventAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult? Function(_ManualCheckIn value)? manualCheckIn,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
  }) {
    return loadEventAttendees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult Function(_ManualCheckIn value)? manualCheckIn,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (loadEventAttendees != null) {
      return loadEventAttendees(this);
    }
    return orElse();
  }
}

abstract class _LoadEventAttendees implements AttendeeManagementEvent {
  const factory _LoadEventAttendees(
      {required final String eventId,
      required final String staffId,
      final AttendeeStatus? status,
      final String? searchQuery,
      final int limit,
      final String? cursor}) = _$LoadEventAttendeesImpl;

  @override
  String get eventId;
  @override
  String get staffId;
  AttendeeStatus? get status;
  String? get searchQuery;
  int get limit;
  String? get cursor;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadEventAttendeesImplCopyWith<_$LoadEventAttendeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAttendeeByIdImplCopyWith<$Res>
    implements $AttendeeManagementEventCopyWith<$Res> {
  factory _$$LoadAttendeeByIdImplCopyWith(_$LoadAttendeeByIdImpl value,
          $Res Function(_$LoadAttendeeByIdImpl) then) =
      __$$LoadAttendeeByIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String attendeeId, String eventId, String staffId});
}

/// @nodoc
class __$$LoadAttendeeByIdImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res, _$LoadAttendeeByIdImpl>
    implements _$$LoadAttendeeByIdImplCopyWith<$Res> {
  __$$LoadAttendeeByIdImplCopyWithImpl(_$LoadAttendeeByIdImpl _value,
      $Res Function(_$LoadAttendeeByIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendeeId = null,
    Object? eventId = null,
    Object? staffId = null,
  }) {
    return _then(_$LoadAttendeeByIdImpl(
      attendeeId: null == attendeeId
          ? _value.attendeeId
          : attendeeId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadAttendeeByIdImpl implements _LoadAttendeeById {
  const _$LoadAttendeeByIdImpl(
      {required this.attendeeId, required this.eventId, required this.staffId});

  @override
  final String attendeeId;
  @override
  final String eventId;
  @override
  final String staffId;

  @override
  String toString() {
    return 'AttendeeManagementEvent.loadAttendeeById(attendeeId: $attendeeId, eventId: $eventId, staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAttendeeByIdImpl &&
            (identical(other.attendeeId, attendeeId) ||
                other.attendeeId == attendeeId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attendeeId, eventId, staffId);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAttendeeByIdImplCopyWith<_$LoadAttendeeByIdImpl> get copyWith =>
      __$$LoadAttendeeByIdImplCopyWithImpl<_$LoadAttendeeByIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            String staffId,
            AttendeeStatus? status,
            String? searchQuery,
            int limit,
            String? cursor)
        loadEventAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId)
        loadAttendeeById,
    required TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)
        updateAttendeeStatus,
    required TResult Function(String eventId, String staffId) loadAttendeeStats,
    required TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)
        manualCheckIn,
    required TResult Function(String eventId, String staffId) refreshAttendees,
  }) {
    return loadAttendeeById(attendeeId, eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult? Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult? Function(String eventId, String staffId)? loadAttendeeStats,
    TResult? Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult? Function(String eventId, String staffId)? refreshAttendees,
  }) {
    return loadAttendeeById?.call(attendeeId, eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult Function(String eventId, String staffId)? loadAttendeeStats,
    TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult Function(String eventId, String staffId)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (loadAttendeeById != null) {
      return loadAttendeeById(attendeeId, eventId, staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadAttendeeById value) loadAttendeeById,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_LoadAttendeeStats value) loadAttendeeStats,
    required TResult Function(_ManualCheckIn value) manualCheckIn,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
  }) {
    return loadAttendeeById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult? Function(_ManualCheckIn value)? manualCheckIn,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
  }) {
    return loadAttendeeById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult Function(_ManualCheckIn value)? manualCheckIn,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (loadAttendeeById != null) {
      return loadAttendeeById(this);
    }
    return orElse();
  }
}

abstract class _LoadAttendeeById implements AttendeeManagementEvent {
  const factory _LoadAttendeeById(
      {required final String attendeeId,
      required final String eventId,
      required final String staffId}) = _$LoadAttendeeByIdImpl;

  String get attendeeId;
  @override
  String get eventId;
  @override
  String get staffId;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadAttendeeByIdImplCopyWith<_$LoadAttendeeByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchAttendeesImplCopyWith<$Res>
    implements $AttendeeManagementEventCopyWith<$Res> {
  factory _$$SearchAttendeesImplCopyWith(_$SearchAttendeesImpl value,
          $Res Function(_$SearchAttendeesImpl) then) =
      __$$SearchAttendeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String eventId,
      String staffId,
      String query,
      AttendeeStatus? status,
      int limit});
}

/// @nodoc
class __$$SearchAttendeesImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res, _$SearchAttendeesImpl>
    implements _$$SearchAttendeesImplCopyWith<$Res> {
  __$$SearchAttendeesImplCopyWithImpl(
      _$SearchAttendeesImpl _value, $Res Function(_$SearchAttendeesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? staffId = null,
    Object? query = null,
    Object? status = freezed,
    Object? limit = null,
  }) {
    return _then(_$SearchAttendeesImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus?,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SearchAttendeesImpl implements _SearchAttendees {
  const _$SearchAttendeesImpl(
      {required this.eventId,
      required this.staffId,
      required this.query,
      this.status,
      this.limit = 20});

  @override
  final String eventId;
  @override
  final String staffId;
  @override
  final String query;
  @override
  final AttendeeStatus? status;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString() {
    return 'AttendeeManagementEvent.searchAttendees(eventId: $eventId, staffId: $staffId, query: $query, status: $status, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchAttendeesImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, staffId, query, status, limit);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchAttendeesImplCopyWith<_$SearchAttendeesImpl> get copyWith =>
      __$$SearchAttendeesImplCopyWithImpl<_$SearchAttendeesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            String staffId,
            AttendeeStatus? status,
            String? searchQuery,
            int limit,
            String? cursor)
        loadEventAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId)
        loadAttendeeById,
    required TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)
        updateAttendeeStatus,
    required TResult Function(String eventId, String staffId) loadAttendeeStats,
    required TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)
        manualCheckIn,
    required TResult Function(String eventId, String staffId) refreshAttendees,
  }) {
    return searchAttendees(eventId, staffId, query, status, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult? Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult? Function(String eventId, String staffId)? loadAttendeeStats,
    TResult? Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult? Function(String eventId, String staffId)? refreshAttendees,
  }) {
    return searchAttendees?.call(eventId, staffId, query, status, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult Function(String eventId, String staffId)? loadAttendeeStats,
    TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult Function(String eventId, String staffId)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (searchAttendees != null) {
      return searchAttendees(eventId, staffId, query, status, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadAttendeeById value) loadAttendeeById,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_LoadAttendeeStats value) loadAttendeeStats,
    required TResult Function(_ManualCheckIn value) manualCheckIn,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
  }) {
    return searchAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult? Function(_ManualCheckIn value)? manualCheckIn,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
  }) {
    return searchAttendees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult Function(_ManualCheckIn value)? manualCheckIn,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (searchAttendees != null) {
      return searchAttendees(this);
    }
    return orElse();
  }
}

abstract class _SearchAttendees implements AttendeeManagementEvent {
  const factory _SearchAttendees(
      {required final String eventId,
      required final String staffId,
      required final String query,
      final AttendeeStatus? status,
      final int limit}) = _$SearchAttendeesImpl;

  @override
  String get eventId;
  @override
  String get staffId;
  String get query;
  AttendeeStatus? get status;
  int get limit;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchAttendeesImplCopyWith<_$SearchAttendeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAttendeeStatusImplCopyWith<$Res>
    implements $AttendeeManagementEventCopyWith<$Res> {
  factory _$$UpdateAttendeeStatusImplCopyWith(_$UpdateAttendeeStatusImpl value,
          $Res Function(_$UpdateAttendeeStatusImpl) then) =
      __$$UpdateAttendeeStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String attendeeId,
      String eventId,
      String staffId,
      AttendeeStatus status,
      String? notes});
}

/// @nodoc
class __$$UpdateAttendeeStatusImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res,
        _$UpdateAttendeeStatusImpl>
    implements _$$UpdateAttendeeStatusImplCopyWith<$Res> {
  __$$UpdateAttendeeStatusImplCopyWithImpl(_$UpdateAttendeeStatusImpl _value,
      $Res Function(_$UpdateAttendeeStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendeeId = null,
    Object? eventId = null,
    Object? staffId = null,
    Object? status = null,
    Object? notes = freezed,
  }) {
    return _then(_$UpdateAttendeeStatusImpl(
      attendeeId: null == attendeeId
          ? _value.attendeeId
          : attendeeId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateAttendeeStatusImpl implements _UpdateAttendeeStatus {
  const _$UpdateAttendeeStatusImpl(
      {required this.attendeeId,
      required this.eventId,
      required this.staffId,
      required this.status,
      this.notes});

  @override
  final String attendeeId;
  @override
  final String eventId;
  @override
  final String staffId;
  @override
  final AttendeeStatus status;
  @override
  final String? notes;

  @override
  String toString() {
    return 'AttendeeManagementEvent.updateAttendeeStatus(attendeeId: $attendeeId, eventId: $eventId, staffId: $staffId, status: $status, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAttendeeStatusImpl &&
            (identical(other.attendeeId, attendeeId) ||
                other.attendeeId == attendeeId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, attendeeId, eventId, staffId, status, notes);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAttendeeStatusImplCopyWith<_$UpdateAttendeeStatusImpl>
      get copyWith =>
          __$$UpdateAttendeeStatusImplCopyWithImpl<_$UpdateAttendeeStatusImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            String staffId,
            AttendeeStatus? status,
            String? searchQuery,
            int limit,
            String? cursor)
        loadEventAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId)
        loadAttendeeById,
    required TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)
        updateAttendeeStatus,
    required TResult Function(String eventId, String staffId) loadAttendeeStats,
    required TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)
        manualCheckIn,
    required TResult Function(String eventId, String staffId) refreshAttendees,
  }) {
    return updateAttendeeStatus(attendeeId, eventId, staffId, status, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult? Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult? Function(String eventId, String staffId)? loadAttendeeStats,
    TResult? Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult? Function(String eventId, String staffId)? refreshAttendees,
  }) {
    return updateAttendeeStatus?.call(
        attendeeId, eventId, staffId, status, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult Function(String eventId, String staffId)? loadAttendeeStats,
    TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult Function(String eventId, String staffId)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (updateAttendeeStatus != null) {
      return updateAttendeeStatus(attendeeId, eventId, staffId, status, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadAttendeeById value) loadAttendeeById,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_LoadAttendeeStats value) loadAttendeeStats,
    required TResult Function(_ManualCheckIn value) manualCheckIn,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
  }) {
    return updateAttendeeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult? Function(_ManualCheckIn value)? manualCheckIn,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
  }) {
    return updateAttendeeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult Function(_ManualCheckIn value)? manualCheckIn,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (updateAttendeeStatus != null) {
      return updateAttendeeStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateAttendeeStatus implements AttendeeManagementEvent {
  const factory _UpdateAttendeeStatus(
      {required final String attendeeId,
      required final String eventId,
      required final String staffId,
      required final AttendeeStatus status,
      final String? notes}) = _$UpdateAttendeeStatusImpl;

  String get attendeeId;
  @override
  String get eventId;
  @override
  String get staffId;
  AttendeeStatus get status;
  String? get notes;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAttendeeStatusImplCopyWith<_$UpdateAttendeeStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAttendeeStatsImplCopyWith<$Res>
    implements $AttendeeManagementEventCopyWith<$Res> {
  factory _$$LoadAttendeeStatsImplCopyWith(_$LoadAttendeeStatsImpl value,
          $Res Function(_$LoadAttendeeStatsImpl) then) =
      __$$LoadAttendeeStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventId, String staffId});
}

/// @nodoc
class __$$LoadAttendeeStatsImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res, _$LoadAttendeeStatsImpl>
    implements _$$LoadAttendeeStatsImplCopyWith<$Res> {
  __$$LoadAttendeeStatsImplCopyWithImpl(_$LoadAttendeeStatsImpl _value,
      $Res Function(_$LoadAttendeeStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? staffId = null,
  }) {
    return _then(_$LoadAttendeeStatsImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadAttendeeStatsImpl implements _LoadAttendeeStats {
  const _$LoadAttendeeStatsImpl({required this.eventId, required this.staffId});

  @override
  final String eventId;
  @override
  final String staffId;

  @override
  String toString() {
    return 'AttendeeManagementEvent.loadAttendeeStats(eventId: $eventId, staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAttendeeStatsImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, staffId);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAttendeeStatsImplCopyWith<_$LoadAttendeeStatsImpl> get copyWith =>
      __$$LoadAttendeeStatsImplCopyWithImpl<_$LoadAttendeeStatsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            String staffId,
            AttendeeStatus? status,
            String? searchQuery,
            int limit,
            String? cursor)
        loadEventAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId)
        loadAttendeeById,
    required TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)
        updateAttendeeStatus,
    required TResult Function(String eventId, String staffId) loadAttendeeStats,
    required TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)
        manualCheckIn,
    required TResult Function(String eventId, String staffId) refreshAttendees,
  }) {
    return loadAttendeeStats(eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult? Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult? Function(String eventId, String staffId)? loadAttendeeStats,
    TResult? Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult? Function(String eventId, String staffId)? refreshAttendees,
  }) {
    return loadAttendeeStats?.call(eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult Function(String eventId, String staffId)? loadAttendeeStats,
    TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult Function(String eventId, String staffId)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (loadAttendeeStats != null) {
      return loadAttendeeStats(eventId, staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadAttendeeById value) loadAttendeeById,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_LoadAttendeeStats value) loadAttendeeStats,
    required TResult Function(_ManualCheckIn value) manualCheckIn,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
  }) {
    return loadAttendeeStats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult? Function(_ManualCheckIn value)? manualCheckIn,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
  }) {
    return loadAttendeeStats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult Function(_ManualCheckIn value)? manualCheckIn,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (loadAttendeeStats != null) {
      return loadAttendeeStats(this);
    }
    return orElse();
  }
}

abstract class _LoadAttendeeStats implements AttendeeManagementEvent {
  const factory _LoadAttendeeStats(
      {required final String eventId,
      required final String staffId}) = _$LoadAttendeeStatsImpl;

  @override
  String get eventId;
  @override
  String get staffId;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadAttendeeStatsImplCopyWith<_$LoadAttendeeStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ManualCheckInImplCopyWith<$Res>
    implements $AttendeeManagementEventCopyWith<$Res> {
  factory _$$ManualCheckInImplCopyWith(
          _$ManualCheckInImpl value, $Res Function(_$ManualCheckInImpl) then) =
      __$$ManualCheckInImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String attendeeId, String eventId, String staffId, String? notes});
}

/// @nodoc
class __$$ManualCheckInImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res, _$ManualCheckInImpl>
    implements _$$ManualCheckInImplCopyWith<$Res> {
  __$$ManualCheckInImplCopyWithImpl(
      _$ManualCheckInImpl _value, $Res Function(_$ManualCheckInImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendeeId = null,
    Object? eventId = null,
    Object? staffId = null,
    Object? notes = freezed,
  }) {
    return _then(_$ManualCheckInImpl(
      attendeeId: null == attendeeId
          ? _value.attendeeId
          : attendeeId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ManualCheckInImpl implements _ManualCheckIn {
  const _$ManualCheckInImpl(
      {required this.attendeeId,
      required this.eventId,
      required this.staffId,
      this.notes});

  @override
  final String attendeeId;
  @override
  final String eventId;
  @override
  final String staffId;
  @override
  final String? notes;

  @override
  String toString() {
    return 'AttendeeManagementEvent.manualCheckIn(attendeeId: $attendeeId, eventId: $eventId, staffId: $staffId, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManualCheckInImpl &&
            (identical(other.attendeeId, attendeeId) ||
                other.attendeeId == attendeeId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, attendeeId, eventId, staffId, notes);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManualCheckInImplCopyWith<_$ManualCheckInImpl> get copyWith =>
      __$$ManualCheckInImplCopyWithImpl<_$ManualCheckInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            String staffId,
            AttendeeStatus? status,
            String? searchQuery,
            int limit,
            String? cursor)
        loadEventAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId)
        loadAttendeeById,
    required TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)
        updateAttendeeStatus,
    required TResult Function(String eventId, String staffId) loadAttendeeStats,
    required TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)
        manualCheckIn,
    required TResult Function(String eventId, String staffId) refreshAttendees,
  }) {
    return manualCheckIn(attendeeId, eventId, staffId, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult? Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult? Function(String eventId, String staffId)? loadAttendeeStats,
    TResult? Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult? Function(String eventId, String staffId)? refreshAttendees,
  }) {
    return manualCheckIn?.call(attendeeId, eventId, staffId, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult Function(String eventId, String staffId)? loadAttendeeStats,
    TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult Function(String eventId, String staffId)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (manualCheckIn != null) {
      return manualCheckIn(attendeeId, eventId, staffId, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadAttendeeById value) loadAttendeeById,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_LoadAttendeeStats value) loadAttendeeStats,
    required TResult Function(_ManualCheckIn value) manualCheckIn,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
  }) {
    return manualCheckIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult? Function(_ManualCheckIn value)? manualCheckIn,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
  }) {
    return manualCheckIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult Function(_ManualCheckIn value)? manualCheckIn,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (manualCheckIn != null) {
      return manualCheckIn(this);
    }
    return orElse();
  }
}

abstract class _ManualCheckIn implements AttendeeManagementEvent {
  const factory _ManualCheckIn(
      {required final String attendeeId,
      required final String eventId,
      required final String staffId,
      final String? notes}) = _$ManualCheckInImpl;

  String get attendeeId;
  @override
  String get eventId;
  @override
  String get staffId;
  String? get notes;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManualCheckInImplCopyWith<_$ManualCheckInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshAttendeesImplCopyWith<$Res>
    implements $AttendeeManagementEventCopyWith<$Res> {
  factory _$$RefreshAttendeesImplCopyWith(_$RefreshAttendeesImpl value,
          $Res Function(_$RefreshAttendeesImpl) then) =
      __$$RefreshAttendeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String eventId, String staffId});
}

/// @nodoc
class __$$RefreshAttendeesImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res, _$RefreshAttendeesImpl>
    implements _$$RefreshAttendeesImplCopyWith<$Res> {
  __$$RefreshAttendeesImplCopyWithImpl(_$RefreshAttendeesImpl _value,
      $Res Function(_$RefreshAttendeesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? staffId = null,
  }) {
    return _then(_$RefreshAttendeesImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshAttendeesImpl implements _RefreshAttendees {
  const _$RefreshAttendeesImpl({required this.eventId, required this.staffId});

  @override
  final String eventId;
  @override
  final String staffId;

  @override
  String toString() {
    return 'AttendeeManagementEvent.refreshAttendees(eventId: $eventId, staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshAttendeesImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, staffId);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshAttendeesImplCopyWith<_$RefreshAttendeesImpl> get copyWith =>
      __$$RefreshAttendeesImplCopyWithImpl<_$RefreshAttendeesImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId,
            String staffId,
            AttendeeStatus? status,
            String? searchQuery,
            int limit,
            String? cursor)
        loadEventAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId)
        loadAttendeeById,
    required TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)
        updateAttendeeStatus,
    required TResult Function(String eventId, String staffId) loadAttendeeStats,
    required TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)
        manualCheckIn,
    required TResult Function(String eventId, String staffId) refreshAttendees,
  }) {
    return refreshAttendees(eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult? Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult? Function(String eventId, String staffId)? loadAttendeeStats,
    TResult? Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult? Function(String eventId, String staffId)? refreshAttendees,
  }) {
    return refreshAttendees?.call(eventId, staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, String staffId, AttendeeStatus? status,
            String? searchQuery, int limit, String? cursor)?
        loadEventAttendees,
    TResult Function(String attendeeId, String eventId, String staffId)?
        loadAttendeeById,
    TResult Function(String eventId, String staffId, String query,
            AttendeeStatus? status, int limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId, String staffId,
            AttendeeStatus status, String? notes)?
        updateAttendeeStatus,
    TResult Function(String eventId, String staffId)? loadAttendeeStats,
    TResult Function(
            String attendeeId, String eventId, String staffId, String? notes)?
        manualCheckIn,
    TResult Function(String eventId, String staffId)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (refreshAttendees != null) {
      return refreshAttendees(eventId, staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadAttendeeById value) loadAttendeeById,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_LoadAttendeeStats value) loadAttendeeStats,
    required TResult Function(_ManualCheckIn value) manualCheckIn,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
  }) {
    return refreshAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult? Function(_ManualCheckIn value)? manualCheckIn,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
  }) {
    return refreshAttendees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadAttendeeById value)? loadAttendeeById,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_LoadAttendeeStats value)? loadAttendeeStats,
    TResult Function(_ManualCheckIn value)? manualCheckIn,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    required TResult orElse(),
  }) {
    if (refreshAttendees != null) {
      return refreshAttendees(this);
    }
    return orElse();
  }
}

abstract class _RefreshAttendees implements AttendeeManagementEvent {
  const factory _RefreshAttendees(
      {required final String eventId,
      required final String staffId}) = _$RefreshAttendeesImpl;

  @override
  String get eventId;
  @override
  String get staffId;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshAttendeesImplCopyWith<_$RefreshAttendeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendeeManagementState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isLoadingAttendee => throw _privateConstructorUsedError;
  bool get isUpdatingStatus => throw _privateConstructorUsedError;
  bool get isCheckingIn => throw _privateConstructorUsedError;
  bool get isLoadingStats => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  List<AttendeeEntity> get attendees => throw _privateConstructorUsedError;
  AttendeeEntity? get selectedAttendee => throw _privateConstructorUsedError;
  AttendeeStats? get stats => throw _privateConstructorUsedError;
  bool get isSearchResult => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  AttendeeStatus? get filterStatus => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;

  /// Create a copy of AttendeeManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendeeManagementStateCopyWith<AttendeeManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendeeManagementStateCopyWith<$Res> {
  factory $AttendeeManagementStateCopyWith(AttendeeManagementState value,
          $Res Function(AttendeeManagementState) then) =
      _$AttendeeManagementStateCopyWithImpl<$Res, AttendeeManagementState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingAttendee,
      bool isUpdatingStatus,
      bool isCheckingIn,
      bool isLoadingStats,
      bool hasError,
      String errorMessage,
      List<AttendeeEntity> attendees,
      AttendeeEntity? selectedAttendee,
      AttendeeStats? stats,
      bool isSearchResult,
      String? searchQuery,
      AttendeeStatus? filterStatus,
      String? nextCursor,
      bool hasMoreData});

  $AttendeeEntityCopyWith<$Res>? get selectedAttendee;
  $AttendeeStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class _$AttendeeManagementStateCopyWithImpl<$Res,
        $Val extends AttendeeManagementState>
    implements $AttendeeManagementStateCopyWith<$Res> {
  _$AttendeeManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendeeManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingAttendee = null,
    Object? isUpdatingStatus = null,
    Object? isCheckingIn = null,
    Object? isLoadingStats = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? attendees = null,
    Object? selectedAttendee = freezed,
    Object? stats = freezed,
    Object? isSearchResult = null,
    Object? searchQuery = freezed,
    Object? filterStatus = freezed,
    Object? nextCursor = freezed,
    Object? hasMoreData = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingAttendee: null == isLoadingAttendee
          ? _value.isLoadingAttendee
          : isLoadingAttendee // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStatus: null == isUpdatingStatus
          ? _value.isUpdatingStatus
          : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingIn: null == isCheckingIn
          ? _value.isCheckingIn
          : isCheckingIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingStats: null == isLoadingStats
          ? _value.isLoadingStats
          : isLoadingStats // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      attendees: null == attendees
          ? _value.attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<AttendeeEntity>,
      selectedAttendee: freezed == selectedAttendee
          ? _value.selectedAttendee
          : selectedAttendee // ignore: cast_nullable_to_non_nullable
              as AttendeeEntity?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as AttendeeStats?,
      isSearchResult: null == isSearchResult
          ? _value.isSearchResult
          : isSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus?,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AttendeeManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendeeEntityCopyWith<$Res>? get selectedAttendee {
    if (_value.selectedAttendee == null) {
      return null;
    }

    return $AttendeeEntityCopyWith<$Res>(_value.selectedAttendee!, (value) {
      return _then(_value.copyWith(selectedAttendee: value) as $Val);
    });
  }

  /// Create a copy of AttendeeManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendeeStatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $AttendeeStatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendeeManagementStateImplCopyWith<$Res>
    implements $AttendeeManagementStateCopyWith<$Res> {
  factory _$$AttendeeManagementStateImplCopyWith(
          _$AttendeeManagementStateImpl value,
          $Res Function(_$AttendeeManagementStateImpl) then) =
      __$$AttendeeManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isLoadingAttendee,
      bool isUpdatingStatus,
      bool isCheckingIn,
      bool isLoadingStats,
      bool hasError,
      String errorMessage,
      List<AttendeeEntity> attendees,
      AttendeeEntity? selectedAttendee,
      AttendeeStats? stats,
      bool isSearchResult,
      String? searchQuery,
      AttendeeStatus? filterStatus,
      String? nextCursor,
      bool hasMoreData});

  @override
  $AttendeeEntityCopyWith<$Res>? get selectedAttendee;
  @override
  $AttendeeStatsCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$AttendeeManagementStateImplCopyWithImpl<$Res>
    extends _$AttendeeManagementStateCopyWithImpl<$Res,
        _$AttendeeManagementStateImpl>
    implements _$$AttendeeManagementStateImplCopyWith<$Res> {
  __$$AttendeeManagementStateImplCopyWithImpl(
      _$AttendeeManagementStateImpl _value,
      $Res Function(_$AttendeeManagementStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isLoadingAttendee = null,
    Object? isUpdatingStatus = null,
    Object? isCheckingIn = null,
    Object? isLoadingStats = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? attendees = null,
    Object? selectedAttendee = freezed,
    Object? stats = freezed,
    Object? isSearchResult = null,
    Object? searchQuery = freezed,
    Object? filterStatus = freezed,
    Object? nextCursor = freezed,
    Object? hasMoreData = null,
  }) {
    return _then(_$AttendeeManagementStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingAttendee: null == isLoadingAttendee
          ? _value.isLoadingAttendee
          : isLoadingAttendee // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdatingStatus: null == isUpdatingStatus
          ? _value.isUpdatingStatus
          : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingIn: null == isCheckingIn
          ? _value.isCheckingIn
          : isCheckingIn // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingStats: null == isLoadingStats
          ? _value.isLoadingStats
          : isLoadingStats // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      attendees: null == attendees
          ? _value._attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<AttendeeEntity>,
      selectedAttendee: freezed == selectedAttendee
          ? _value.selectedAttendee
          : selectedAttendee // ignore: cast_nullable_to_non_nullable
              as AttendeeEntity?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as AttendeeStats?,
      isSearchResult: null == isSearchResult
          ? _value.isSearchResult
          : isSearchResult // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus?,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AttendeeManagementStateImpl implements _AttendeeManagementState {
  const _$AttendeeManagementStateImpl(
      {this.isLoading = false,
      this.isLoadingAttendee = false,
      this.isUpdatingStatus = false,
      this.isCheckingIn = false,
      this.isLoadingStats = false,
      this.hasError = false,
      this.errorMessage = '',
      final List<AttendeeEntity> attendees = const [],
      this.selectedAttendee,
      this.stats,
      this.isSearchResult = false,
      this.searchQuery,
      this.filterStatus,
      this.nextCursor,
      this.hasMoreData = false})
      : _attendees = attendees;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isLoadingAttendee;
  @override
  @JsonKey()
  final bool isUpdatingStatus;
  @override
  @JsonKey()
  final bool isCheckingIn;
  @override
  @JsonKey()
  final bool isLoadingStats;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  final List<AttendeeEntity> _attendees;
  @override
  @JsonKey()
  List<AttendeeEntity> get attendees {
    if (_attendees is EqualUnmodifiableListView) return _attendees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendees);
  }

  @override
  final AttendeeEntity? selectedAttendee;
  @override
  final AttendeeStats? stats;
  @override
  @JsonKey()
  final bool isSearchResult;
  @override
  final String? searchQuery;
  @override
  final AttendeeStatus? filterStatus;
  @override
  final String? nextCursor;
  @override
  @JsonKey()
  final bool hasMoreData;

  @override
  String toString() {
    return 'AttendeeManagementState(isLoading: $isLoading, isLoadingAttendee: $isLoadingAttendee, isUpdatingStatus: $isUpdatingStatus, isCheckingIn: $isCheckingIn, isLoadingStats: $isLoadingStats, hasError: $hasError, errorMessage: $errorMessage, attendees: $attendees, selectedAttendee: $selectedAttendee, stats: $stats, isSearchResult: $isSearchResult, searchQuery: $searchQuery, filterStatus: $filterStatus, nextCursor: $nextCursor, hasMoreData: $hasMoreData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendeeManagementStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isLoadingAttendee, isLoadingAttendee) ||
                other.isLoadingAttendee == isLoadingAttendee) &&
            (identical(other.isUpdatingStatus, isUpdatingStatus) ||
                other.isUpdatingStatus == isUpdatingStatus) &&
            (identical(other.isCheckingIn, isCheckingIn) ||
                other.isCheckingIn == isCheckingIn) &&
            (identical(other.isLoadingStats, isLoadingStats) ||
                other.isLoadingStats == isLoadingStats) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality()
                .equals(other._attendees, _attendees) &&
            (identical(other.selectedAttendee, selectedAttendee) ||
                other.selectedAttendee == selectedAttendee) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.isSearchResult, isSearchResult) ||
                other.isSearchResult == isSearchResult) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isLoadingAttendee,
      isUpdatingStatus,
      isCheckingIn,
      isLoadingStats,
      hasError,
      errorMessage,
      const DeepCollectionEquality().hash(_attendees),
      selectedAttendee,
      stats,
      isSearchResult,
      searchQuery,
      filterStatus,
      nextCursor,
      hasMoreData);

  /// Create a copy of AttendeeManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendeeManagementStateImplCopyWith<_$AttendeeManagementStateImpl>
      get copyWith => __$$AttendeeManagementStateImplCopyWithImpl<
          _$AttendeeManagementStateImpl>(this, _$identity);
}

abstract class _AttendeeManagementState implements AttendeeManagementState {
  const factory _AttendeeManagementState(
      {final bool isLoading,
      final bool isLoadingAttendee,
      final bool isUpdatingStatus,
      final bool isCheckingIn,
      final bool isLoadingStats,
      final bool hasError,
      final String errorMessage,
      final List<AttendeeEntity> attendees,
      final AttendeeEntity? selectedAttendee,
      final AttendeeStats? stats,
      final bool isSearchResult,
      final String? searchQuery,
      final AttendeeStatus? filterStatus,
      final String? nextCursor,
      final bool hasMoreData}) = _$AttendeeManagementStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isLoadingAttendee;
  @override
  bool get isUpdatingStatus;
  @override
  bool get isCheckingIn;
  @override
  bool get isLoadingStats;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  List<AttendeeEntity> get attendees;
  @override
  AttendeeEntity? get selectedAttendee;
  @override
  AttendeeStats? get stats;
  @override
  bool get isSearchResult;
  @override
  String? get searchQuery;
  @override
  AttendeeStatus? get filterStatus;
  @override
  String? get nextCursor;
  @override
  bool get hasMoreData;

  /// Create a copy of AttendeeManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendeeManagementStateImplCopyWith<_$AttendeeManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
