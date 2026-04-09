// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_event_assignment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StaffEventAssignmentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String staffId) loadStaffEvents,
    required TResult Function(String eventId) selectEvent,
    required TResult Function(String staffId, String eventId) checkEventAccess,
    required TResult Function(String staffId, String eventId)
        createTestAssignment,
    required TResult Function(String staffId) refreshAssignments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String staffId)? loadStaffEvents,
    TResult? Function(String eventId)? selectEvent,
    TResult? Function(String staffId, String eventId)? checkEventAccess,
    TResult? Function(String staffId, String eventId)? createTestAssignment,
    TResult? Function(String staffId)? refreshAssignments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String staffId)? loadStaffEvents,
    TResult Function(String eventId)? selectEvent,
    TResult Function(String staffId, String eventId)? checkEventAccess,
    TResult Function(String staffId, String eventId)? createTestAssignment,
    TResult Function(String staffId)? refreshAssignments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStaffEvents value) loadStaffEvents,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_CheckEventAccess value) checkEventAccess,
    required TResult Function(_CreateTestAssignment value) createTestAssignment,
    required TResult Function(_RefreshAssignments value) refreshAssignments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult? Function(_SelectEvent value)? selectEvent,
    TResult? Function(_CheckEventAccess value)? checkEventAccess,
    TResult? Function(_CreateTestAssignment value)? createTestAssignment,
    TResult? Function(_RefreshAssignments value)? refreshAssignments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_CheckEventAccess value)? checkEventAccess,
    TResult Function(_CreateTestAssignment value)? createTestAssignment,
    TResult Function(_RefreshAssignments value)? refreshAssignments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffEventAssignmentEventCopyWith<$Res> {
  factory $StaffEventAssignmentEventCopyWith(StaffEventAssignmentEvent value,
          $Res Function(StaffEventAssignmentEvent) then) =
      _$StaffEventAssignmentEventCopyWithImpl<$Res, StaffEventAssignmentEvent>;
}

/// @nodoc
class _$StaffEventAssignmentEventCopyWithImpl<$Res,
        $Val extends StaffEventAssignmentEvent>
    implements $StaffEventAssignmentEventCopyWith<$Res> {
  _$StaffEventAssignmentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadStaffEventsImplCopyWith<$Res> {
  factory _$$LoadStaffEventsImplCopyWith(_$LoadStaffEventsImpl value,
          $Res Function(_$LoadStaffEventsImpl) then) =
      __$$LoadStaffEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId});
}

/// @nodoc
class __$$LoadStaffEventsImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentEventCopyWithImpl<$Res, _$LoadStaffEventsImpl>
    implements _$$LoadStaffEventsImplCopyWith<$Res> {
  __$$LoadStaffEventsImplCopyWithImpl(
      _$LoadStaffEventsImpl _value, $Res Function(_$LoadStaffEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
  }) {
    return _then(_$LoadStaffEventsImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadStaffEventsImpl implements _LoadStaffEvents {
  const _$LoadStaffEventsImpl({required this.staffId});

  @override
  final String staffId;

  @override
  String toString() {
    return 'StaffEventAssignmentEvent.loadStaffEvents(staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadStaffEventsImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadStaffEventsImplCopyWith<_$LoadStaffEventsImpl> get copyWith =>
      __$$LoadStaffEventsImplCopyWithImpl<_$LoadStaffEventsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String staffId) loadStaffEvents,
    required TResult Function(String eventId) selectEvent,
    required TResult Function(String staffId, String eventId) checkEventAccess,
    required TResult Function(String staffId, String eventId)
        createTestAssignment,
    required TResult Function(String staffId) refreshAssignments,
  }) {
    return loadStaffEvents(staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String staffId)? loadStaffEvents,
    TResult? Function(String eventId)? selectEvent,
    TResult? Function(String staffId, String eventId)? checkEventAccess,
    TResult? Function(String staffId, String eventId)? createTestAssignment,
    TResult? Function(String staffId)? refreshAssignments,
  }) {
    return loadStaffEvents?.call(staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String staffId)? loadStaffEvents,
    TResult Function(String eventId)? selectEvent,
    TResult Function(String staffId, String eventId)? checkEventAccess,
    TResult Function(String staffId, String eventId)? createTestAssignment,
    TResult Function(String staffId)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (loadStaffEvents != null) {
      return loadStaffEvents(staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStaffEvents value) loadStaffEvents,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_CheckEventAccess value) checkEventAccess,
    required TResult Function(_CreateTestAssignment value) createTestAssignment,
    required TResult Function(_RefreshAssignments value) refreshAssignments,
  }) {
    return loadStaffEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult? Function(_SelectEvent value)? selectEvent,
    TResult? Function(_CheckEventAccess value)? checkEventAccess,
    TResult? Function(_CreateTestAssignment value)? createTestAssignment,
    TResult? Function(_RefreshAssignments value)? refreshAssignments,
  }) {
    return loadStaffEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_CheckEventAccess value)? checkEventAccess,
    TResult Function(_CreateTestAssignment value)? createTestAssignment,
    TResult Function(_RefreshAssignments value)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (loadStaffEvents != null) {
      return loadStaffEvents(this);
    }
    return orElse();
  }
}

abstract class _LoadStaffEvents implements StaffEventAssignmentEvent {
  const factory _LoadStaffEvents({required final String staffId}) =
      _$LoadStaffEventsImpl;

