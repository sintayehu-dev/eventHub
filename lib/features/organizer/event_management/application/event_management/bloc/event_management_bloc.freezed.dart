// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EventManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventManagementEventCopyWith<$Res> {
  factory $EventManagementEventCopyWith(EventManagementEvent value,
          $Res Function(EventManagementEvent) then) =
      _$EventManagementEventCopyWithImpl<$Res, EventManagementEvent>;
}

/// @nodoc
class _$EventManagementEventCopyWithImpl<$Res,
        $Val extends EventManagementEvent>
    implements $EventManagementEventCopyWith<$Res> {
  _$EventManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateEventImplCopyWith<$Res> {
  factory _$$CreateEventImplCopyWith(
          _$CreateEventImpl value, $Res Function(_$CreateEventImpl) then) =
      __$$CreateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String organizerId, CreateEventRequest request});

  $CreateEventRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$CreateEventImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$CreateEventImpl>
    implements _$$CreateEventImplCopyWith<$Res> {
  __$$CreateEventImplCopyWithImpl(
      _$CreateEventImpl _value, $Res Function(_$CreateEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
    Object? request = null,
  }) {
    return _then(_$CreateEventImpl(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as CreateEventRequest,
    ));
  }

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateEventRequestCopyWith<$Res> get request {
    return $CreateEventRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$CreateEventImpl implements _CreateEvent {
  const _$CreateEventImpl({required this.organizerId, required this.request});

  @override
  final String organizerId;
  @override
  final CreateEventRequest request;

  @override
  String toString() {
    return 'EventManagementEvent.createEvent(organizerId: $organizerId, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateEventImpl &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizerId, request);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateEventImplCopyWith<_$CreateEventImpl> get copyWith =>
      __$$CreateEventImplCopyWithImpl<_$CreateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return createEvent(organizerId, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return createEvent?.call(organizerId, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (createEvent != null) {
      return createEvent(organizerId, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return createEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return createEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (createEvent != null) {
      return createEvent(this);
    }
    return orElse();
  }
}

abstract class _CreateEvent implements EventManagementEvent {
  const factory _CreateEvent(
      {required final String organizerId,
      required final CreateEventRequest request}) = _$CreateEventImpl;

  String get organizerId;
  CreateEventRequest get request;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateEventImplCopyWith<_$CreateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadOrganizerEventsImplCopyWith<$Res> {
  factory _$$LoadOrganizerEventsImplCopyWith(_$LoadOrganizerEventsImpl value,
          $Res Function(_$LoadOrganizerEventsImpl) then) =
      __$$LoadOrganizerEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String organizerId,
      EventStatus? status,
      int? limit,
      String? lastEventId});
}

/// @nodoc
class __$$LoadOrganizerEventsImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$LoadOrganizerEventsImpl>
    implements _$$LoadOrganizerEventsImplCopyWith<$Res> {
  __$$LoadOrganizerEventsImplCopyWithImpl(_$LoadOrganizerEventsImpl _value,
      $Res Function(_$LoadOrganizerEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
    Object? status = freezed,
    Object? limit = freezed,
    Object? lastEventId = freezed,
  }) {
    return _then(_$LoadOrganizerEventsImpl(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      lastEventId: freezed == lastEventId
          ? _value.lastEventId
          : lastEventId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadOrganizerEventsImpl implements _LoadOrganizerEvents {
  const _$LoadOrganizerEventsImpl(
      {required this.organizerId, this.status, this.limit, this.lastEventId});

  @override
  final String organizerId;
  @override
  final EventStatus? status;
  @override
  final int? limit;
  @override
  final String? lastEventId;

  @override
  String toString() {
    return 'EventManagementEvent.loadOrganizerEvents(organizerId: $organizerId, status: $status, limit: $limit, lastEventId: $lastEventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadOrganizerEventsImpl &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.lastEventId, lastEventId) ||
                other.lastEventId == lastEventId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, organizerId, status, limit, lastEventId);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadOrganizerEventsImplCopyWith<_$LoadOrganizerEventsImpl> get copyWith =>
      __$$LoadOrganizerEventsImplCopyWithImpl<_$LoadOrganizerEventsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return loadOrganizerEvents(organizerId, status, limit, lastEventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return loadOrganizerEvents?.call(organizerId, status, limit, lastEventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadOrganizerEvents != null) {
      return loadOrganizerEvents(organizerId, status, limit, lastEventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadOrganizerEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadOrganizerEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadOrganizerEvents != null) {
      return loadOrganizerEvents(this);
    }
    return orElse();
  }
}

abstract class _LoadOrganizerEvents implements EventManagementEvent {
  const factory _LoadOrganizerEvents(
      {required final String organizerId,
      final EventStatus? status,
      final int? limit,
      final String? lastEventId}) = _$LoadOrganizerEventsImpl;

  String get organizerId;
  EventStatus? get status;
  int? get limit;
  String? get lastEventId;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadOrganizerEventsImplCopyWith<_$LoadOrganizerEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadEventByIdImplCopyWith<$Res> {
  factory _$$LoadEventByIdImplCopyWith(
          _$LoadEventByIdImpl value, $Res Function(_$LoadEventByIdImpl) then) =
      __$$LoadEventByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId});
}

/// @nodoc
class __$$LoadEventByIdImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$LoadEventByIdImpl>
    implements _$$LoadEventByIdImplCopyWith<$Res> {
  __$$LoadEventByIdImplCopyWithImpl(
      _$LoadEventByIdImpl _value, $Res Function(_$LoadEventByIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
  }) {
    return _then(_$LoadEventByIdImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadEventByIdImpl implements _LoadEventById {
  const _$LoadEventByIdImpl({required this.eventId});

  @override
  final String eventId;

  @override
  String toString() {
    return 'EventManagementEvent.loadEventById(eventId: $eventId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventByIdImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventByIdImplCopyWith<_$LoadEventByIdImpl> get copyWith =>
      __$$LoadEventByIdImplCopyWithImpl<_$LoadEventByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return loadEventById(eventId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return loadEventById?.call(eventId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadEventById != null) {
      return loadEventById(eventId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadEventById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadEventById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadEventById != null) {
      return loadEventById(this);
    }
    return orElse();
  }
}

abstract class _LoadEventById implements EventManagementEvent {
  const factory _LoadEventById({required final String eventId}) =
      _$LoadEventByIdImpl;

  String get eventId;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadEventByIdImplCopyWith<_$LoadEventByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateEventImplCopyWith<$Res> {
  factory _$$UpdateEventImplCopyWith(
          _$UpdateEventImpl value, $Res Function(_$UpdateEventImpl) then) =
      __$$UpdateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String organizerId, UpdateEventRequest request});

  $UpdateEventRequestCopyWith<$Res> get request;
}

/// @nodoc
class __$$UpdateEventImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$UpdateEventImpl>
    implements _$$UpdateEventImplCopyWith<$Res> {
  __$$UpdateEventImplCopyWithImpl(
      _$UpdateEventImpl _value, $Res Function(_$UpdateEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? organizerId = null,
    Object? request = null,
  }) {
    return _then(_$UpdateEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as UpdateEventRequest,
    ));
  }

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateEventRequestCopyWith<$Res> get request {
    return $UpdateEventRequestCopyWith<$Res>(_value.request, (value) {
      return _then(_value.copyWith(request: value));
    });
  }
}

/// @nodoc

class _$UpdateEventImpl implements _UpdateEvent {
  const _$UpdateEventImpl(
      {required this.eventId,
      required this.organizerId,
      required this.request});

  @override
  final String eventId;
  @override
  final String organizerId;
  @override
  final UpdateEventRequest request;

  @override
  String toString() {
    return 'EventManagementEvent.updateEvent(eventId: $eventId, organizerId: $organizerId, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, organizerId, request);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEventImplCopyWith<_$UpdateEventImpl> get copyWith =>
      __$$UpdateEventImplCopyWithImpl<_$UpdateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return updateEvent(eventId, organizerId, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return updateEvent?.call(eventId, organizerId, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (updateEvent != null) {
      return updateEvent(eventId, organizerId, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return updateEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return updateEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (updateEvent != null) {
      return updateEvent(this);
    }
    return orElse();
  }
}

abstract class _UpdateEvent implements EventManagementEvent {
  const factory _UpdateEvent(
      {required final String eventId,
      required final String organizerId,
      required final UpdateEventRequest request}) = _$UpdateEventImpl;

  String get eventId;
  String get organizerId;
  UpdateEventRequest get request;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEventImplCopyWith<_$UpdateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteEventImplCopyWith<$Res> {
  factory _$$DeleteEventImplCopyWith(
          _$DeleteEventImpl value, $Res Function(_$DeleteEventImpl) then) =
      __$$DeleteEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String organizerId});
}

/// @nodoc
class __$$DeleteEventImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$DeleteEventImpl>
    implements _$$DeleteEventImplCopyWith<$Res> {
  __$$DeleteEventImplCopyWithImpl(
      _$DeleteEventImpl _value, $Res Function(_$DeleteEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? organizerId = null,
  }) {
    return _then(_$DeleteEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteEventImpl implements _DeleteEvent {
  const _$DeleteEventImpl({required this.eventId, required this.organizerId});

  @override
  final String eventId;
  @override
  final String organizerId;

  @override
  String toString() {
    return 'EventManagementEvent.deleteEvent(eventId: $eventId, organizerId: $organizerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, organizerId);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteEventImplCopyWith<_$DeleteEventImpl> get copyWith =>
      __$$DeleteEventImplCopyWithImpl<_$DeleteEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return deleteEvent(eventId, organizerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return deleteEvent?.call(eventId, organizerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (deleteEvent != null) {
      return deleteEvent(eventId, organizerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return deleteEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return deleteEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (deleteEvent != null) {
      return deleteEvent(this);
    }
    return orElse();
  }
}

abstract class _DeleteEvent implements EventManagementEvent {
  const factory _DeleteEvent(
      {required final String eventId,
      required final String organizerId}) = _$DeleteEventImpl;

  String get eventId;
  String get organizerId;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteEventImplCopyWith<_$DeleteEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelEventImplCopyWith<$Res> {
  factory _$$CancelEventImplCopyWith(
          _$CancelEventImpl value, $Res Function(_$CancelEventImpl) then) =
      __$$CancelEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String organizerId, String cancellationReason});
}

/// @nodoc
class __$$CancelEventImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$CancelEventImpl>
    implements _$$CancelEventImplCopyWith<$Res> {
  __$$CancelEventImplCopyWithImpl(
      _$CancelEventImpl _value, $Res Function(_$CancelEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? organizerId = null,
    Object? cancellationReason = null,
  }) {
    return _then(_$CancelEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      cancellationReason: null == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CancelEventImpl implements _CancelEvent {
  const _$CancelEventImpl(
      {required this.eventId,
      required this.organizerId,
      required this.cancellationReason});

  @override
  final String eventId;
  @override
  final String organizerId;
  @override
  final String cancellationReason;

  @override
  String toString() {
    return 'EventManagementEvent.cancelEvent(eventId: $eventId, organizerId: $organizerId, cancellationReason: $cancellationReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, organizerId, cancellationReason);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelEventImplCopyWith<_$CancelEventImpl> get copyWith =>
      __$$CancelEventImplCopyWithImpl<_$CancelEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return cancelEvent(eventId, organizerId, cancellationReason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return cancelEvent?.call(eventId, organizerId, cancellationReason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (cancelEvent != null) {
      return cancelEvent(eventId, organizerId, cancellationReason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return cancelEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return cancelEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (cancelEvent != null) {
      return cancelEvent(this);
    }
    return orElse();
  }
}

abstract class _CancelEvent implements EventManagementEvent {
  const factory _CancelEvent(
      {required final String eventId,
      required final String organizerId,
      required final String cancellationReason}) = _$CancelEventImpl;

  String get eventId;
  String get organizerId;
  String get cancellationReason;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelEventImplCopyWith<_$CancelEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DuplicateEventImplCopyWith<$Res> {
  factory _$$DuplicateEventImplCopyWith(_$DuplicateEventImpl value,
          $Res Function(_$DuplicateEventImpl) then) =
      __$$DuplicateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String eventId,
      String organizerId,
      String newTitle,
      DateTime newDateTime});
}

/// @nodoc
class __$$DuplicateEventImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$DuplicateEventImpl>
    implements _$$DuplicateEventImplCopyWith<$Res> {
  __$$DuplicateEventImplCopyWithImpl(
      _$DuplicateEventImpl _value, $Res Function(_$DuplicateEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? organizerId = null,
    Object? newTitle = null,
    Object? newDateTime = null,
  }) {
    return _then(_$DuplicateEventImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      newTitle: null == newTitle
          ? _value.newTitle
          : newTitle // ignore: cast_nullable_to_non_nullable
              as String,
      newDateTime: null == newDateTime
          ? _value.newDateTime
          : newDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DuplicateEventImpl implements _DuplicateEvent {
  const _$DuplicateEventImpl(
      {required this.eventId,
      required this.organizerId,
      required this.newTitle,
      required this.newDateTime});

  @override
  final String eventId;
  @override
  final String organizerId;
  @override
  final String newTitle;
  @override
  final DateTime newDateTime;

  @override
  String toString() {
    return 'EventManagementEvent.duplicateEvent(eventId: $eventId, organizerId: $organizerId, newTitle: $newTitle, newDateTime: $newDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DuplicateEventImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.newTitle, newTitle) ||
                other.newTitle == newTitle) &&
            (identical(other.newDateTime, newDateTime) ||
                other.newDateTime == newDateTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, organizerId, newTitle, newDateTime);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DuplicateEventImplCopyWith<_$DuplicateEventImpl> get copyWith =>
      __$$DuplicateEventImplCopyWithImpl<_$DuplicateEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return duplicateEvent(eventId, organizerId, newTitle, newDateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return duplicateEvent?.call(eventId, organizerId, newTitle, newDateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (duplicateEvent != null) {
      return duplicateEvent(eventId, organizerId, newTitle, newDateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return duplicateEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return duplicateEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (duplicateEvent != null) {
      return duplicateEvent(this);
    }
    return orElse();
  }
}

abstract class _DuplicateEvent implements EventManagementEvent {
  const factory _DuplicateEvent(
      {required final String eventId,
      required final String organizerId,
      required final String newTitle,
      required final DateTime newDateTime}) = _$DuplicateEventImpl;

  String get eventId;
  String get organizerId;
  String get newTitle;
  DateTime get newDateTime;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DuplicateEventImplCopyWith<_$DuplicateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEventsImplCopyWith<$Res> {
  factory _$$SearchEventsImplCopyWith(
          _$SearchEventsImpl value, $Res Function(_$SearchEventsImpl) then) =
      __$$SearchEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String organizerId,
      String query,
      EventStatus? status,
      DateTime? startDate,
      DateTime? endDate,
      int? limit});
}

/// @nodoc
class __$$SearchEventsImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$SearchEventsImpl>
    implements _$$SearchEventsImplCopyWith<$Res> {
  __$$SearchEventsImplCopyWithImpl(
      _$SearchEventsImpl _value, $Res Function(_$SearchEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
    Object? query = null,
    Object? status = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$SearchEventsImpl(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EventStatus?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SearchEventsImpl implements _SearchEvents {
  const _$SearchEventsImpl(
      {required this.organizerId,
      required this.query,
      this.status,
      this.startDate,
      this.endDate,
      this.limit});

  @override
  final String organizerId;
  @override
  final String query;
  @override
  final EventStatus? status;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final int? limit;

  @override
  String toString() {
    return 'EventManagementEvent.searchEvents(organizerId: $organizerId, query: $query, status: $status, startDate: $startDate, endDate: $endDate, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEventsImpl &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, organizerId, query, status, startDate, endDate, limit);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEventsImplCopyWith<_$SearchEventsImpl> get copyWith =>
      __$$SearchEventsImplCopyWithImpl<_$SearchEventsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return searchEvents(organizerId, query, status, startDate, endDate, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return searchEvents?.call(
        organizerId, query, status, startDate, endDate, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (searchEvents != null) {
      return searchEvents(
          organizerId, query, status, startDate, endDate, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return searchEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return searchEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (searchEvents != null) {
      return searchEvents(this);
    }
    return orElse();
  }
}

abstract class _SearchEvents implements EventManagementEvent {
  const factory _SearchEvents(
      {required final String organizerId,
      required final String query,
      final EventStatus? status,
      final DateTime? startDate,
      final DateTime? endDate,
      final int? limit}) = _$SearchEventsImpl;

  String get organizerId;
  String get query;
  EventStatus? get status;
  DateTime? get startDate;
  DateTime? get endDate;
  int? get limit;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchEventsImplCopyWith<_$SearchEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadEventStatisticsImplCopyWith<$Res> {
  factory _$$LoadEventStatisticsImplCopyWith(_$LoadEventStatisticsImpl value,
          $Res Function(_$LoadEventStatisticsImpl) then) =
      __$$LoadEventStatisticsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String organizerId});
}

/// @nodoc
class __$$LoadEventStatisticsImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$LoadEventStatisticsImpl>
    implements _$$LoadEventStatisticsImplCopyWith<$Res> {
  __$$LoadEventStatisticsImplCopyWithImpl(_$LoadEventStatisticsImpl _value,
      $Res Function(_$LoadEventStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? organizerId = null,
  }) {
    return _then(_$LoadEventStatisticsImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadEventStatisticsImpl implements _LoadEventStatistics {
  const _$LoadEventStatisticsImpl(
      {required this.eventId, required this.organizerId});

  @override
  final String eventId;
  @override
  final String organizerId;

  @override
  String toString() {
    return 'EventManagementEvent.loadEventStatistics(eventId: $eventId, organizerId: $organizerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventStatisticsImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, organizerId);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventStatisticsImplCopyWith<_$LoadEventStatisticsImpl> get copyWith =>
      __$$LoadEventStatisticsImplCopyWithImpl<_$LoadEventStatisticsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return loadEventStatistics(eventId, organizerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return loadEventStatistics?.call(eventId, organizerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadEventStatistics != null) {
      return loadEventStatistics(eventId, organizerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadEventStatistics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadEventStatistics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadEventStatistics != null) {
      return loadEventStatistics(this);
    }
    return orElse();
  }
}

abstract class _LoadEventStatistics implements EventManagementEvent {
  const factory _LoadEventStatistics(
      {required final String eventId,
      required final String organizerId}) = _$LoadEventStatisticsImpl;

  String get eventId;
  String get organizerId;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadEventStatisticsImplCopyWith<_$LoadEventStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadEventBannerImplCopyWith<$Res> {
  factory _$$UploadEventBannerImplCopyWith(_$UploadEventBannerImpl value,
          $Res Function(_$UploadEventBannerImpl) then) =
      __$$UploadEventBannerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String imagePath});
}

/// @nodoc
class __$$UploadEventBannerImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$UploadEventBannerImpl>
    implements _$$UploadEventBannerImplCopyWith<$Res> {
  __$$UploadEventBannerImplCopyWithImpl(_$UploadEventBannerImpl _value,
      $Res Function(_$UploadEventBannerImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? imagePath = null,
  }) {
    return _then(_$UploadEventBannerImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadEventBannerImpl implements _UploadEventBanner {
  const _$UploadEventBannerImpl(
      {required this.eventId, required this.imagePath});

  @override
  final String eventId;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'EventManagementEvent.uploadEventBanner(eventId: $eventId, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadEventBannerImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, imagePath);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadEventBannerImplCopyWith<_$UploadEventBannerImpl> get copyWith =>
      __$$UploadEventBannerImplCopyWithImpl<_$UploadEventBannerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return uploadEventBanner(eventId, imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return uploadEventBanner?.call(eventId, imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (uploadEventBanner != null) {
      return uploadEventBanner(eventId, imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return uploadEventBanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return uploadEventBanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (uploadEventBanner != null) {
      return uploadEventBanner(this);
    }
    return orElse();
  }
}

abstract class _UploadEventBanner implements EventManagementEvent {
  const factory _UploadEventBanner(
      {required final String eventId,
      required final String imagePath}) = _$UploadEventBannerImpl;

  String get eventId;
  String get imagePath;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadEventBannerImplCopyWith<_$UploadEventBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteEventBannerImplCopyWith<$Res> {
  factory _$$DeleteEventBannerImplCopyWith(_$DeleteEventBannerImpl value,
          $Res Function(_$DeleteEventBannerImpl) then) =
      __$$DeleteEventBannerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, String bannerUrl});
}

/// @nodoc
class __$$DeleteEventBannerImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$DeleteEventBannerImpl>
    implements _$$DeleteEventBannerImplCopyWith<$Res> {
  __$$DeleteEventBannerImplCopyWithImpl(_$DeleteEventBannerImpl _value,
      $Res Function(_$DeleteEventBannerImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? bannerUrl = null,
  }) {
    return _then(_$DeleteEventBannerImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      bannerUrl: null == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteEventBannerImpl implements _DeleteEventBanner {
  const _$DeleteEventBannerImpl(
      {required this.eventId, required this.bannerUrl});

  @override
  final String eventId;
  @override
  final String bannerUrl;

  @override
  String toString() {
    return 'EventManagementEvent.deleteEventBanner(eventId: $eventId, bannerUrl: $bannerUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteEventBannerImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, eventId, bannerUrl);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteEventBannerImplCopyWith<_$DeleteEventBannerImpl> get copyWith =>
      __$$DeleteEventBannerImplCopyWithImpl<_$DeleteEventBannerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return deleteEventBanner(eventId, bannerUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return deleteEventBanner?.call(eventId, bannerUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (deleteEventBanner != null) {
      return deleteEventBanner(eventId, bannerUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return deleteEventBanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return deleteEventBanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (deleteEventBanner != null) {
      return deleteEventBanner(this);
    }
    return orElse();
  }
}

abstract class _DeleteEventBanner implements EventManagementEvent {
  const factory _DeleteEventBanner(
      {required final String eventId,
      required final String bannerUrl}) = _$DeleteEventBannerImpl;

  String get eventId;
  String get bannerUrl;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteEventBannerImplCopyWith<_$DeleteEventBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshEventsImplCopyWith<$Res> {
  factory _$$RefreshEventsImplCopyWith(
          _$RefreshEventsImpl value, $Res Function(_$RefreshEventsImpl) then) =
      __$$RefreshEventsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String organizerId});
}

/// @nodoc
class __$$RefreshEventsImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$RefreshEventsImpl>
    implements _$$RefreshEventsImplCopyWith<$Res> {
  __$$RefreshEventsImplCopyWithImpl(
      _$RefreshEventsImpl _value, $Res Function(_$RefreshEventsImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
  }) {
    return _then(_$RefreshEventsImpl(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshEventsImpl implements _RefreshEvents {
  const _$RefreshEventsImpl({required this.organizerId});

  @override
  final String organizerId;

  @override
  String toString() {
    return 'EventManagementEvent.refreshEvents(organizerId: $organizerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshEventsImpl &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizerId);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshEventsImplCopyWith<_$RefreshEventsImpl> get copyWith =>
      __$$RefreshEventsImplCopyWithImpl<_$RefreshEventsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return refreshEvents(organizerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return refreshEvents?.call(organizerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (refreshEvents != null) {
      return refreshEvents(organizerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return refreshEvents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return refreshEvents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (refreshEvents != null) {
      return refreshEvents(this);
    }
    return orElse();
  }
}

abstract class _RefreshEvents implements EventManagementEvent {
  const factory _RefreshEvents({required final String organizerId}) =
      _$RefreshEventsImpl;

  String get organizerId;

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshEventsImplCopyWith<_$RefreshEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
          _$ClearErrorImpl value, $Res Function(_$ClearErrorImpl) then) =
      __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$EventManagementEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
      _$ClearErrorImpl _value, $Res Function(_$ClearErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearErrorImpl implements _ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'EventManagementEvent.clearError()';
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
    required TResult Function(String organizerId, CreateEventRequest request)
        createEvent,
    required TResult Function(String organizerId, EventStatus? status,
            int? limit, String? lastEventId)
        loadOrganizerEvents,
    required TResult Function(String eventId) loadEventById,
    required TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)
        updateEvent,
    required TResult Function(String eventId, String organizerId) deleteEvent,
    required TResult Function(
            String eventId, String organizerId, String cancellationReason)
        cancelEvent,
    required TResult Function(String eventId, String organizerId,
            String newTitle, DateTime newDateTime)
        duplicateEvent,
    required TResult Function(
            String organizerId,
            String query,
            EventStatus? status,
            DateTime? startDate,
            DateTime? endDate,
            int? limit)
        searchEvents,
    required TResult Function(String eventId, String organizerId)
        loadEventStatistics,
    required TResult Function(String eventId, String imagePath)
        uploadEventBanner,
    required TResult Function(String eventId, String bannerUrl)
        deleteEventBanner,
    required TResult Function(String organizerId) refreshEvents,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult? Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult? Function(String eventId)? loadEventById,
    TResult? Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult? Function(String eventId, String organizerId)? deleteEvent,
    TResult? Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult? Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult? Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult? Function(String eventId, String organizerId)? loadEventStatistics,
    TResult? Function(String eventId, String imagePath)? uploadEventBanner,
    TResult? Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult? Function(String organizerId)? refreshEvents,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String organizerId, CreateEventRequest request)?
        createEvent,
    TResult Function(String organizerId, EventStatus? status, int? limit,
            String? lastEventId)?
        loadOrganizerEvents,
    TResult Function(String eventId)? loadEventById,
    TResult Function(
            String eventId, String organizerId, UpdateEventRequest request)?
        updateEvent,
    TResult Function(String eventId, String organizerId)? deleteEvent,
    TResult Function(
            String eventId, String organizerId, String cancellationReason)?
        cancelEvent,
    TResult Function(String eventId, String organizerId, String newTitle,
            DateTime newDateTime)?
        duplicateEvent,
    TResult Function(String organizerId, String query, EventStatus? status,
            DateTime? startDate, DateTime? endDate, int? limit)?
        searchEvents,
    TResult Function(String eventId, String organizerId)? loadEventStatistics,
    TResult Function(String eventId, String imagePath)? uploadEventBanner,
    TResult Function(String eventId, String bannerUrl)? deleteEventBanner,
    TResult Function(String organizerId)? refreshEvents,
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
    required TResult Function(_CreateEvent value) createEvent,
    required TResult Function(_LoadOrganizerEvents value) loadOrganizerEvents,
    required TResult Function(_LoadEventById value) loadEventById,
    required TResult Function(_UpdateEvent value) updateEvent,
    required TResult Function(_DeleteEvent value) deleteEvent,
    required TResult Function(_CancelEvent value) cancelEvent,
    required TResult Function(_DuplicateEvent value) duplicateEvent,
    required TResult Function(_SearchEvents value) searchEvents,
    required TResult Function(_LoadEventStatistics value) loadEventStatistics,
    required TResult Function(_UploadEventBanner value) uploadEventBanner,
    required TResult Function(_DeleteEventBanner value) deleteEventBanner,
    required TResult Function(_RefreshEvents value) refreshEvents,
    required TResult Function(_ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateEvent value)? createEvent,
    TResult? Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult? Function(_LoadEventById value)? loadEventById,
    TResult? Function(_UpdateEvent value)? updateEvent,
    TResult? Function(_DeleteEvent value)? deleteEvent,
    TResult? Function(_CancelEvent value)? cancelEvent,
    TResult? Function(_DuplicateEvent value)? duplicateEvent,
    TResult? Function(_SearchEvents value)? searchEvents,
    TResult? Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult? Function(_UploadEventBanner value)? uploadEventBanner,
    TResult? Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult? Function(_RefreshEvents value)? refreshEvents,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateEvent value)? createEvent,
    TResult Function(_LoadOrganizerEvents value)? loadOrganizerEvents,
    TResult Function(_LoadEventById value)? loadEventById,
    TResult Function(_UpdateEvent value)? updateEvent,
    TResult Function(_DeleteEvent value)? deleteEvent,
    TResult Function(_CancelEvent value)? cancelEvent,
    TResult Function(_DuplicateEvent value)? duplicateEvent,
    TResult Function(_SearchEvents value)? searchEvents,
    TResult Function(_LoadEventStatistics value)? loadEventStatistics,
    TResult Function(_UploadEventBanner value)? uploadEventBanner,
    TResult Function(_DeleteEventBanner value)? deleteEventBanner,
    TResult Function(_RefreshEvents value)? refreshEvents,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements EventManagementEvent {
  const factory _ClearError() = _$ClearErrorImpl;
}

/// @nodoc
mixin _$EventManagementState {
  List<EventEntity> get events => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isCreating => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  EventEntity? get selectedEvent => throw _privateConstructorUsedError;
  EventStatistics? get statistics => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  EventStatus? get filterStatus => throw _privateConstructorUsedError;
  DateTime? get filterStartDate => throw _privateConstructorUsedError;
  DateTime? get filterEndDate => throw _privateConstructorUsedError;
  String? get uploadedBannerUrl => throw _privateConstructorUsedError;

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventManagementStateCopyWith<EventManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventManagementStateCopyWith<$Res> {
  factory $EventManagementStateCopyWith(EventManagementState value,
          $Res Function(EventManagementState) then) =
      _$EventManagementStateCopyWithImpl<$Res, EventManagementState>;
  @useResult
  $Res call(
      {List<EventEntity> events,
      bool isLoading,
      bool isCreating,
      bool isUpdating,
      bool isDeleting,
      bool hasError,
      String errorMessage,
      EventEntity? selectedEvent,
      EventStatistics? statistics,
      String searchQuery,
      EventStatus? filterStatus,
      DateTime? filterStartDate,
      DateTime? filterEndDate,
      String? uploadedBannerUrl});

  $EventEntityCopyWith<$Res>? get selectedEvent;
  $EventStatisticsCopyWith<$Res>? get statistics;
}

/// @nodoc
class _$EventManagementStateCopyWithImpl<$Res,
        $Val extends EventManagementState>
    implements $EventManagementStateCopyWith<$Res> {
  _$EventManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? isLoading = null,
    Object? isCreating = null,
    Object? isUpdating = null,
    Object? isDeleting = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedEvent = freezed,
    Object? statistics = freezed,
    Object? searchQuery = null,
    Object? filterStatus = freezed,
    Object? filterStartDate = freezed,
    Object? filterEndDate = freezed,
    Object? uploadedBannerUrl = freezed,
  }) {
    return _then(_value.copyWith(
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedEvent: freezed == selectedEvent
          ? _value.selectedEvent
          : selectedEvent // ignore: cast_nullable_to_non_nullable
              as EventEntity?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as EventStatistics?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as EventStatus?,
      filterStartDate: freezed == filterStartDate
          ? _value.filterStartDate
          : filterStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filterEndDate: freezed == filterEndDate
          ? _value.filterEndDate
          : filterEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadedBannerUrl: freezed == uploadedBannerUrl
          ? _value.uploadedBannerUrl
          : uploadedBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventEntityCopyWith<$Res>? get selectedEvent {
    if (_value.selectedEvent == null) {
      return null;
    }

    return $EventEntityCopyWith<$Res>(_value.selectedEvent!, (value) {
      return _then(_value.copyWith(selectedEvent: value) as $Val);
    });
  }

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventStatisticsCopyWith<$Res>? get statistics {
    if (_value.statistics == null) {
      return null;
    }

    return $EventStatisticsCopyWith<$Res>(_value.statistics!, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventManagementStateImplCopyWith<$Res>
    implements $EventManagementStateCopyWith<$Res> {
  factory _$$EventManagementStateImplCopyWith(_$EventManagementStateImpl value,
          $Res Function(_$EventManagementStateImpl) then) =
      __$$EventManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<EventEntity> events,
      bool isLoading,
      bool isCreating,
      bool isUpdating,
      bool isDeleting,
      bool hasError,
      String errorMessage,
      EventEntity? selectedEvent,
      EventStatistics? statistics,
      String searchQuery,
      EventStatus? filterStatus,
      DateTime? filterStartDate,
      DateTime? filterEndDate,
      String? uploadedBannerUrl});

  @override
  $EventEntityCopyWith<$Res>? get selectedEvent;
  @override
  $EventStatisticsCopyWith<$Res>? get statistics;
}

/// @nodoc
class __$$EventManagementStateImplCopyWithImpl<$Res>
    extends _$EventManagementStateCopyWithImpl<$Res, _$EventManagementStateImpl>
    implements _$$EventManagementStateImplCopyWith<$Res> {
  __$$EventManagementStateImplCopyWithImpl(_$EventManagementStateImpl _value,
      $Res Function(_$EventManagementStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = null,
    Object? isLoading = null,
    Object? isCreating = null,
    Object? isUpdating = null,
    Object? isDeleting = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedEvent = freezed,
    Object? statistics = freezed,
    Object? searchQuery = null,
    Object? filterStatus = freezed,
    Object? filterStartDate = freezed,
    Object? filterEndDate = freezed,
    Object? uploadedBannerUrl = freezed,
  }) {
    return _then(_$EventManagementStateImpl(
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<EventEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedEvent: freezed == selectedEvent
          ? _value.selectedEvent
          : selectedEvent // ignore: cast_nullable_to_non_nullable
              as EventEntity?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as EventStatistics?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as EventStatus?,
      filterStartDate: freezed == filterStartDate
          ? _value.filterStartDate
          : filterStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      filterEndDate: freezed == filterEndDate
          ? _value.filterEndDate
          : filterEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      uploadedBannerUrl: freezed == uploadedBannerUrl
          ? _value.uploadedBannerUrl
          : uploadedBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EventManagementStateImpl implements _EventManagementState {
  const _$EventManagementStateImpl(
      {final List<EventEntity> events = const [],
      this.isLoading = false,
      this.isCreating = false,
      this.isUpdating = false,
      this.isDeleting = false,
      this.hasError = false,
      this.errorMessage = '',
      this.selectedEvent,
      this.statistics,
      this.searchQuery = '',
      this.filterStatus,
      this.filterStartDate,
      this.filterEndDate,
      this.uploadedBannerUrl})
      : _events = events;

  final List<EventEntity> _events;
  @override
  @JsonKey()
  List<EventEntity> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isCreating;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final EventEntity? selectedEvent;
  @override
  final EventStatistics? statistics;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  final EventStatus? filterStatus;
  @override
  final DateTime? filterStartDate;
  @override
  final DateTime? filterEndDate;
  @override
  final String? uploadedBannerUrl;

  @override
  String toString() {
    return 'EventManagementState(events: $events, isLoading: $isLoading, isCreating: $isCreating, isUpdating: $isUpdating, isDeleting: $isDeleting, hasError: $hasError, errorMessage: $errorMessage, selectedEvent: $selectedEvent, statistics: $statistics, searchQuery: $searchQuery, filterStatus: $filterStatus, filterStartDate: $filterStartDate, filterEndDate: $filterEndDate, uploadedBannerUrl: $uploadedBannerUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventManagementStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedEvent, selectedEvent) ||
                other.selectedEvent == selectedEvent) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus) &&
            (identical(other.filterStartDate, filterStartDate) ||
                other.filterStartDate == filterStartDate) &&
            (identical(other.filterEndDate, filterEndDate) ||
                other.filterEndDate == filterEndDate) &&
            (identical(other.uploadedBannerUrl, uploadedBannerUrl) ||
                other.uploadedBannerUrl == uploadedBannerUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_events),
      isLoading,
      isCreating,
      isUpdating,
      isDeleting,
      hasError,
      errorMessage,
      selectedEvent,
      statistics,
      searchQuery,
      filterStatus,
      filterStartDate,
      filterEndDate,
      uploadedBannerUrl);

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventManagementStateImplCopyWith<_$EventManagementStateImpl>
      get copyWith =>
          __$$EventManagementStateImplCopyWithImpl<_$EventManagementStateImpl>(
              this, _$identity);
}

abstract class _EventManagementState implements EventManagementState {
  const factory _EventManagementState(
      {final List<EventEntity> events,
      final bool isLoading,
      final bool isCreating,
      final bool isUpdating,
      final bool isDeleting,
      final bool hasError,
      final String errorMessage,
      final EventEntity? selectedEvent,
      final EventStatistics? statistics,
      final String searchQuery,
      final EventStatus? filterStatus,
      final DateTime? filterStartDate,
      final DateTime? filterEndDate,
      final String? uploadedBannerUrl}) = _$EventManagementStateImpl;

  @override
  List<EventEntity> get events;
  @override
  bool get isLoading;
  @override
  bool get isCreating;
  @override
  bool get isUpdating;
  @override
  bool get isDeleting;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  EventEntity? get selectedEvent;
  @override
  EventStatistics? get statistics;
  @override
  String get searchQuery;
  @override
  EventStatus? get filterStatus;
  @override
  DateTime? get filterStartDate;
  @override
  DateTime? get filterEndDate;
  @override
  String? get uploadedBannerUrl;

  /// Create a copy of EventManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventManagementStateImplCopyWith<_$EventManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
