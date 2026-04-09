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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendeeManagementEventCopyWith<$Res> {
  factory $AttendeeManagementEventCopyWith(AttendeeManagementEvent value,
          $Res Function(AttendeeManagementEvent) then) =
      _$AttendeeManagementEventCopyWithImpl<$Res, AttendeeManagementEvent>;
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
}

/// @nodoc
abstract class _$$LoadEventAttendeesImplCopyWith<$Res> {
  factory _$$LoadEventAttendeesImplCopyWith(_$LoadEventAttendeesImpl value,
          $Res Function(_$LoadEventAttendeesImpl) then) =
      __$$LoadEventAttendeesImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String eventId,
      AttendeeStatus? status,
      int? limit,
      String? lastAttendeeId});
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
    Object? status = freezed,
    Object? limit = freezed,
    Object? lastAttendeeId = freezed,
  }) {
    return _then(_$LoadEventAttendeesImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAttendeeId: freezed == lastAttendeeId
          ? _value.lastAttendeeId
          : lastAttendeeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadEventAttendeesImpl implements _LoadEventAttendees {
  const _$LoadEventAttendeesImpl(
      {required this.eventId, this.status, this.limit, this.lastAttendeeId});

  @override
  final String eventId;
  @override
  final AttendeeStatus? status;
  @override
  final int? limit;
  @override
  final String? lastAttendeeId;

  @override
  String toString() {
    return 'AttendeeManagementEvent.loadEventAttendees(eventId: $eventId, status: $status, limit: $limit, lastAttendeeId: $lastAttendeeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventAttendeesImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.lastAttendeeId, lastAttendeeId) ||
                other.lastAttendeeId == lastAttendeeId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, status, limit, lastAttendeeId);

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
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return loadEventAttendees(eventId, status, limit, lastAttendeeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return loadEventAttendees?.call(eventId, status, limit, lastAttendeeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadEventAttendees != null) {
      return loadEventAttendees(eventId, status, limit, lastAttendeeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadEventAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadEventAttendees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
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
      final AttendeeStatus? status,
      final int? limit,
      final String? lastAttendeeId}) = _$LoadEventAttendeesImpl;

  String get eventId;
  AttendeeStatus? get status;
  int? get limit;
  String? get lastAttendeeId;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadEventAttendeesImplCopyWith<_$LoadEventAttendeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadOrganizerAttendeesImplCopyWith<$Res> {
  factory _$$LoadOrganizerAttendeesImplCopyWith(
          _$LoadOrganizerAttendeesImpl value,
          $Res Function(_$LoadOrganizerAttendeesImpl) then) =
      __$$LoadOrganizerAttendeesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String organizerId, int? limit, String? lastAttendeeId});
}

/// @nodoc
class __$$LoadOrganizerAttendeesImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res,
        _$LoadOrganizerAttendeesImpl>
    implements _$$LoadOrganizerAttendeesImplCopyWith<$Res> {
  __$$LoadOrganizerAttendeesImplCopyWithImpl(
      _$LoadOrganizerAttendeesImpl _value,
      $Res Function(_$LoadOrganizerAttendeesImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
    Object? limit = freezed,
    Object? lastAttendeeId = freezed,
  }) {
    return _then(_$LoadOrganizerAttendeesImpl(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAttendeeId: freezed == lastAttendeeId
          ? _value.lastAttendeeId
          : lastAttendeeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadOrganizerAttendeesImpl implements _LoadOrganizerAttendees {
  const _$LoadOrganizerAttendeesImpl(
      {required this.organizerId, this.limit, this.lastAttendeeId});

  @override
  final String organizerId;
  @override
  final int? limit;
  @override
  final String? lastAttendeeId;

  @override
  String toString() {
    return 'AttendeeManagementEvent.loadOrganizerAttendees(organizerId: $organizerId, limit: $limit, lastAttendeeId: $lastAttendeeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadOrganizerAttendeesImpl &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.lastAttendeeId, lastAttendeeId) ||
                other.lastAttendeeId == lastAttendeeId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, organizerId, limit, lastAttendeeId);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadOrganizerAttendeesImplCopyWith<_$LoadOrganizerAttendeesImpl>
      get copyWith => __$$LoadOrganizerAttendeesImplCopyWithImpl<
          _$LoadOrganizerAttendeesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return loadOrganizerAttendees(organizerId, limit, lastAttendeeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return loadOrganizerAttendees?.call(organizerId, limit, lastAttendeeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadOrganizerAttendees != null) {
      return loadOrganizerAttendees(organizerId, limit, lastAttendeeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadOrganizerAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadOrganizerAttendees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadOrganizerAttendees != null) {
      return loadOrganizerAttendees(this);
    }
    return orElse();
  }
}

abstract class _LoadOrganizerAttendees implements AttendeeManagementEvent {
  const factory _LoadOrganizerAttendees(
      {required final String organizerId,
      final int? limit,
      final String? lastAttendeeId}) = _$LoadOrganizerAttendeesImpl;

  String get organizerId;
  int? get limit;
  String? get lastAttendeeId;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadOrganizerAttendeesImplCopyWith<_$LoadOrganizerAttendeesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchAttendeesImplCopyWith<$Res> {
  factory _$$SearchAttendeesImplCopyWith(_$SearchAttendeesImpl value,
          $Res Function(_$SearchAttendeesImpl) then) =
      __$$SearchAttendeesImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String query,
      String? eventId,
      String? organizerId,
      AttendeeStatus? status,
      int? limit});
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
    Object? query = null,
    Object? eventId = freezed,
    Object? organizerId = freezed,
    Object? status = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$SearchAttendeesImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizerId: freezed == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SearchAttendeesImpl implements _SearchAttendees {
  const _$SearchAttendeesImpl(
      {required this.query,
      this.eventId,
      this.organizerId,
      this.status,
      this.limit});

  @override
  final String query;
  @override
  final String? eventId;
  @override
  final String? organizerId;
  @override
  final AttendeeStatus? status;
  @override
  final int? limit;

  @override
  String toString() {
    return 'AttendeeManagementEvent.searchAttendees(query: $query, eventId: $eventId, organizerId: $organizerId, status: $status, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchAttendeesImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, query, eventId, organizerId, status, limit);

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
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return searchAttendees(query, eventId, organizerId, status, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return searchAttendees?.call(query, eventId, organizerId, status, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (searchAttendees != null) {
      return searchAttendees(query, eventId, organizerId, status, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return searchAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return searchAttendees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
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
      {required final String query,
      final String? eventId,
      final String? organizerId,
      final AttendeeStatus? status,
      final int? limit}) = _$SearchAttendeesImpl;

  String get query;
  String? get eventId;
  String? get organizerId;
  AttendeeStatus? get status;
  int? get limit;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchAttendeesImplCopyWith<_$SearchAttendeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadAttendeeDetailsImplCopyWith<$Res> {
  factory _$$LoadAttendeeDetailsImplCopyWith(_$LoadAttendeeDetailsImpl value,
          $Res Function(_$LoadAttendeeDetailsImpl) then) =
      __$$LoadAttendeeDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String attendeeId, String eventId});
}

/// @nodoc
class __$$LoadAttendeeDetailsImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res,
        _$LoadAttendeeDetailsImpl>
    implements _$$LoadAttendeeDetailsImplCopyWith<$Res> {
  __$$LoadAttendeeDetailsImplCopyWithImpl(_$LoadAttendeeDetailsImpl _value,
      $Res Function(_$LoadAttendeeDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendeeId = null,
    Object? eventId = null,
  }) {
    return _then(_$LoadAttendeeDetailsImpl(
      attendeeId: null == attendeeId
          ? _value.attendeeId
          : attendeeId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadAttendeeDetailsImpl implements _LoadAttendeeDetails {
  const _$LoadAttendeeDetailsImpl(
      {required this.attendeeId, required this.eventId});

  @override
  final String attendeeId;
  @override
  final String eventId;

  @override
  String toString() {
    return 'AttendeeManagementEvent.loadAttendeeDetails(attendeeId: $attendeeId, eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadAttendeeDetailsImpl &&
            (identical(other.attendeeId, attendeeId) ||
                other.attendeeId == attendeeId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attendeeId, eventId);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadAttendeeDetailsImplCopyWith<_$LoadAttendeeDetailsImpl> get copyWith =>
      __$$LoadAttendeeDetailsImplCopyWithImpl<_$LoadAttendeeDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return loadAttendeeDetails(attendeeId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return loadAttendeeDetails?.call(attendeeId, eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadAttendeeDetails != null) {
      return loadAttendeeDetails(attendeeId, eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadAttendeeDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadAttendeeDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadAttendeeDetails != null) {
      return loadAttendeeDetails(this);
    }
    return orElse();
  }
}

abstract class _LoadAttendeeDetails implements AttendeeManagementEvent {
  const factory _LoadAttendeeDetails(
      {required final String attendeeId,
      required final String eventId}) = _$LoadAttendeeDetailsImpl;

  String get attendeeId;
  String get eventId;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadAttendeeDetailsImplCopyWith<_$LoadAttendeeDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAttendeeStatusImplCopyWith<$Res> {
  factory _$$UpdateAttendeeStatusImplCopyWith(_$UpdateAttendeeStatusImpl value,
          $Res Function(_$UpdateAttendeeStatusImpl) then) =
      __$$UpdateAttendeeStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String attendeeId,
      String eventId,
      AttendeeStatus status,
      String? reason});
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
    Object? status = null,
    Object? reason = freezed,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateAttendeeStatusImpl implements _UpdateAttendeeStatus {
  const _$UpdateAttendeeStatusImpl(
      {required this.attendeeId,
      required this.eventId,
      required this.status,
      this.reason});

  @override
  final String attendeeId;
  @override
  final String eventId;
  @override
  final AttendeeStatus status;
  @override
  final String? reason;

  @override
  String toString() {
    return 'AttendeeManagementEvent.updateAttendeeStatus(attendeeId: $attendeeId, eventId: $eventId, status: $status, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAttendeeStatusImpl &&
            (identical(other.attendeeId, attendeeId) ||
                other.attendeeId == attendeeId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, attendeeId, eventId, status, reason);

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
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return updateAttendeeStatus(attendeeId, eventId, status, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return updateAttendeeStatus?.call(attendeeId, eventId, status, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (updateAttendeeStatus != null) {
      return updateAttendeeStatus(attendeeId, eventId, status, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return updateAttendeeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return updateAttendeeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
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
      required final AttendeeStatus status,
      final String? reason}) = _$UpdateAttendeeStatusImpl;

  String get attendeeId;
  String get eventId;
  AttendeeStatus get status;
  String? get reason;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAttendeeStatusImplCopyWith<_$UpdateAttendeeStatusImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMessageToAttendeeImplCopyWith<$Res> {
  factory _$$SendMessageToAttendeeImplCopyWith(
          _$SendMessageToAttendeeImpl value,
          $Res Function(_$SendMessageToAttendeeImpl) then) =
      __$$SendMessageToAttendeeImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String attendeeId,
      String eventId,
      String message,
      MessageType messageType});
}

/// @nodoc
class __$$SendMessageToAttendeeImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res,
        _$SendMessageToAttendeeImpl>
    implements _$$SendMessageToAttendeeImplCopyWith<$Res> {
  __$$SendMessageToAttendeeImplCopyWithImpl(_$SendMessageToAttendeeImpl _value,
      $Res Function(_$SendMessageToAttendeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendeeId = null,
    Object? eventId = null,
    Object? message = null,
    Object? messageType = null,
  }) {
    return _then(_$SendMessageToAttendeeImpl(
      attendeeId: null == attendeeId
          ? _value.attendeeId
          : attendeeId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
    ));
  }
}

/// @nodoc

class _$SendMessageToAttendeeImpl implements _SendMessageToAttendee {
  const _$SendMessageToAttendeeImpl(
      {required this.attendeeId,
      required this.eventId,
      required this.message,
      required this.messageType});

  @override
  final String attendeeId;
  @override
  final String eventId;
  @override
  final String message;
  @override
  final MessageType messageType;

  @override
  String toString() {
    return 'AttendeeManagementEvent.sendMessageToAttendee(attendeeId: $attendeeId, eventId: $eventId, message: $message, messageType: $messageType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageToAttendeeImpl &&
            (identical(other.attendeeId, attendeeId) ||
                other.attendeeId == attendeeId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, attendeeId, eventId, message, messageType);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageToAttendeeImplCopyWith<_$SendMessageToAttendeeImpl>
      get copyWith => __$$SendMessageToAttendeeImplCopyWithImpl<
          _$SendMessageToAttendeeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return sendMessageToAttendee(attendeeId, eventId, message, messageType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return sendMessageToAttendee?.call(
        attendeeId, eventId, message, messageType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (sendMessageToAttendee != null) {
      return sendMessageToAttendee(attendeeId, eventId, message, messageType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return sendMessageToAttendee(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return sendMessageToAttendee?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (sendMessageToAttendee != null) {
      return sendMessageToAttendee(this);
    }
    return orElse();
  }
}

abstract class _SendMessageToAttendee implements AttendeeManagementEvent {
  const factory _SendMessageToAttendee(
      {required final String attendeeId,
      required final String eventId,
      required final String message,
      required final MessageType messageType}) = _$SendMessageToAttendeeImpl;

  String get attendeeId;
  String get eventId;
  String get message;
  MessageType get messageType;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageToAttendeeImplCopyWith<_$SendMessageToAttendeeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendBulkMessageImplCopyWith<$Res> {
  factory _$$SendBulkMessageImplCopyWith(_$SendBulkMessageImpl value,
          $Res Function(_$SendBulkMessageImpl) then) =
      __$$SendBulkMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String> attendeeIds,
      String eventId,
      String message,
      MessageType messageType});
}

/// @nodoc
class __$$SendBulkMessageImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res, _$SendBulkMessageImpl>
    implements _$$SendBulkMessageImplCopyWith<$Res> {
  __$$SendBulkMessageImplCopyWithImpl(
      _$SendBulkMessageImpl _value, $Res Function(_$SendBulkMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendeeIds = null,
    Object? eventId = null,
    Object? message = null,
    Object? messageType = null,
  }) {
    return _then(_$SendBulkMessageImpl(
      attendeeIds: null == attendeeIds
          ? _value._attendeeIds
          : attendeeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as MessageType,
    ));
  }
}

/// @nodoc

class _$SendBulkMessageImpl implements _SendBulkMessage {
  const _$SendBulkMessageImpl(
      {required final List<String> attendeeIds,
      required this.eventId,
      required this.message,
      required this.messageType})
      : _attendeeIds = attendeeIds;

  final List<String> _attendeeIds;
  @override
  List<String> get attendeeIds {
    if (_attendeeIds is EqualUnmodifiableListView) return _attendeeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendeeIds);
  }

  @override
  final String eventId;
  @override
  final String message;
  @override
  final MessageType messageType;

  @override
  String toString() {
    return 'AttendeeManagementEvent.sendBulkMessage(attendeeIds: $attendeeIds, eventId: $eventId, message: $message, messageType: $messageType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendBulkMessageImpl &&
            const DeepCollectionEquality()
                .equals(other._attendeeIds, _attendeeIds) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_attendeeIds),
      eventId,
      message,
      messageType);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendBulkMessageImplCopyWith<_$SendBulkMessageImpl> get copyWith =>
      __$$SendBulkMessageImplCopyWithImpl<_$SendBulkMessageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return sendBulkMessage(attendeeIds, eventId, message, messageType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return sendBulkMessage?.call(attendeeIds, eventId, message, messageType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (sendBulkMessage != null) {
      return sendBulkMessage(attendeeIds, eventId, message, messageType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return sendBulkMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return sendBulkMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (sendBulkMessage != null) {
      return sendBulkMessage(this);
    }
    return orElse();
  }
}

abstract class _SendBulkMessage implements AttendeeManagementEvent {
  const factory _SendBulkMessage(
      {required final List<String> attendeeIds,
      required final String eventId,
      required final String message,
      required final MessageType messageType}) = _$SendBulkMessageImpl;

  List<String> get attendeeIds;
  String get eventId;
  String get message;
  MessageType get messageType;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendBulkMessageImplCopyWith<_$SendBulkMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExportAttendeeListImplCopyWith<$Res> {
  factory _$$ExportAttendeeListImplCopyWith(_$ExportAttendeeListImpl value,
          $Res Function(_$ExportAttendeeListImpl) then) =
      __$$ExportAttendeeListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, ExportFormat format, bool includePersonalInfo});
}

/// @nodoc
class __$$ExportAttendeeListImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res,
        _$ExportAttendeeListImpl>
    implements _$$ExportAttendeeListImplCopyWith<$Res> {
  __$$ExportAttendeeListImplCopyWithImpl(_$ExportAttendeeListImpl _value,
      $Res Function(_$ExportAttendeeListImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? format = null,
    Object? includePersonalInfo = null,
  }) {
    return _then(_$ExportAttendeeListImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ExportFormat,
      includePersonalInfo: null == includePersonalInfo
          ? _value.includePersonalInfo
          : includePersonalInfo // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ExportAttendeeListImpl implements _ExportAttendeeList {
  const _$ExportAttendeeListImpl(
      {required this.eventId,
      required this.format,
      this.includePersonalInfo = false});

  @override
  final String eventId;
  @override
  final ExportFormat format;
  @override
  @JsonKey()
  final bool includePersonalInfo;

  @override
  String toString() {
    return 'AttendeeManagementEvent.exportAttendeeList(eventId: $eventId, format: $format, includePersonalInfo: $includePersonalInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportAttendeeListImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.includePersonalInfo, includePersonalInfo) ||
                other.includePersonalInfo == includePersonalInfo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, format, includePersonalInfo);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportAttendeeListImplCopyWith<_$ExportAttendeeListImpl> get copyWith =>
      __$$ExportAttendeeListImplCopyWithImpl<_$ExportAttendeeListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return exportAttendeeList(eventId, format, includePersonalInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return exportAttendeeList?.call(eventId, format, includePersonalInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (exportAttendeeList != null) {
      return exportAttendeeList(eventId, format, includePersonalInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return exportAttendeeList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return exportAttendeeList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (exportAttendeeList != null) {
      return exportAttendeeList(this);
    }
    return orElse();
  }
}

abstract class _ExportAttendeeList implements AttendeeManagementEvent {
  const factory _ExportAttendeeList(
      {required final String eventId,
      required final ExportFormat format,
      final bool includePersonalInfo}) = _$ExportAttendeeListImpl;

  String get eventId;
  ExportFormat get format;
  bool get includePersonalInfo;

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportAttendeeListImplCopyWith<_$ExportAttendeeListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshAttendeesImplCopyWith<$Res> {
  factory _$$RefreshAttendeesImplCopyWith(_$RefreshAttendeesImpl value,
          $Res Function(_$RefreshAttendeesImpl) then) =
      __$$RefreshAttendeesImplCopyWithImpl<$Res>;
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
}

/// @nodoc

class _$RefreshAttendeesImpl implements _RefreshAttendees {
  const _$RefreshAttendeesImpl();

  @override
  String toString() {
    return 'AttendeeManagementEvent.refreshAttendees()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshAttendeesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return refreshAttendees();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return refreshAttendees?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (refreshAttendees != null) {
      return refreshAttendees();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return refreshAttendees(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return refreshAttendees?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (refreshAttendees != null) {
      return refreshAttendees(this);
    }
    return orElse();
  }
}

abstract class _RefreshAttendees implements AttendeeManagementEvent {
  const factory _RefreshAttendees() = _$RefreshAttendeesImpl;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
          _$ClearErrorImpl value, $Res Function(_$ClearErrorImpl) then) =
      __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$AttendeeManagementEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
      _$ClearErrorImpl _value, $Res Function(_$ClearErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendeeManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearErrorImpl implements _ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'AttendeeManagementEvent.clearError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String eventId, AttendeeStatus? status,
            int? limit, String? lastAttendeeId)
        loadEventAttendees,
    required TResult Function(
            String organizerId, int? limit, String? lastAttendeeId)
        loadOrganizerAttendees,
    required TResult Function(String query, String? eventId,
            String? organizerId, AttendeeStatus? status, int? limit)
        searchAttendees,
    required TResult Function(String attendeeId, String eventId)
        loadAttendeeDetails,
    required TResult Function(String attendeeId, String eventId,
            AttendeeStatus status, String? reason)
        updateAttendeeStatus,
    required TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)
        sendMessageToAttendee,
    required TResult Function(List<String> attendeeIds, String eventId,
            String message, MessageType messageType)
        sendBulkMessage,
    required TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)
        exportAttendeeList,
    required TResult Function() refreshAttendees,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult? Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult? Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult? Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult? Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult? Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult? Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult? Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult? Function()? refreshAttendees,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String eventId, AttendeeStatus? status, int? limit,
            String? lastAttendeeId)?
        loadEventAttendees,
    TResult Function(String organizerId, int? limit, String? lastAttendeeId)?
        loadOrganizerAttendees,
    TResult Function(String query, String? eventId, String? organizerId,
            AttendeeStatus? status, int? limit)?
        searchAttendees,
    TResult Function(String attendeeId, String eventId)? loadAttendeeDetails,
    TResult Function(String attendeeId, String eventId, AttendeeStatus status,
            String? reason)?
        updateAttendeeStatus,
    TResult Function(String attendeeId, String eventId, String message,
            MessageType messageType)?
        sendMessageToAttendee,
    TResult Function(List<String> attendeeIds, String eventId, String message,
            MessageType messageType)?
        sendBulkMessage,
    TResult Function(
            String eventId, ExportFormat format, bool includePersonalInfo)?
        exportAttendeeList,
    TResult Function()? refreshAttendees,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventAttendees value) loadEventAttendees,
    required TResult Function(_LoadOrganizerAttendees value)
        loadOrganizerAttendees,
    required TResult Function(_SearchAttendees value) searchAttendees,
    required TResult Function(_LoadAttendeeDetails value) loadAttendeeDetails,
    required TResult Function(_UpdateAttendeeStatus value) updateAttendeeStatus,
    required TResult Function(_SendMessageToAttendee value)
        sendMessageToAttendee,
    required TResult Function(_SendBulkMessage value) sendBulkMessage,
    required TResult Function(_ExportAttendeeList value) exportAttendeeList,
    required TResult Function(_RefreshAttendees value) refreshAttendees,
    required TResult Function(_ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult? Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult? Function(_SearchAttendees value)? searchAttendees,
    TResult? Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult? Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult? Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult? Function(_SendBulkMessage value)? sendBulkMessage,
    TResult? Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult? Function(_RefreshAttendees value)? refreshAttendees,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventAttendees value)? loadEventAttendees,
    TResult Function(_LoadOrganizerAttendees value)? loadOrganizerAttendees,
    TResult Function(_SearchAttendees value)? searchAttendees,
    TResult Function(_LoadAttendeeDetails value)? loadAttendeeDetails,
    TResult Function(_UpdateAttendeeStatus value)? updateAttendeeStatus,
    TResult Function(_SendMessageToAttendee value)? sendMessageToAttendee,
    TResult Function(_SendBulkMessage value)? sendBulkMessage,
    TResult Function(_ExportAttendeeList value)? exportAttendeeList,
    TResult Function(_RefreshAttendees value)? refreshAttendees,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements AttendeeManagementEvent {
  const factory _ClearError() = _$ClearErrorImpl;
}

/// @nodoc
mixin _$AttendeeManagementState {
  List<AttendeeEntity> get attendees => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get isSendingMessage => throw _privateConstructorUsedError;
  bool get isExporting => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  AttendeeEntity? get selectedAttendee => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  String? get selectedEventId => throw _privateConstructorUsedError;
  String? get organizerId => throw _privateConstructorUsedError;
  AttendeeStatus? get filterStatus => throw _privateConstructorUsedError;
  String? get exportUrl => throw _privateConstructorUsedError;

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
      {List<AttendeeEntity> attendees,
      bool isLoading,
      bool isUpdating,
      bool isSendingMessage,
      bool isExporting,
      bool hasError,
      String errorMessage,
      AttendeeEntity? selectedAttendee,
      String searchQuery,
      String? selectedEventId,
      String? organizerId,
      AttendeeStatus? filterStatus,
      String? exportUrl});

  $AttendeeEntityCopyWith<$Res>? get selectedAttendee;
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
    Object? attendees = null,
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? isSendingMessage = null,
    Object? isExporting = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedAttendee = freezed,
    Object? searchQuery = null,
    Object? selectedEventId = freezed,
    Object? organizerId = freezed,
    Object? filterStatus = freezed,
    Object? exportUrl = freezed,
  }) {
    return _then(_value.copyWith(
      attendees: null == attendees
          ? _value.attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<AttendeeEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendingMessage: null == isSendingMessage
          ? _value.isSendingMessage
          : isSendingMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      isExporting: null == isExporting
          ? _value.isExporting
          : isExporting // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedAttendee: freezed == selectedAttendee
          ? _value.selectedAttendee
          : selectedAttendee // ignore: cast_nullable_to_non_nullable
              as AttendeeEntity?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      selectedEventId: freezed == selectedEventId
          ? _value.selectedEventId
          : selectedEventId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizerId: freezed == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String?,
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus?,
      exportUrl: freezed == exportUrl
          ? _value.exportUrl
          : exportUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {List<AttendeeEntity> attendees,
      bool isLoading,
      bool isUpdating,
      bool isSendingMessage,
      bool isExporting,
      bool hasError,
      String errorMessage,
      AttendeeEntity? selectedAttendee,
      String searchQuery,
      String? selectedEventId,
      String? organizerId,
      AttendeeStatus? filterStatus,
      String? exportUrl});

  @override
  $AttendeeEntityCopyWith<$Res>? get selectedAttendee;
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
    Object? attendees = null,
    Object? isLoading = null,
    Object? isUpdating = null,
    Object? isSendingMessage = null,
    Object? isExporting = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedAttendee = freezed,
    Object? searchQuery = null,
    Object? selectedEventId = freezed,
    Object? organizerId = freezed,
    Object? filterStatus = freezed,
    Object? exportUrl = freezed,
  }) {
    return _then(_$AttendeeManagementStateImpl(
      attendees: null == attendees
          ? _value._attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<AttendeeEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isSendingMessage: null == isSendingMessage
          ? _value.isSendingMessage
          : isSendingMessage // ignore: cast_nullable_to_non_nullable
              as bool,
      isExporting: null == isExporting
          ? _value.isExporting
          : isExporting // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedAttendee: freezed == selectedAttendee
          ? _value.selectedAttendee
          : selectedAttendee // ignore: cast_nullable_to_non_nullable
              as AttendeeEntity?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      selectedEventId: freezed == selectedEventId
          ? _value.selectedEventId
          : selectedEventId // ignore: cast_nullable_to_non_nullable
              as String?,
      organizerId: freezed == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String?,
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as AttendeeStatus?,
      exportUrl: freezed == exportUrl
          ? _value.exportUrl
          : exportUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AttendeeManagementStateImpl implements _AttendeeManagementState {
  const _$AttendeeManagementStateImpl(
      {final List<AttendeeEntity> attendees = const [],
      this.isLoading = false,
      this.isUpdating = false,
      this.isSendingMessage = false,
      this.isExporting = false,
      this.hasError = false,
      this.errorMessage = '',
      this.selectedAttendee,
      this.searchQuery = '',
      this.selectedEventId,
      this.organizerId,
      this.filterStatus,
      this.exportUrl})
      : _attendees = attendees;

  final List<AttendeeEntity> _attendees;
  @override
  @JsonKey()
  List<AttendeeEntity> get attendees {
    if (_attendees is EqualUnmodifiableListView) return _attendees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendees);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final bool isSendingMessage;
  @override
  @JsonKey()
  final bool isExporting;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final AttendeeEntity? selectedAttendee;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  final String? selectedEventId;
  @override
  final String? organizerId;
  @override
  final AttendeeStatus? filterStatus;
  @override
  final String? exportUrl;

  @override
  String toString() {
    return 'AttendeeManagementState(attendees: $attendees, isLoading: $isLoading, isUpdating: $isUpdating, isSendingMessage: $isSendingMessage, isExporting: $isExporting, hasError: $hasError, errorMessage: $errorMessage, selectedAttendee: $selectedAttendee, searchQuery: $searchQuery, selectedEventId: $selectedEventId, organizerId: $organizerId, filterStatus: $filterStatus, exportUrl: $exportUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendeeManagementStateImpl &&
            const DeepCollectionEquality()
                .equals(other._attendees, _attendees) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isSendingMessage, isSendingMessage) ||
                other.isSendingMessage == isSendingMessage) &&
            (identical(other.isExporting, isExporting) ||
                other.isExporting == isExporting) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedAttendee, selectedAttendee) ||
                other.selectedAttendee == selectedAttendee) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.selectedEventId, selectedEventId) ||
                other.selectedEventId == selectedEventId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus) &&
            (identical(other.exportUrl, exportUrl) ||
                other.exportUrl == exportUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_attendees),
      isLoading,
      isUpdating,
      isSendingMessage,
      isExporting,
      hasError,
      errorMessage,
      selectedAttendee,
      searchQuery,
      selectedEventId,
      organizerId,
      filterStatus,
      exportUrl);

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
      {final List<AttendeeEntity> attendees,
      final bool isLoading,
      final bool isUpdating,
      final bool isSendingMessage,
      final bool isExporting,
      final bool hasError,
      final String errorMessage,
      final AttendeeEntity? selectedAttendee,
      final String searchQuery,
      final String? selectedEventId,
      final String? organizerId,
      final AttendeeStatus? filterStatus,
      final String? exportUrl}) = _$AttendeeManagementStateImpl;

  @override
  List<AttendeeEntity> get attendees;
  @override
  bool get isLoading;
  @override
  bool get isUpdating;
  @override
  bool get isSendingMessage;
  @override
  bool get isExporting;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  AttendeeEntity? get selectedAttendee;
  @override
  String get searchQuery;
  @override
  String? get selectedEventId;
  @override
  String? get organizerId;
  @override
  AttendeeStatus? get filterStatus;
  @override
  String? get exportUrl;

  /// Create a copy of AttendeeManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendeeManagementStateImplCopyWith<_$AttendeeManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