  String get staffId;

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadStaffEventsImplCopyWith<_$LoadStaffEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectEventImplCopyWith<$Res> {
  factory _$$SelectEventImplCopyWith(
          _$SelectEventImpl value, $Res Function(_$SelectEventImpl) then) =
      __$$SelectEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class __$$SelectEventImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentEventCopyWithImpl<$Res, _$SelectEventImpl>
    implements _$$SelectEventImplCopyWith<$Res> {
  __$$SelectEventImplCopyWithImpl(
      _$SelectEventImpl _value, $Res Function(_$SelectEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$SelectEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectEventImpl implements _SelectEvent {
  const _$SelectEventImpl({required this.eventId});

  @override
  final String eventId;

  @override
  String toString() {
    return 'StaffEventAssignmentEvent.selectEvent(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectEventImplCopyWith<_$SelectEventImpl> get copyWith =>
      __$$SelectEventImplCopyWithImpl<_$SelectEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String staffId) loadStaffEvents,
    required TResult Function(String eventId) selectEvent,
    required TResult Function(String staffId, String eventId) checkEventAccess,
    required TResult Function(String staffId, String eventId)
        createTestAssignment,
    required TResult Function(String staffId) refreshAssignments,
  }) {
    return selectEvent(eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String staffId)? loadStaffEvents,
    TResult? Function(String eventId)? selectEvent,
    TResult? Function(String staffId, String eventId)? checkEventAccess,
    TResult? Function(String staffId, String eventId)? createTestAssignment,
    TResult? Function(String staffId)? refreshAssignments,
  }) {
    return selectEvent?.call(eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String staffId)? loadStaffEvents,
    TResult Function(String eventId)? selectEvent,
    TResult Function(String staffId, String eventId)? checkEventAccess,
    TResult Function(String staffId, String eventId)? createTestAssignment,
    TResult Function(String staffId)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (selectEvent != null) {
      return selectEvent(eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStaffEvents value) loadStaffEvents,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_CheckEventAccess value) checkEventAccess,
    required TResult Function(_CreateTestAssignment value) createTestAssignment,
    required TResult Function(_RefreshAssignments value) refreshAssignments,
  }) {
    return selectEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult? Function(_SelectEvent value)? selectEvent,
    TResult? Function(_CheckEventAccess value)? checkEventAccess,
    TResult? Function(_CreateTestAssignment value)? createTestAssignment,
    TResult? Function(_RefreshAssignments value)? refreshAssignments,
  }) {
    return selectEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_CheckEventAccess value)? checkEventAccess,
    TResult Function(_CreateTestAssignment value)? createTestAssignment,
    TResult Function(_RefreshAssignments value)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (selectEvent != null) {
      return selectEvent(this);
    }
    return orElse();
  }
}

abstract class _SelectEvent implements StaffEventAssignmentEvent {
  const factory _SelectEvent({required final String eventId}) =
      _$SelectEventImpl;

  String get eventId;

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectEventImplCopyWith<_$SelectEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckEventAccessImplCopyWith<$Res> {
  factory _$$CheckEventAccessImplCopyWith(_$CheckEventAccessImpl value,
          $Res Function(_$CheckEventAccessImpl) then) =
      __$$CheckEventAccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId, String eventId});
}

/// @nodoc
class __$$CheckEventAccessImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentEventCopyWithImpl<$Res,
        _$CheckEventAccessImpl>
    implements _$$CheckEventAccessImplCopyWith<$Res> {
  __$$CheckEventAccessImplCopyWithImpl(_$CheckEventAccessImpl _value,
      $Res Function(_$CheckEventAccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? eventId = null,
  }) {
    return _then(_$CheckEventAccessImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckEventAccessImpl implements _CheckEventAccess {
  const _$CheckEventAccessImpl({required this.staffId, required this.eventId});

  @override
  final String staffId;
  @override
  final String eventId;

  @override
  String toString() {
    return 'StaffEventAssignmentEvent.checkEventAccess(staffId: $staffId, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckEventAccessImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, eventId);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckEventAccessImplCopyWith<_$CheckEventAccessImpl> get copyWith =>
      __$$CheckEventAccessImplCopyWithImpl<_$CheckEventAccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String staffId) loadStaffEvents,
    required TResult Function(String eventId) selectEvent,
    required TResult Function(String staffId, String eventId) checkEventAccess,
    required TResult Function(String staffId, String eventId)
        createTestAssignment,
    required TResult Function(String staffId) refreshAssignments,
  }) {
    return checkEventAccess(staffId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String staffId)? loadStaffEvents,
    TResult? Function(String eventId)? selectEvent,
    TResult? Function(String staffId, String eventId)? checkEventAccess,
    TResult? Function(String staffId, String eventId)? createTestAssignment,
    TResult? Function(String staffId)? refreshAssignments,
  }) {
    return checkEventAccess?.call(staffId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String staffId)? loadStaffEvents,
    TResult Function(String eventId)? selectEvent,
    TResult Function(String staffId, String eventId)? checkEventAccess,
    TResult Function(String staffId, String eventId)? createTestAssignment,
    TResult Function(String staffId)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (checkEventAccess != null) {
      return checkEventAccess(staffId, eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStaffEvents value) loadStaffEvents,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_CheckEventAccess value) checkEventAccess,
    required TResult Function(_CreateTestAssignment value) createTestAssignment,
    required TResult Function(_RefreshAssignments value) refreshAssignments,
  }) {
    return checkEventAccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult? Function(_SelectEvent value)? selectEvent,
    TResult? Function(_CheckEventAccess value)? checkEventAccess,
    TResult? Function(_CreateTestAssignment value)? createTestAssignment,
    TResult? Function(_RefreshAssignments value)? refreshAssignments,
  }) {
    return checkEventAccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_CheckEventAccess value)? checkEventAccess,
    TResult Function(_CreateTestAssignment value)? createTestAssignment,
    TResult Function(_RefreshAssignments value)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (checkEventAccess != null) {
      return checkEventAccess(this);
    }
    return orElse();
  }
}

abstract class _CheckEventAccess implements StaffEventAssignmentEvent {
  const factory _CheckEventAccess(
      {required final String staffId,
      required final String eventId}) = _$CheckEventAccessImpl;

  String get staffId;
  String get eventId;

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckEventAccessImplCopyWith<_$CheckEventAccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTestAssignmentImplCopyWith<$Res> {
  factory _$$CreateTestAssignmentImplCopyWith(_$CreateTestAssignmentImpl value,
          $Res Function(_$CreateTestAssignmentImpl) then) =
      __$$CreateTestAssignmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId, String eventId});
}

/// @nodoc
class __$$CreateTestAssignmentImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentEventCopyWithImpl<$Res,
        _$CreateTestAssignmentImpl>
    implements _$$CreateTestAssignmentImplCopyWith<$Res> {
  __$$CreateTestAssignmentImplCopyWithImpl(_$CreateTestAssignmentImpl _value,
      $Res Function(_$CreateTestAssignmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? eventId = null,
  }) {
    return _then(_$CreateTestAssignmentImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateTestAssignmentImpl implements _CreateTestAssignment {
  const _$CreateTestAssignmentImpl(
      {required this.staffId, required this.eventId});

  @override
  final String staffId;
  @override
  final String eventId;

  @override
  String toString() {
    return 'StaffEventAssignmentEvent.createTestAssignment(staffId: $staffId, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTestAssignmentImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, eventId);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTestAssignmentImplCopyWith<_$CreateTestAssignmentImpl>
      get copyWith =>
          __$$CreateTestAssignmentImplCopyWithImpl<_$CreateTestAssignmentImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String staffId) loadStaffEvents,
    required TResult Function(String eventId) selectEvent,
    required TResult Function(String staffId, String eventId) checkEventAccess,
    required TResult Function(String staffId, String eventId)
        createTestAssignment,
    required TResult Function(String staffId) refreshAssignments,
  }) {
    return createTestAssignment(staffId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String staffId)? loadStaffEvents,
    TResult? Function(String eventId)? selectEvent,
    TResult? Function(String staffId, String eventId)? checkEventAccess,
    TResult? Function(String staffId, String eventId)? createTestAssignment,
    TResult? Function(String staffId)? refreshAssignments,
  }) {
    return createTestAssignment?.call(staffId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String staffId)? loadStaffEvents,
    TResult Function(String eventId)? selectEvent,
    TResult Function(String staffId, String eventId)? checkEventAccess,
    TResult Function(String staffId, String eventId)? createTestAssignment,
    TResult Function(String staffId)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (createTestAssignment != null) {
      return createTestAssignment(staffId, eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStaffEvents value) loadStaffEvents,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_CheckEventAccess value) checkEventAccess,
    required TResult Function(_CreateTestAssignment value) createTestAssignment,
    required TResult Function(_RefreshAssignments value) refreshAssignments,
  }) {
    return createTestAssignment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult? Function(_SelectEvent value)? selectEvent,
    TResult? Function(_CheckEventAccess value)? checkEventAccess,
    TResult? Function(_CreateTestAssignment value)? createTestAssignment,
    TResult? Function(_RefreshAssignments value)? refreshAssignments,
  }) {
    return createTestAssignment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_CheckEventAccess value)? checkEventAccess,
    TResult Function(_CreateTestAssignment value)? createTestAssignment,
    TResult Function(_RefreshAssignments value)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (createTestAssignment != null) {
      return createTestAssignment(this);
    }
    return orElse();
  }
}

abstract class _CreateTestAssignment implements StaffEventAssignmentEvent {
  const factory _CreateTestAssignment(
      {required final String staffId,
      required final String eventId}) = _$CreateTestAssignmentImpl;

  String get staffId;
  String get eventId;

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTestAssignmentImplCopyWith<_$CreateTestAssignmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshAssignmentsImplCopyWith<$Res> {
  factory _$$RefreshAssignmentsImplCopyWith(_$RefreshAssignmentsImpl value,
          $Res Function(_$RefreshAssignmentsImpl) then) =
      __$$RefreshAssignmentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId});
}

/// @nodoc
class __$$RefreshAssignmentsImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentEventCopyWithImpl<$Res,
        _$RefreshAssignmentsImpl>
    implements _$$RefreshAssignmentsImplCopyWith<$Res> {
  __$$RefreshAssignmentsImplCopyWithImpl(_$RefreshAssignmentsImpl _value,
      $Res Function(_$RefreshAssignmentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
  }) {
    return _then(_$RefreshAssignmentsImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshAssignmentsImpl implements _RefreshAssignments {
  const _$RefreshAssignmentsImpl({required this.staffId});

  @override
  final String staffId;

  @override
  String toString() {
    return 'StaffEventAssignmentEvent.refreshAssignments(staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshAssignmentsImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId);

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshAssignmentsImplCopyWith<_$RefreshAssignmentsImpl> get copyWith =>
      __$$RefreshAssignmentsImplCopyWithImpl<_$RefreshAssignmentsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String staffId) loadStaffEvents,
    required TResult Function(String eventId) selectEvent,
    required TResult Function(String staffId, String eventId) checkEventAccess,
    required TResult Function(String staffId, String eventId)
        createTestAssignment,
    required TResult Function(String staffId) refreshAssignments,
  }) {
    return refreshAssignments(staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String staffId)? loadStaffEvents,
    TResult? Function(String eventId)? selectEvent,
    TResult? Function(String staffId, String eventId)? checkEventAccess,
    TResult? Function(String staffId, String eventId)? createTestAssignment,
    TResult? Function(String staffId)? refreshAssignments,
  }) {
    return refreshAssignments?.call(staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String staffId)? loadStaffEvents,
    TResult Function(String eventId)? selectEvent,
    TResult Function(String staffId, String eventId)? checkEventAccess,
    TResult Function(String staffId, String eventId)? createTestAssignment,
    TResult Function(String staffId)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (refreshAssignments != null) {
      return refreshAssignments(staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStaffEvents value) loadStaffEvents,
    required TResult Function(_SelectEvent value) selectEvent,
    required TResult Function(_CheckEventAccess value) checkEventAccess,
    required TResult Function(_CreateTestAssignment value) createTestAssignment,
    required TResult Function(_RefreshAssignments value) refreshAssignments,
  }) {
    return refreshAssignments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult? Function(_SelectEvent value)? selectEvent,
    TResult? Function(_CheckEventAccess value)? checkEventAccess,
    TResult? Function(_CreateTestAssignment value)? createTestAssignment,
    TResult? Function(_RefreshAssignments value)? refreshAssignments,
  }) {
    return refreshAssignments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStaffEvents value)? loadStaffEvents,
    TResult Function(_SelectEvent value)? selectEvent,
    TResult Function(_CheckEventAccess value)? checkEventAccess,
    TResult Function(_CreateTestAssignment value)? createTestAssignment,
    TResult Function(_RefreshAssignments value)? refreshAssignments,
    required TResult orElse(),
  }) {
    if (refreshAssignments != null) {
      return refreshAssignments(this);
    }
    return orElse();
  }
}

abstract class _RefreshAssignments implements StaffEventAssignmentEvent {
  const factory _RefreshAssignments({required final String staffId}) =
      _$RefreshAssignmentsImpl;

  String get staffId;

  /// Create a copy of StaffEventAssignmentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshAssignmentsImplCopyWith<_$RefreshAssignmentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StaffEventAssignmentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        eventsLoaded,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)
        eventSelected,
    required TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)
        accessGranted,
    required TResult Function(String message) accessDenied,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        assignmentsRefreshed,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult? Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult? Function(String message)? accessDenied,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult Function(String message)? accessDenied,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EventsLoaded value) eventsLoaded,
    required TResult Function(_EventSelected value) eventSelected,
    required TResult Function(_AccessGranted value) accessGranted,
    required TResult Function(_AccessDenied value) accessDenied,
    required TResult Function(_AssignmentsRefreshed value) assignmentsRefreshed,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EventsLoaded value)? eventsLoaded,
    TResult? Function(_EventSelected value)? eventSelected,
    TResult? Function(_AccessGranted value)? accessGranted,
    TResult? Function(_AccessDenied value)? accessDenied,
    TResult? Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EventsLoaded value)? eventsLoaded,
    TResult Function(_EventSelected value)? eventSelected,
    TResult Function(_AccessGranted value)? accessGranted,
    TResult Function(_AccessDenied value)? accessDenied,
    TResult Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffEventAssignmentStateCopyWith<$Res> {
  factory $StaffEventAssignmentStateCopyWith(StaffEventAssignmentState value,
          $Res Function(StaffEventAssignmentState) then) =
      _$StaffEventAssignmentStateCopyWithImpl<$Res, StaffEventAssignmentState>;
}

/// @nodoc
class _$StaffEventAssignmentStateCopyWithImpl<$Res,
        $Val extends StaffEventAssignmentState>
    implements $StaffEventAssignmentStateCopyWith<$Res> {
  _$StaffEventAssignmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'StaffEventAssignmentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        eventsLoaded,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)
        eventSelected,
    required TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)
        accessGranted,
    required TResult Function(String message) accessDenied,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        assignmentsRefreshed,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult? Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult? Function(String message)? accessDenied,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult Function(String message)? accessDenied,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EventsLoaded value) eventsLoaded,
    required TResult Function(_EventSelected value) eventSelected,
    required TResult Function(_AccessGranted value) accessGranted,
    required TResult Function(_AccessDenied value) accessDenied,
    required TResult Function(_AssignmentsRefreshed value) assignmentsRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EventsLoaded value)? eventsLoaded,
    TResult? Function(_EventSelected value)? eventSelected,
    TResult? Function(_AccessGranted value)? accessGranted,
    TResult? Function(_AccessDenied value)? accessDenied,
    TResult? Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EventsLoaded value)? eventsLoaded,
    TResult Function(_EventSelected value)? eventSelected,
    TResult Function(_AccessGranted value)? accessGranted,
    TResult Function(_AccessDenied value)? accessDenied,
    TResult Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements StaffEventAssignmentState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'StaffEventAssignmentState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        eventsLoaded,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)
        eventSelected,
    required TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)
        accessGranted,
    required TResult Function(String message) accessDenied,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        assignmentsRefreshed,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult? Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult? Function(String message)? accessDenied,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult Function(String message)? accessDenied,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EventsLoaded value) eventsLoaded,
    required TResult Function(_EventSelected value) eventSelected,
    required TResult Function(_AccessGranted value) accessGranted,
    required TResult Function(_AccessDenied value) accessDenied,
    required TResult Function(_AssignmentsRefreshed value) assignmentsRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EventsLoaded value)? eventsLoaded,
    TResult? Function(_EventSelected value)? eventSelected,
    TResult? Function(_AccessGranted value)? accessGranted,
    TResult? Function(_AccessDenied value)? accessDenied,
    TResult? Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EventsLoaded value)? eventsLoaded,
    TResult Function(_EventSelected value)? eventSelected,
    TResult Function(_AccessGranted value)? accessGranted,
    TResult Function(_AccessDenied value)? accessDenied,
    TResult Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements StaffEventAssignmentState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$EventsLoadedImplCopyWith<$Res> {
  factory _$$EventsLoadedImplCopyWith(
          _$EventsLoadedImpl value, $Res Function(_$EventsLoadedImpl) then) =
      __$$EventsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<StaffEventAssignmentEntity> events,
      StaffEventAssignmentEntity? selectedEvent});

  $StaffEventAssignmentEntityCopyWith<$Res>? get selectedEvent;
}

/// @nodoc
class __$$EventsLoadedImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentStateCopyWithImpl<$Res, _$EventsLoadedImpl>
    implements _$$EventsLoadedImplCopyWith<$Res> {
  __$$EventsLoadedImplCopyWithImpl(
      _$EventsLoadedImpl _value, $Res Function(_$EventsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? selectedEvent = freezed,
  }) {
    return _then(_$EventsLoadedImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<StaffEventAssignmentEntity>,
      selectedEvent: freezed == selectedEvent
          ? _value.selectedEvent
          : selectedEvent // ignore: cast_nullable_to_non_nullable
              as StaffEventAssignmentEntity?,
    ));
  }

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffEventAssignmentEntityCopyWith<$Res>? get selectedEvent {
    if (_value.selectedEvent == null) {
      return null;
    }

    return $StaffEventAssignmentEntityCopyWith<$Res>(_value.selectedEvent!,
        (value) {
      return _then(_value.copyWith(selectedEvent: value));
    });
  }
}

/// @nodoc

class _$EventsLoadedImpl implements _EventsLoaded {
  const _$EventsLoadedImpl(
      {required final List<StaffEventAssignmentEntity> events,
      this.selectedEvent})
      : _events = events;

  final List<StaffEventAssignmentEntity> _events;
  @override
  List<StaffEventAssignmentEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final StaffEventAssignmentEntity? selectedEvent;

  @override
  String toString() {
    return 'StaffEventAssignmentState.eventsLoaded(events: $events, selectedEvent: $selectedEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsLoadedImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.selectedEvent, selectedEvent) ||
                other.selectedEvent == selectedEvent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_events), selectedEvent);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsLoadedImplCopyWith<_$EventsLoadedImpl> get copyWith =>
      __$$EventsLoadedImplCopyWithImpl<_$EventsLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        eventsLoaded,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)
        eventSelected,
    required TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)
        accessGranted,
    required TResult Function(String message) accessDenied,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        assignmentsRefreshed,
    required TResult Function(String message) error,
  }) {
    return eventsLoaded(events, selectedEvent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult? Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult? Function(String message)? accessDenied,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult? Function(String message)? error,
  }) {
    return eventsLoaded?.call(events, selectedEvent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult Function(String message)? accessDenied,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (eventsLoaded != null) {
      return eventsLoaded(events, selectedEvent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EventsLoaded value) eventsLoaded,
    required TResult Function(_EventSelected value) eventSelected,
    required TResult Function(_AccessGranted value) accessGranted,
    required TResult Function(_AccessDenied value) accessDenied,
    required TResult Function(_AssignmentsRefreshed value) assignmentsRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return eventsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EventsLoaded value)? eventsLoaded,
    TResult? Function(_EventSelected value)? eventSelected,
    TResult? Function(_AccessGranted value)? accessGranted,
    TResult? Function(_AccessDenied value)? accessDenied,
    TResult? Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return eventsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EventsLoaded value)? eventsLoaded,
    TResult Function(_EventSelected value)? eventSelected,
    TResult Function(_AccessGranted value)? accessGranted,
    TResult Function(_AccessDenied value)? accessDenied,
    TResult Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (eventsLoaded != null) {
      return eventsLoaded(this);
    }
    return orElse();
  }
}

abstract class _EventsLoaded implements StaffEventAssignmentState {
  const factory _EventsLoaded(
      {required final List<StaffEventAssignmentEntity> events,
      final StaffEventAssignmentEntity? selectedEvent}) = _$EventsLoadedImpl;

  List<StaffEventAssignmentEntity> get events;
  StaffEventAssignmentEntity? get selectedEvent;

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsLoadedImplCopyWith<_$EventsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventSelectedImplCopyWith<$Res> {
  factory _$$EventSelectedImplCopyWith(
          _$EventSelectedImpl value, $Res Function(_$EventSelectedImpl) then) =
      __$$EventSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<StaffEventAssignmentEntity> events,
      StaffEventAssignmentEntity selectedEvent});

  $StaffEventAssignmentEntityCopyWith<$Res> get selectedEvent;
}

/// @nodoc
class __$$EventSelectedImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentStateCopyWithImpl<$Res, _$EventSelectedImpl>
    implements _$$EventSelectedImplCopyWith<$Res> {
  __$$EventSelectedImplCopyWithImpl(
      _$EventSelectedImpl _value, $Res Function(_$EventSelectedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? selectedEvent = null,
  }) {
    return _then(_$EventSelectedImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<StaffEventAssignmentEntity>,
      selectedEvent: null == selectedEvent
          ? _value.selectedEvent
          : selectedEvent // ignore: cast_nullable_to_non_nullable
              as StaffEventAssignmentEntity,
    ));
  }

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffEventAssignmentEntityCopyWith<$Res> get selectedEvent {
    return $StaffEventAssignmentEntityCopyWith<$Res>(_value.selectedEvent,
        (value) {
      return _then(_value.copyWith(selectedEvent: value));
    });
  }
}

/// @nodoc

class _$EventSelectedImpl implements _EventSelected {
  const _$EventSelectedImpl(
      {required final List<StaffEventAssignmentEntity> events,
      required this.selectedEvent})
      : _events = events;

  final List<StaffEventAssignmentEntity> _events;
  @override
  List<StaffEventAssignmentEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final StaffEventAssignmentEntity selectedEvent;

  @override
  String toString() {
    return 'StaffEventAssignmentState.eventSelected(events: $events, selectedEvent: $selectedEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventSelectedImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.selectedEvent, selectedEvent) ||
                other.selectedEvent == selectedEvent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_events), selectedEvent);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventSelectedImplCopyWith<_$EventSelectedImpl> get copyWith =>
      __$$EventSelectedImplCopyWithImpl<_$EventSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        eventsLoaded,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)
        eventSelected,
    required TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)
        accessGranted,
    required TResult Function(String message) accessDenied,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        assignmentsRefreshed,
    required TResult Function(String message) error,
  }) {
    return eventSelected(events, selectedEvent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult? Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult? Function(String message)? accessDenied,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult? Function(String message)? error,
  }) {
    return eventSelected?.call(events, selectedEvent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult Function(String message)? accessDenied,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (eventSelected != null) {
      return eventSelected(events, selectedEvent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EventsLoaded value) eventsLoaded,
    required TResult Function(_EventSelected value) eventSelected,
    required TResult Function(_AccessGranted value) accessGranted,
    required TResult Function(_AccessDenied value) accessDenied,
    required TResult Function(_AssignmentsRefreshed value) assignmentsRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return eventSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EventsLoaded value)? eventsLoaded,
    TResult? Function(_EventSelected value)? eventSelected,
    TResult? Function(_AccessGranted value)? accessGranted,
    TResult? Function(_AccessDenied value)? accessDenied,
    TResult? Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return eventSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EventsLoaded value)? eventsLoaded,
    TResult Function(_EventSelected value)? eventSelected,
    TResult Function(_AccessGranted value)? accessGranted,
    TResult Function(_AccessDenied value)? accessDenied,
    TResult Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (eventSelected != null) {
      return eventSelected(this);
    }
    return orElse();
  }
}

abstract class _EventSelected implements StaffEventAssignmentState {
  const factory _EventSelected(
          {required final List<StaffEventAssignmentEntity> events,
          required final StaffEventAssignmentEntity selectedEvent}) =
      _$EventSelectedImpl;

  List<StaffEventAssignmentEntity> get events;
  StaffEventAssignmentEntity get selectedEvent;

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventSelectedImplCopyWith<_$EventSelectedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccessGrantedImplCopyWith<$Res> {
  factory _$$AccessGrantedImplCopyWith(
          _$AccessGrantedImpl value, $Res Function(_$AccessGrantedImpl) then) =
      __$$AccessGrantedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<StaffEventAssignmentEntity> events,
      StaffEventAssignmentEntity selectedEvent,
      List<StaffPermission> permissions});

  $StaffEventAssignmentEntityCopyWith<$Res> get selectedEvent;
}

/// @nodoc
class __$$AccessGrantedImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentStateCopyWithImpl<$Res, _$AccessGrantedImpl>
    implements _$$AccessGrantedImplCopyWith<$Res> {
  __$$AccessGrantedImplCopyWithImpl(
      _$AccessGrantedImpl _value, $Res Function(_$AccessGrantedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? selectedEvent = null,
    Object? permissions = null,
  }) {
    return _then(_$AccessGrantedImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<StaffEventAssignmentEntity>,
      selectedEvent: null == selectedEvent
          ? _value.selectedEvent
          : selectedEvent // ignore: cast_nullable_to_non_nullable
              as StaffEventAssignmentEntity,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<StaffPermission>,
    ));
  }

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffEventAssignmentEntityCopyWith<$Res> get selectedEvent {
    return $StaffEventAssignmentEntityCopyWith<$Res>(_value.selectedEvent,
        (value) {
      return _then(_value.copyWith(selectedEvent: value));
    });
  }
}

/// @nodoc

class _$AccessGrantedImpl implements _AccessGranted {
  const _$AccessGrantedImpl(
      {required final List<StaffEventAssignmentEntity> events,
      required this.selectedEvent,
      required final List<StaffPermission> permissions})
      : _events = events,
        _permissions = permissions;

  final List<StaffEventAssignmentEntity> _events;
  @override
  List<StaffEventAssignmentEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final StaffEventAssignmentEntity selectedEvent;
  final List<StaffPermission> _permissions;
  @override
  List<StaffPermission> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString() {
    return 'StaffEventAssignmentState.accessGranted(events: $events, selectedEvent: $selectedEvent, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessGrantedImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.selectedEvent, selectedEvent) ||
                other.selectedEvent == selectedEvent) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      selectedEvent,
      const DeepCollectionEquality().hash(_permissions));

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessGrantedImplCopyWith<_$AccessGrantedImpl> get copyWith =>
      __$$AccessGrantedImplCopyWithImpl<_$AccessGrantedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        eventsLoaded,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)
        eventSelected,
    required TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)
        accessGranted,
    required TResult Function(String message) accessDenied,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        assignmentsRefreshed,
    required TResult Function(String message) error,
  }) {
    return accessGranted(events, selectedEvent, permissions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult? Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult? Function(String message)? accessDenied,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult? Function(String message)? error,
  }) {
    return accessGranted?.call(events, selectedEvent, permissions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult Function(String message)? accessDenied,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (accessGranted != null) {
      return accessGranted(events, selectedEvent, permissions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EventsLoaded value) eventsLoaded,
    required TResult Function(_EventSelected value) eventSelected,
    required TResult Function(_AccessGranted value) accessGranted,
    required TResult Function(_AccessDenied value) accessDenied,
    required TResult Function(_AssignmentsRefreshed value) assignmentsRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return accessGranted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EventsLoaded value)? eventsLoaded,
    TResult? Function(_EventSelected value)? eventSelected,
    TResult? Function(_AccessGranted value)? accessGranted,
    TResult? Function(_AccessDenied value)? accessDenied,
    TResult? Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return accessGranted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EventsLoaded value)? eventsLoaded,
    TResult Function(_EventSelected value)? eventSelected,
    TResult Function(_AccessGranted value)? accessGranted,
    TResult Function(_AccessDenied value)? accessDenied,
    TResult Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (accessGranted != null) {
      return accessGranted(this);
    }
    return orElse();
  }
}

abstract class _AccessGranted implements StaffEventAssignmentState {
  const factory _AccessGranted(
      {required final List<StaffEventAssignmentEntity> events,
      required final StaffEventAssignmentEntity selectedEvent,
      required final List<StaffPermission> permissions}) = _$AccessGrantedImpl;

  List<StaffEventAssignmentEntity> get events;
  StaffEventAssignmentEntity get selectedEvent;
  List<StaffPermission> get permissions;

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessGrantedImplCopyWith<_$AccessGrantedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccessDeniedImplCopyWith<$Res> {
  factory _$$AccessDeniedImplCopyWith(
          _$AccessDeniedImpl value, $Res Function(_$AccessDeniedImpl) then) =
      __$$AccessDeniedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AccessDeniedImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentStateCopyWithImpl<$Res, _$AccessDeniedImpl>
    implements _$$AccessDeniedImplCopyWith<$Res> {
  __$$AccessDeniedImplCopyWithImpl(
      _$AccessDeniedImpl _value, $Res Function(_$AccessDeniedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AccessDeniedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AccessDeniedImpl implements _AccessDenied {
  const _$AccessDeniedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'StaffEventAssignmentState.accessDenied(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessDeniedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessDeniedImplCopyWith<_$AccessDeniedImpl> get copyWith =>
      __$$AccessDeniedImplCopyWithImpl<_$AccessDeniedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        eventsLoaded,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)
        eventSelected,
    required TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)
        accessGranted,
    required TResult Function(String message) accessDenied,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        assignmentsRefreshed,
    required TResult Function(String message) error,
  }) {
    return accessDenied(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult? Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult? Function(String message)? accessDenied,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult? Function(String message)? error,
  }) {
    return accessDenied?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult Function(String message)? accessDenied,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (accessDenied != null) {
      return accessDenied(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EventsLoaded value) eventsLoaded,
    required TResult Function(_EventSelected value) eventSelected,
    required TResult Function(_AccessGranted value) accessGranted,
    required TResult Function(_AccessDenied value) accessDenied,
    required TResult Function(_AssignmentsRefreshed value) assignmentsRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return accessDenied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EventsLoaded value)? eventsLoaded,
    TResult? Function(_EventSelected value)? eventSelected,
    TResult? Function(_AccessGranted value)? accessGranted,
    TResult? Function(_AccessDenied value)? accessDenied,
    TResult? Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return accessDenied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EventsLoaded value)? eventsLoaded,
    TResult Function(_EventSelected value)? eventSelected,
    TResult Function(_AccessGranted value)? accessGranted,
    TResult Function(_AccessDenied value)? accessDenied,
    TResult Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (accessDenied != null) {
      return accessDenied(this);
    }
    return orElse();
  }
}

abstract class _AccessDenied implements StaffEventAssignmentState {
  const factory _AccessDenied({required final String message}) =
      _$AccessDeniedImpl;

  String get message;

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessDeniedImplCopyWith<_$AccessDeniedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssignmentsRefreshedImplCopyWith<$Res> {
  factory _$$AssignmentsRefreshedImplCopyWith(_$AssignmentsRefreshedImpl value,
          $Res Function(_$AssignmentsRefreshedImpl) then) =
      __$$AssignmentsRefreshedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<StaffEventAssignmentEntity> events,
      StaffEventAssignmentEntity? selectedEvent});

  $StaffEventAssignmentEntityCopyWith<$Res>? get selectedEvent;
}

/// @nodoc
class __$$AssignmentsRefreshedImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentStateCopyWithImpl<$Res,
        _$AssignmentsRefreshedImpl>
    implements _$$AssignmentsRefreshedImplCopyWith<$Res> {
  __$$AssignmentsRefreshedImplCopyWithImpl(_$AssignmentsRefreshedImpl _value,
      $Res Function(_$AssignmentsRefreshedImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? selectedEvent = freezed,
  }) {
    return _then(_$AssignmentsRefreshedImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<StaffEventAssignmentEntity>,
      selectedEvent: freezed == selectedEvent
          ? _value.selectedEvent
          : selectedEvent // ignore: cast_nullable_to_non_nullable
              as StaffEventAssignmentEntity?,
    ));
  }

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffEventAssignmentEntityCopyWith<$Res>? get selectedEvent {
    if (_value.selectedEvent == null) {
      return null;
    }

    return $StaffEventAssignmentEntityCopyWith<$Res>(_value.selectedEvent!,
        (value) {
      return _then(_value.copyWith(selectedEvent: value));
    });
  }
}

/// @nodoc

class _$AssignmentsRefreshedImpl implements _AssignmentsRefreshed {
  const _$AssignmentsRefreshedImpl(
      {required final List<StaffEventAssignmentEntity> events,
      this.selectedEvent})
      : _events = events;

  final List<StaffEventAssignmentEntity> _events;
  @override
  List<StaffEventAssignmentEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  final StaffEventAssignmentEntity? selectedEvent;

  @override
  String toString() {
    return 'StaffEventAssignmentState.assignmentsRefreshed(events: $events, selectedEvent: $selectedEvent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentsRefreshedImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.selectedEvent, selectedEvent) ||
                other.selectedEvent == selectedEvent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_events), selectedEvent);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentsRefreshedImplCopyWith<_$AssignmentsRefreshedImpl>
      get copyWith =>
          __$$AssignmentsRefreshedImplCopyWithImpl<_$AssignmentsRefreshedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        eventsLoaded,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)
        eventSelected,
    required TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)
        accessGranted,
    required TResult Function(String message) accessDenied,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        assignmentsRefreshed,
    required TResult Function(String message) error,
  }) {
    return assignmentsRefreshed(events, selectedEvent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult? Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult? Function(String message)? accessDenied,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult? Function(String message)? error,
  }) {
    return assignmentsRefreshed?.call(events, selectedEvent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult Function(String message)? accessDenied,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (assignmentsRefreshed != null) {
      return assignmentsRefreshed(events, selectedEvent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EventsLoaded value) eventsLoaded,
    required TResult Function(_EventSelected value) eventSelected,
    required TResult Function(_AccessGranted value) accessGranted,
    required TResult Function(_AccessDenied value) accessDenied,
    required TResult Function(_AssignmentsRefreshed value) assignmentsRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return assignmentsRefreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EventsLoaded value)? eventsLoaded,
    TResult? Function(_EventSelected value)? eventSelected,
    TResult? Function(_AccessGranted value)? accessGranted,
    TResult? Function(_AccessDenied value)? accessDenied,
    TResult? Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return assignmentsRefreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EventsLoaded value)? eventsLoaded,
    TResult Function(_EventSelected value)? eventSelected,
    TResult Function(_AccessGranted value)? accessGranted,
    TResult Function(_AccessDenied value)? accessDenied,
    TResult Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (assignmentsRefreshed != null) {
      return assignmentsRefreshed(this);
    }
    return orElse();
  }
}

abstract class _AssignmentsRefreshed implements StaffEventAssignmentState {
  const factory _AssignmentsRefreshed(
          {required final List<StaffEventAssignmentEntity> events,
          final StaffEventAssignmentEntity? selectedEvent}) =
      _$AssignmentsRefreshedImpl;

  List<StaffEventAssignmentEntity> get events;
  StaffEventAssignmentEntity? get selectedEvent;

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignmentsRefreshedImplCopyWith<_$AssignmentsRefreshedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$StaffEventAssignmentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'StaffEventAssignmentState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        eventsLoaded,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)
        eventSelected,
    required TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)
        accessGranted,
    required TResult Function(String message) accessDenied,
    required TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)
        assignmentsRefreshed,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult? Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult? Function(String message)? accessDenied,
    TResult? Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        eventsLoaded,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent)?
        eventSelected,
    TResult Function(
            List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity selectedEvent,
            List<StaffPermission> permissions)?
        accessGranted,
    TResult Function(String message)? accessDenied,
    TResult Function(List<StaffEventAssignmentEntity> events,
            StaffEventAssignmentEntity? selectedEvent)?
        assignmentsRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_EventsLoaded value) eventsLoaded,
    required TResult Function(_EventSelected value) eventSelected,
    required TResult Function(_AccessGranted value) accessGranted,
    required TResult Function(_AccessDenied value) accessDenied,
    required TResult Function(_AssignmentsRefreshed value) assignmentsRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_EventsLoaded value)? eventsLoaded,
    TResult? Function(_EventSelected value)? eventSelected,
    TResult? Function(_AccessGranted value)? accessGranted,
    TResult? Function(_AccessDenied value)? accessDenied,
    TResult? Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_EventsLoaded value)? eventsLoaded,
    TResult Function(_EventSelected value)? eventSelected,
    TResult Function(_AccessGranted value)? accessGranted,
    TResult Function(_AccessDenied value)? accessDenied,
    TResult Function(_AssignmentsRefreshed value)? assignmentsRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements StaffEventAssignmentState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of StaffEventAssignmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
