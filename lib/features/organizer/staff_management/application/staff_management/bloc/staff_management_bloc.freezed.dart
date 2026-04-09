// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StaffManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffManagementEventCopyWith<$Res> {
  factory $StaffManagementEventCopyWith(StaffManagementEvent value,
          $Res Function(StaffManagementEvent) then) =
      _$StaffManagementEventCopyWithImpl<$Res, StaffManagementEvent>;
}

/// @nodoc
class _$StaffManagementEventCopyWithImpl<$Res,
        $Val extends StaffManagementEvent>
    implements $StaffManagementEventCopyWith<$Res> {
  _$StaffManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadEventStaffImplCopyWith<$Res> {
  factory _$$LoadEventStaffImplCopyWith(_$LoadEventStaffImpl value,
          $Res Function(_$LoadEventStaffImpl) then) =
      __$$LoadEventStaffImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String eventId, StaffRole? role, int? limit, String? lastStaffId});
}

/// @nodoc
class __$$LoadEventStaffImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$LoadEventStaffImpl>
    implements _$$LoadEventStaffImplCopyWith<$Res> {
  __$$LoadEventStaffImplCopyWithImpl(
      _$LoadEventStaffImpl _value, $Res Function(_$LoadEventStaffImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eventId = null,
    Object? role = freezed,
    Object? limit = freezed,
    Object? lastStaffId = freezed,
  }) {
    return _then(_$LoadEventStaffImpl(
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as StaffRole?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      lastStaffId: freezed == lastStaffId
          ? _value.lastStaffId
          : lastStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadEventStaffImpl implements _LoadEventStaff {
  const _$LoadEventStaffImpl(
      {required this.eventId, this.role, this.limit, this.lastStaffId});

  @override
  final String eventId;
  @override
  final StaffRole? role;
  @override
  final int? limit;
  @override
  final String? lastStaffId;

  @override
  String toString() {
    return 'StaffManagementEvent.loadEventStaff(eventId: $eventId, role: $role, limit: $limit, lastStaffId: $lastStaffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadEventStaffImpl &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.lastStaffId, lastStaffId) ||
                other.lastStaffId == lastStaffId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, eventId, role, limit, lastStaffId);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadEventStaffImplCopyWith<_$LoadEventStaffImpl> get copyWith =>
      __$$LoadEventStaffImplCopyWithImpl<_$LoadEventStaffImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return loadEventStaff(eventId, role, limit, lastStaffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return loadEventStaff?.call(eventId, role, limit, lastStaffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadEventStaff != null) {
      return loadEventStaff(eventId, role, limit, lastStaffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadEventStaff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadEventStaff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadEventStaff != null) {
      return loadEventStaff(this);
    }
    return orElse();
  }
}

abstract class _LoadEventStaff implements StaffManagementEvent {
  const factory _LoadEventStaff(
      {required final String eventId,
      final StaffRole? role,
      final int? limit,
      final String? lastStaffId}) = _$LoadEventStaffImpl;

  String get eventId;
  StaffRole? get role;
  int? get limit;
  String? get lastStaffId;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadEventStaffImplCopyWith<_$LoadEventStaffImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadOrganizerStaffImplCopyWith<$Res> {
  factory _$$LoadOrganizerStaffImplCopyWith(_$LoadOrganizerStaffImpl value,
          $Res Function(_$LoadOrganizerStaffImpl) then) =
      __$$LoadOrganizerStaffImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String organizerId,
      StaffStatus? status,
      int? limit,
      String? lastStaffId});
}

/// @nodoc
class __$$LoadOrganizerStaffImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$LoadOrganizerStaffImpl>
    implements _$$LoadOrganizerStaffImplCopyWith<$Res> {
  __$$LoadOrganizerStaffImplCopyWithImpl(_$LoadOrganizerStaffImpl _value,
      $Res Function(_$LoadOrganizerStaffImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
    Object? status = freezed,
    Object? limit = freezed,
    Object? lastStaffId = freezed,
  }) {
    return _then(_$LoadOrganizerStaffImpl(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StaffStatus?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      lastStaffId: freezed == lastStaffId
          ? _value.lastStaffId
          : lastStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadOrganizerStaffImpl implements _LoadOrganizerStaff {
  const _$LoadOrganizerStaffImpl(
      {required this.organizerId, this.status, this.limit, this.lastStaffId});

  @override
  final String organizerId;
  @override
  final StaffStatus? status;
  @override
  final int? limit;
  @override
  final String? lastStaffId;

  @override
  String toString() {
    return 'StaffManagementEvent.loadOrganizerStaff(organizerId: $organizerId, status: $status, limit: $limit, lastStaffId: $lastStaffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadOrganizerStaffImpl &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.lastStaffId, lastStaffId) ||
                other.lastStaffId == lastStaffId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, organizerId, status, limit, lastStaffId);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadOrganizerStaffImplCopyWith<_$LoadOrganizerStaffImpl> get copyWith =>
      __$$LoadOrganizerStaffImplCopyWithImpl<_$LoadOrganizerStaffImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return loadOrganizerStaff(organizerId, status, limit, lastStaffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return loadOrganizerStaff?.call(organizerId, status, limit, lastStaffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadOrganizerStaff != null) {
      return loadOrganizerStaff(organizerId, status, limit, lastStaffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadOrganizerStaff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadOrganizerStaff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadOrganizerStaff != null) {
      return loadOrganizerStaff(this);
    }
    return orElse();
  }
}

abstract class _LoadOrganizerStaff implements StaffManagementEvent {
  const factory _LoadOrganizerStaff(
      {required final String organizerId,
      final StaffStatus? status,
      final int? limit,
      final String? lastStaffId}) = _$LoadOrganizerStaffImpl;

  String get organizerId;
  StaffStatus? get status;
  int? get limit;
  String? get lastStaffId;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadOrganizerStaffImplCopyWith<_$LoadOrganizerStaffImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchStaffImplCopyWith<$Res> {
  factory _$$SearchStaffImplCopyWith(
          _$SearchStaffImpl value, $Res Function(_$SearchStaffImpl) then) =
      __$$SearchStaffImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String query,
      String organizerId,
      String? eventId,
      StaffRole? role,
      StaffStatus? status,
      int? limit});
}

/// @nodoc
class __$$SearchStaffImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$SearchStaffImpl>
    implements _$$SearchStaffImplCopyWith<$Res> {
  __$$SearchStaffImplCopyWithImpl(
      _$SearchStaffImpl _value, $Res Function(_$SearchStaffImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? organizerId = null,
    Object? eventId = freezed,
    Object? role = freezed,
    Object? status = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$SearchStaffImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as StaffRole?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StaffStatus?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SearchStaffImpl implements _SearchStaff {
  const _$SearchStaffImpl(
      {required this.query,
      required this.organizerId,
      this.eventId,
      this.role,
      this.status,
      this.limit});

  @override
  final String query;
  @override
  final String organizerId;
  @override
  final String? eventId;
  @override
  final StaffRole? role;
  @override
  final StaffStatus? status;
  @override
  final int? limit;

  @override
  String toString() {
    return 'StaffManagementEvent.searchStaff(query: $query, organizerId: $organizerId, eventId: $eventId, role: $role, status: $status, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStaffImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, query, organizerId, eventId, role, status, limit);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStaffImplCopyWith<_$SearchStaffImpl> get copyWith =>
      __$$SearchStaffImplCopyWithImpl<_$SearchStaffImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return searchStaff(query, organizerId, eventId, role, status, limit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return searchStaff?.call(query, organizerId, eventId, role, status, limit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (searchStaff != null) {
      return searchStaff(query, organizerId, eventId, role, status, limit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return searchStaff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return searchStaff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (searchStaff != null) {
      return searchStaff(this);
    }
    return orElse();
  }
}

abstract class _SearchStaff implements StaffManagementEvent {
  const factory _SearchStaff(
      {required final String query,
      required final String organizerId,
      final String? eventId,
      final StaffRole? role,
      final StaffStatus? status,
      final int? limit}) = _$SearchStaffImpl;

  String get query;
  String get organizerId;
  String? get eventId;
  StaffRole? get role;
  StaffStatus? get status;
  int? get limit;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStaffImplCopyWith<_$SearchStaffImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadStaffDetailsImplCopyWith<$Res> {
  factory _$$LoadStaffDetailsImplCopyWith(_$LoadStaffDetailsImpl value,
          $Res Function(_$LoadStaffDetailsImpl) then) =
      __$$LoadStaffDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId, String organizerId});
}

/// @nodoc
class __$$LoadStaffDetailsImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$LoadStaffDetailsImpl>
    implements _$$LoadStaffDetailsImplCopyWith<$Res> {
  __$$LoadStaffDetailsImplCopyWithImpl(_$LoadStaffDetailsImpl _value,
      $Res Function(_$LoadStaffDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? organizerId = null,
  }) {
    return _then(_$LoadStaffDetailsImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadStaffDetailsImpl implements _LoadStaffDetails {
  const _$LoadStaffDetailsImpl(
      {required this.staffId, required this.organizerId});

  @override
  final String staffId;
  @override
  final String organizerId;

  @override
  String toString() {
    return 'StaffManagementEvent.loadStaffDetails(staffId: $staffId, organizerId: $organizerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadStaffDetailsImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, organizerId);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadStaffDetailsImplCopyWith<_$LoadStaffDetailsImpl> get copyWith =>
      __$$LoadStaffDetailsImplCopyWithImpl<_$LoadStaffDetailsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return loadStaffDetails(staffId, organizerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return loadStaffDetails?.call(staffId, organizerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (loadStaffDetails != null) {
      return loadStaffDetails(staffId, organizerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return loadStaffDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return loadStaffDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (loadStaffDetails != null) {
      return loadStaffDetails(this);
    }
    return orElse();
  }
}

abstract class _LoadStaffDetails implements StaffManagementEvent {
  const factory _LoadStaffDetails(
      {required final String staffId,
      required final String organizerId}) = _$LoadStaffDetailsImpl;

  String get staffId;
  String get organizerId;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadStaffDetailsImplCopyWith<_$LoadStaffDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InviteStaffImplCopyWith<$Res> {
  factory _$$InviteStaffImplCopyWith(
          _$InviteStaffImpl value, $Res Function(_$InviteStaffImpl) then) =
      __$$InviteStaffImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String organizerId,
      String email,
      StaffRole role,
      List<String> permissions,
      List<String>? eventIds});
}

/// @nodoc
class __$$InviteStaffImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$InviteStaffImpl>
    implements _$$InviteStaffImplCopyWith<$Res> {
  __$$InviteStaffImplCopyWithImpl(
      _$InviteStaffImpl _value, $Res Function(_$InviteStaffImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerId = null,
    Object? email = null,
    Object? role = null,
    Object? permissions = null,
    Object? eventIds = freezed,
  }) {
    return _then(_$InviteStaffImpl(
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as StaffRole,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      eventIds: freezed == eventIds
          ? _value._eventIds
          : eventIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$InviteStaffImpl implements _InviteStaff {
  const _$InviteStaffImpl(
      {required this.organizerId,
      required this.email,
      required this.role,
      required final List<String> permissions,
      final List<String>? eventIds})
      : _permissions = permissions,
        _eventIds = eventIds;

  @override
  final String organizerId;
  @override
  final String email;
  @override
  final StaffRole role;
  final List<String> _permissions;
  @override
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  final List<String>? _eventIds;
  @override
  List<String>? get eventIds {
    final value = _eventIds;
    if (value == null) return null;
    if (_eventIds is EqualUnmodifiableListView) return _eventIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StaffManagementEvent.inviteStaff(organizerId: $organizerId, email: $email, role: $role, permissions: $permissions, eventIds: $eventIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InviteStaffImpl &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions) &&
            const DeepCollectionEquality().equals(other._eventIds, _eventIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      organizerId,
      email,
      role,
      const DeepCollectionEquality().hash(_permissions),
      const DeepCollectionEquality().hash(_eventIds));

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InviteStaffImplCopyWith<_$InviteStaffImpl> get copyWith =>
      __$$InviteStaffImplCopyWithImpl<_$InviteStaffImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return inviteStaff(organizerId, email, role, permissions, eventIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return inviteStaff?.call(organizerId, email, role, permissions, eventIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (inviteStaff != null) {
      return inviteStaff(organizerId, email, role, permissions, eventIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return inviteStaff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return inviteStaff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (inviteStaff != null) {
      return inviteStaff(this);
    }
    return orElse();
  }
}

abstract class _InviteStaff implements StaffManagementEvent {
  const factory _InviteStaff(
      {required final String organizerId,
      required final String email,
      required final StaffRole role,
      required final List<String> permissions,
      final List<String>? eventIds}) = _$InviteStaffImpl;

  String get organizerId;
  String get email;
  StaffRole get role;
  List<String> get permissions;
  List<String>? get eventIds;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InviteStaffImplCopyWith<_$InviteStaffImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateStaffRoleImplCopyWith<$Res> {
  factory _$$UpdateStaffRoleImplCopyWith(_$UpdateStaffRoleImpl value,
          $Res Function(_$UpdateStaffRoleImpl) then) =
      __$$UpdateStaffRoleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId, String organizerId, StaffRole newRole});
}

/// @nodoc
class __$$UpdateStaffRoleImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$UpdateStaffRoleImpl>
    implements _$$UpdateStaffRoleImplCopyWith<$Res> {
  __$$UpdateStaffRoleImplCopyWithImpl(
      _$UpdateStaffRoleImpl _value, $Res Function(_$UpdateStaffRoleImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? organizerId = null,
    Object? newRole = null,
  }) {
    return _then(_$UpdateStaffRoleImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      newRole: null == newRole
          ? _value.newRole
          : newRole // ignore: cast_nullable_to_non_nullable
              as StaffRole,
    ));
  }
}

/// @nodoc

class _$UpdateStaffRoleImpl implements _UpdateStaffRole {
  const _$UpdateStaffRoleImpl(
      {required this.staffId,
      required this.organizerId,
      required this.newRole});

  @override
  final String staffId;
  @override
  final String organizerId;
  @override
  final StaffRole newRole;

  @override
  String toString() {
    return 'StaffManagementEvent.updateStaffRole(staffId: $staffId, organizerId: $organizerId, newRole: $newRole)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStaffRoleImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.newRole, newRole) || other.newRole == newRole));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, organizerId, newRole);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStaffRoleImplCopyWith<_$UpdateStaffRoleImpl> get copyWith =>
      __$$UpdateStaffRoleImplCopyWithImpl<_$UpdateStaffRoleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return updateStaffRole(staffId, organizerId, newRole);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return updateStaffRole?.call(staffId, organizerId, newRole);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (updateStaffRole != null) {
      return updateStaffRole(staffId, organizerId, newRole);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return updateStaffRole(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return updateStaffRole?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (updateStaffRole != null) {
      return updateStaffRole(this);
    }
    return orElse();
  }
}

abstract class _UpdateStaffRole implements StaffManagementEvent {
  const factory _UpdateStaffRole(
      {required final String staffId,
      required final String organizerId,
      required final StaffRole newRole}) = _$UpdateStaffRoleImpl;

  String get staffId;
  String get organizerId;
  StaffRole get newRole;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStaffRoleImplCopyWith<_$UpdateStaffRoleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssignStaffToEventImplCopyWith<$Res> {
  factory _$$AssignStaffToEventImplCopyWith(_$AssignStaffToEventImpl value,
          $Res Function(_$AssignStaffToEventImpl) then) =
      __$$AssignStaffToEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String staffId,
      String eventId,
      StaffRole role,
      List<String> permissions});
}

/// @nodoc
class __$$AssignStaffToEventImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$AssignStaffToEventImpl>
    implements _$$AssignStaffToEventImplCopyWith<$Res> {
  __$$AssignStaffToEventImplCopyWithImpl(_$AssignStaffToEventImpl _value,
      $Res Function(_$AssignStaffToEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? eventId = null,
    Object? role = null,
    Object? permissions = null,
  }) {
    return _then(_$AssignStaffToEventImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as StaffRole,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$AssignStaffToEventImpl implements _AssignStaffToEvent {
  const _$AssignStaffToEventImpl(
      {required this.staffId,
      required this.eventId,
      required this.role,
      required final List<String> permissions})
      : _permissions = permissions;

  @override
  final String staffId;
  @override
  final String eventId;
  @override
  final StaffRole role;
  final List<String> _permissions;
  @override
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString() {
    return 'StaffManagementEvent.assignStaffToEvent(staffId: $staffId, eventId: $eventId, role: $role, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignStaffToEventImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.role, role) || other.role == role) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, eventId, role,
      const DeepCollectionEquality().hash(_permissions));

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignStaffToEventImplCopyWith<_$AssignStaffToEventImpl> get copyWith =>
      __$$AssignStaffToEventImplCopyWithImpl<_$AssignStaffToEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return assignStaffToEvent(staffId, eventId, role, permissions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return assignStaffToEvent?.call(staffId, eventId, role, permissions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (assignStaffToEvent != null) {
      return assignStaffToEvent(staffId, eventId, role, permissions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return assignStaffToEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return assignStaffToEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (assignStaffToEvent != null) {
      return assignStaffToEvent(this);
    }
    return orElse();
  }
}

abstract class _AssignStaffToEvent implements StaffManagementEvent {
  const factory _AssignStaffToEvent(
      {required final String staffId,
      required final String eventId,
      required final StaffRole role,
      required final List<String> permissions}) = _$AssignStaffToEventImpl;

  String get staffId;
  String get eventId;
  StaffRole get role;
  List<String> get permissions;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssignStaffToEventImplCopyWith<_$AssignStaffToEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveStaffFromEventImplCopyWith<$Res> {
  factory _$$RemoveStaffFromEventImplCopyWith(_$RemoveStaffFromEventImpl value,
          $Res Function(_$RemoveStaffFromEventImpl) then) =
      __$$RemoveStaffFromEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId, String eventId, String? reason});
}

/// @nodoc
class __$$RemoveStaffFromEventImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$RemoveStaffFromEventImpl>
    implements _$$RemoveStaffFromEventImplCopyWith<$Res> {
  __$$RemoveStaffFromEventImplCopyWithImpl(_$RemoveStaffFromEventImpl _value,
      $Res Function(_$RemoveStaffFromEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? eventId = null,
    Object? reason = freezed,
  }) {
    return _then(_$RemoveStaffFromEventImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RemoveStaffFromEventImpl implements _RemoveStaffFromEvent {
  const _$RemoveStaffFromEventImpl(
      {required this.staffId, required this.eventId, this.reason});

  @override
  final String staffId;
  @override
  final String eventId;
  @override
  final String? reason;

  @override
  String toString() {
    return 'StaffManagementEvent.removeStaffFromEvent(staffId: $staffId, eventId: $eventId, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveStaffFromEventImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, eventId, reason);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveStaffFromEventImplCopyWith<_$RemoveStaffFromEventImpl>
      get copyWith =>
          __$$RemoveStaffFromEventImplCopyWithImpl<_$RemoveStaffFromEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return removeStaffFromEvent(staffId, eventId, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return removeStaffFromEvent?.call(staffId, eventId, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (removeStaffFromEvent != null) {
      return removeStaffFromEvent(staffId, eventId, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return removeStaffFromEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return removeStaffFromEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (removeStaffFromEvent != null) {
      return removeStaffFromEvent(this);
    }
    return orElse();
  }
}

abstract class _RemoveStaffFromEvent implements StaffManagementEvent {
  const factory _RemoveStaffFromEvent(
      {required final String staffId,
      required final String eventId,
      final String? reason}) = _$RemoveStaffFromEventImpl;

  String get staffId;
  String get eventId;
  String? get reason;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveStaffFromEventImplCopyWith<_$RemoveStaffFromEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateStaffPermissionsImplCopyWith<$Res> {
  factory _$$UpdateStaffPermissionsImplCopyWith(
          _$UpdateStaffPermissionsImpl value,
          $Res Function(_$UpdateStaffPermissionsImpl) then) =
      __$$UpdateStaffPermissionsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId, String organizerId, List<String> permissions});
}

/// @nodoc
class __$$UpdateStaffPermissionsImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res,
        _$UpdateStaffPermissionsImpl>
    implements _$$UpdateStaffPermissionsImplCopyWith<$Res> {
  __$$UpdateStaffPermissionsImplCopyWithImpl(
      _$UpdateStaffPermissionsImpl _value,
      $Res Function(_$UpdateStaffPermissionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? organizerId = null,
    Object? permissions = null,
  }) {
    return _then(_$UpdateStaffPermissionsImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: null == permissions
          ? _value._permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$UpdateStaffPermissionsImpl implements _UpdateStaffPermissions {
  const _$UpdateStaffPermissionsImpl(
      {required this.staffId,
      required this.organizerId,
      required final List<String> permissions})
      : _permissions = permissions;

  @override
  final String staffId;
  @override
  final String organizerId;
  final List<String> _permissions;
  @override
  List<String> get permissions {
    if (_permissions is EqualUnmodifiableListView) return _permissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_permissions);
  }

  @override
  String toString() {
    return 'StaffManagementEvent.updateStaffPermissions(staffId: $staffId, organizerId: $organizerId, permissions: $permissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStaffPermissionsImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            const DeepCollectionEquality()
                .equals(other._permissions, _permissions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, organizerId,
      const DeepCollectionEquality().hash(_permissions));

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStaffPermissionsImplCopyWith<_$UpdateStaffPermissionsImpl>
      get copyWith => __$$UpdateStaffPermissionsImplCopyWithImpl<
          _$UpdateStaffPermissionsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return updateStaffPermissions(staffId, organizerId, permissions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return updateStaffPermissions?.call(staffId, organizerId, permissions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (updateStaffPermissions != null) {
      return updateStaffPermissions(staffId, organizerId, permissions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return updateStaffPermissions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return updateStaffPermissions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (updateStaffPermissions != null) {
      return updateStaffPermissions(this);
    }
    return orElse();
  }
}

abstract class _UpdateStaffPermissions implements StaffManagementEvent {
  const factory _UpdateStaffPermissions(
      {required final String staffId,
      required final String organizerId,
      required final List<String> permissions}) = _$UpdateStaffPermissionsImpl;

  String get staffId;
  String get organizerId;
  List<String> get permissions;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStaffPermissionsImplCopyWith<_$UpdateStaffPermissionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeactivateStaffImplCopyWith<$Res> {
  factory _$$DeactivateStaffImplCopyWith(_$DeactivateStaffImpl value,
          $Res Function(_$DeactivateStaffImpl) then) =
      __$$DeactivateStaffImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId, String organizerId, String? reason});
}

/// @nodoc
class __$$DeactivateStaffImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$DeactivateStaffImpl>
    implements _$$DeactivateStaffImplCopyWith<$Res> {
  __$$DeactivateStaffImplCopyWithImpl(
      _$DeactivateStaffImpl _value, $Res Function(_$DeactivateStaffImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
    Object? organizerId = null,
    Object? reason = freezed,
  }) {
    return _then(_$DeactivateStaffImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerId: null == organizerId
          ? _value.organizerId
          : organizerId // ignore: cast_nullable_to_non_nullable
              as String,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DeactivateStaffImpl implements _DeactivateStaff {
  const _$DeactivateStaffImpl(
      {required this.staffId, required this.organizerId, this.reason});

  @override
  final String staffId;
  @override
  final String organizerId;
  @override
  final String? reason;

  @override
  String toString() {
    return 'StaffManagementEvent.deactivateStaff(staffId: $staffId, organizerId: $organizerId, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeactivateStaffImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId, organizerId, reason);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeactivateStaffImplCopyWith<_$DeactivateStaffImpl> get copyWith =>
      __$$DeactivateStaffImplCopyWithImpl<_$DeactivateStaffImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return deactivateStaff(staffId, organizerId, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return deactivateStaff?.call(staffId, organizerId, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (deactivateStaff != null) {
      return deactivateStaff(staffId, organizerId, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return deactivateStaff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return deactivateStaff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (deactivateStaff != null) {
      return deactivateStaff(this);
    }
    return orElse();
  }
}

abstract class _DeactivateStaff implements StaffManagementEvent {
  const factory _DeactivateStaff(
      {required final String staffId,
      required final String organizerId,
      final String? reason}) = _$DeactivateStaffImpl;

  String get staffId;
  String get organizerId;
  String? get reason;

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeactivateStaffImplCopyWith<_$DeactivateStaffImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshStaffImplCopyWith<$Res> {
  factory _$$RefreshStaffImplCopyWith(
          _$RefreshStaffImpl value, $Res Function(_$RefreshStaffImpl) then) =
      __$$RefreshStaffImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshStaffImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$RefreshStaffImpl>
    implements _$$RefreshStaffImplCopyWith<$Res> {
  __$$RefreshStaffImplCopyWithImpl(
      _$RefreshStaffImpl _value, $Res Function(_$RefreshStaffImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshStaffImpl implements _RefreshStaff {
  const _$RefreshStaffImpl();

  @override
  String toString() {
    return 'StaffManagementEvent.refreshStaff()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshStaffImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return refreshStaff();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return refreshStaff?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (refreshStaff != null) {
      return refreshStaff();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return refreshStaff(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return refreshStaff?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (refreshStaff != null) {
      return refreshStaff(this);
    }
    return orElse();
  }
}

abstract class _RefreshStaff implements StaffManagementEvent {
  const factory _RefreshStaff() = _$RefreshStaffImpl;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
          _$ClearErrorImpl value, $Res Function(_$ClearErrorImpl) then) =
      __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$StaffManagementEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
      _$ClearErrorImpl _value, $Res Function(_$ClearErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearErrorImpl implements _ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'StaffManagementEvent.clearError()';
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
    required TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)
        loadEventStaff,
    required TResult Function(String organizerId, StaffStatus? status,
            int? limit, String? lastStaffId)
        loadOrganizerStaff,
    required TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)
        searchStaff,
    required TResult Function(String staffId, String organizerId)
        loadStaffDetails,
    required TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)
        inviteStaff,
    required TResult Function(
            String staffId, String organizerId, StaffRole newRole)
        updateStaffRole,
    required TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)
        assignStaffToEvent,
    required TResult Function(String staffId, String eventId, String? reason)
        removeStaffFromEvent,
    required TResult Function(
            String staffId, String organizerId, List<String> permissions)
        updateStaffPermissions,
    required TResult Function(
            String staffId, String organizerId, String? reason)
        deactivateStaff,
    required TResult Function() refreshStaff,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult? Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult? Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult? Function(String staffId, String organizerId)? loadStaffDetails,
    TResult? Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult? Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult? Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult? Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult? Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult? Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult? Function()? refreshStaff,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String eventId, StaffRole? role, int? limit, String? lastStaffId)?
        loadEventStaff,
    TResult Function(String organizerId, StaffStatus? status, int? limit,
            String? lastStaffId)?
        loadOrganizerStaff,
    TResult Function(String query, String organizerId, String? eventId,
            StaffRole? role, StaffStatus? status, int? limit)?
        searchStaff,
    TResult Function(String staffId, String organizerId)? loadStaffDetails,
    TResult Function(String organizerId, String email, StaffRole role,
            List<String> permissions, List<String>? eventIds)?
        inviteStaff,
    TResult Function(String staffId, String organizerId, StaffRole newRole)?
        updateStaffRole,
    TResult Function(String staffId, String eventId, StaffRole role,
            List<String> permissions)?
        assignStaffToEvent,
    TResult Function(String staffId, String eventId, String? reason)?
        removeStaffFromEvent,
    TResult Function(
            String staffId, String organizerId, List<String> permissions)?
        updateStaffPermissions,
    TResult Function(String staffId, String organizerId, String? reason)?
        deactivateStaff,
    TResult Function()? refreshStaff,
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
    required TResult Function(_LoadEventStaff value) loadEventStaff,
    required TResult Function(_LoadOrganizerStaff value) loadOrganizerStaff,
    required TResult Function(_SearchStaff value) searchStaff,
    required TResult Function(_LoadStaffDetails value) loadStaffDetails,
    required TResult Function(_InviteStaff value) inviteStaff,
    required TResult Function(_UpdateStaffRole value) updateStaffRole,
    required TResult Function(_AssignStaffToEvent value) assignStaffToEvent,
    required TResult Function(_RemoveStaffFromEvent value) removeStaffFromEvent,
    required TResult Function(_UpdateStaffPermissions value)
        updateStaffPermissions,
    required TResult Function(_DeactivateStaff value) deactivateStaff,
    required TResult Function(_RefreshStaff value) refreshStaff,
    required TResult Function(_ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadEventStaff value)? loadEventStaff,
    TResult? Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult? Function(_SearchStaff value)? searchStaff,
    TResult? Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult? Function(_InviteStaff value)? inviteStaff,
    TResult? Function(_UpdateStaffRole value)? updateStaffRole,
    TResult? Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult? Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult? Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult? Function(_DeactivateStaff value)? deactivateStaff,
    TResult? Function(_RefreshStaff value)? refreshStaff,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadEventStaff value)? loadEventStaff,
    TResult Function(_LoadOrganizerStaff value)? loadOrganizerStaff,
    TResult Function(_SearchStaff value)? searchStaff,
    TResult Function(_LoadStaffDetails value)? loadStaffDetails,
    TResult Function(_InviteStaff value)? inviteStaff,
    TResult Function(_UpdateStaffRole value)? updateStaffRole,
    TResult Function(_AssignStaffToEvent value)? assignStaffToEvent,
    TResult Function(_RemoveStaffFromEvent value)? removeStaffFromEvent,
    TResult Function(_UpdateStaffPermissions value)? updateStaffPermissions,
    TResult Function(_DeactivateStaff value)? deactivateStaff,
    TResult Function(_RefreshStaff value)? refreshStaff,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements StaffManagementEvent {
  const factory _ClearError() = _$ClearErrorImpl;
}

/// @nodoc
mixin _$StaffManagementState {
  List<StaffMemberEntity> get staffMembers =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isInviting => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  StaffMemberEntity? get selectedStaff => throw _privateConstructorUsedError;
  StaffInvitation? get pendingInvitation => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  String? get selectedEventId => throw _privateConstructorUsedError;
  String? get organizerId => throw _privateConstructorUsedError;
  StaffRole? get filterRole => throw _privateConstructorUsedError;
  StaffStatus? get filterStatus => throw _privateConstructorUsedError;

  /// Create a copy of StaffManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffManagementStateCopyWith<StaffManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffManagementStateCopyWith<$Res> {
  factory $StaffManagementStateCopyWith(StaffManagementState value,
          $Res Function(StaffManagementState) then) =
      _$StaffManagementStateCopyWithImpl<$Res, StaffManagementState>;
  @useResult
  $Res call(
      {List<StaffMemberEntity> staffMembers,
      bool isLoading,
      bool isInviting,
      bool isUpdating,
      bool hasError,
      String errorMessage,
      StaffMemberEntity? selectedStaff,
      StaffInvitation? pendingInvitation,
      String searchQuery,
      String? selectedEventId,
      String? organizerId,
      StaffRole? filterRole,
      StaffStatus? filterStatus});

  $StaffMemberEntityCopyWith<$Res>? get selectedStaff;
}

/// @nodoc
class _$StaffManagementStateCopyWithImpl<$Res,
        $Val extends StaffManagementState>
    implements $StaffManagementStateCopyWith<$Res> {
  _$StaffManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffMembers = null,
    Object? isLoading = null,
    Object? isInviting = null,
    Object? isUpdating = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedStaff = freezed,
    Object? pendingInvitation = freezed,
    Object? searchQuery = null,
    Object? selectedEventId = freezed,
    Object? organizerId = freezed,
    Object? filterRole = freezed,
    Object? filterStatus = freezed,
  }) {
    return _then(_value.copyWith(
      staffMembers: null == staffMembers
          ? _value.staffMembers
          : staffMembers // ignore: cast_nullable_to_non_nullable
              as List<StaffMemberEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInviting: null == isInviting
          ? _value.isInviting
          : isInviting // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedStaff: freezed == selectedStaff
          ? _value.selectedStaff
          : selectedStaff // ignore: cast_nullable_to_non_nullable
              as StaffMemberEntity?,
      pendingInvitation: freezed == pendingInvitation
          ? _value.pendingInvitation
          : pendingInvitation // ignore: cast_nullable_to_non_nullable
              as StaffInvitation?,
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
      filterRole: freezed == filterRole
          ? _value.filterRole
          : filterRole // ignore: cast_nullable_to_non_nullable
              as StaffRole?,
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as StaffStatus?,
    ) as $Val);
  }

  /// Create a copy of StaffManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffMemberEntityCopyWith<$Res>? get selectedStaff {
    if (_value.selectedStaff == null) {
      return null;
    }

    return $StaffMemberEntityCopyWith<$Res>(_value.selectedStaff!, (value) {
      return _then(_value.copyWith(selectedStaff: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffManagementStateImplCopyWith<$Res>
    implements $StaffManagementStateCopyWith<$Res> {
  factory _$$StaffManagementStateImplCopyWith(_$StaffManagementStateImpl value,
          $Res Function(_$StaffManagementStateImpl) then) =
      __$$StaffManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<StaffMemberEntity> staffMembers,
      bool isLoading,
      bool isInviting,
      bool isUpdating,
      bool hasError,
      String errorMessage,
      StaffMemberEntity? selectedStaff,
      StaffInvitation? pendingInvitation,
      String searchQuery,
      String? selectedEventId,
      String? organizerId,
      StaffRole? filterRole,
      StaffStatus? filterStatus});

  @override
  $StaffMemberEntityCopyWith<$Res>? get selectedStaff;
}

/// @nodoc
class __$$StaffManagementStateImplCopyWithImpl<$Res>
    extends _$StaffManagementStateCopyWithImpl<$Res, _$StaffManagementStateImpl>
    implements _$$StaffManagementStateImplCopyWith<$Res> {
  __$$StaffManagementStateImplCopyWithImpl(_$StaffManagementStateImpl _value,
      $Res Function(_$StaffManagementStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffMembers = null,
    Object? isLoading = null,
    Object? isInviting = null,
    Object? isUpdating = null,
    Object? hasError = null,
    Object? errorMessage = null,
    Object? selectedStaff = freezed,
    Object? pendingInvitation = freezed,
    Object? searchQuery = null,
    Object? selectedEventId = freezed,
    Object? organizerId = freezed,
    Object? filterRole = freezed,
    Object? filterStatus = freezed,
  }) {
    return _then(_$StaffManagementStateImpl(
      staffMembers: null == staffMembers
          ? _value._staffMembers
          : staffMembers // ignore: cast_nullable_to_non_nullable
              as List<StaffMemberEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isInviting: null == isInviting
          ? _value.isInviting
          : isInviting // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      selectedStaff: freezed == selectedStaff
          ? _value.selectedStaff
          : selectedStaff // ignore: cast_nullable_to_non_nullable
              as StaffMemberEntity?,
      pendingInvitation: freezed == pendingInvitation
          ? _value.pendingInvitation
          : pendingInvitation // ignore: cast_nullable_to_non_nullable
              as StaffInvitation?,
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
      filterRole: freezed == filterRole
          ? _value.filterRole
          : filterRole // ignore: cast_nullable_to_non_nullable
              as StaffRole?,
      filterStatus: freezed == filterStatus
          ? _value.filterStatus
          : filterStatus // ignore: cast_nullable_to_non_nullable
              as StaffStatus?,
    ));
  }
}

/// @nodoc

class _$StaffManagementStateImpl implements _StaffManagementState {
  const _$StaffManagementStateImpl(
      {final List<StaffMemberEntity> staffMembers = const [],
      this.isLoading = false,
      this.isInviting = false,
      this.isUpdating = false,
      this.hasError = false,
      this.errorMessage = '',
      this.selectedStaff,
      this.pendingInvitation,
      this.searchQuery = '',
      this.selectedEventId,
      this.organizerId,
      this.filterRole,
      this.filterStatus})
      : _staffMembers = staffMembers;

  final List<StaffMemberEntity> _staffMembers;
  @override
  @JsonKey()
  List<StaffMemberEntity> get staffMembers {
    if (_staffMembers is EqualUnmodifiableListView) return _staffMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_staffMembers);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isInviting;
  @override
  @JsonKey()
  final bool isUpdating;
  @override
  @JsonKey()
  final bool hasError;
  @override
  @JsonKey()
  final String errorMessage;
  @override
  final StaffMemberEntity? selectedStaff;
  @override
  final StaffInvitation? pendingInvitation;
  @override
  @JsonKey()
  final String searchQuery;
  @override
  final String? selectedEventId;
  @override
  final String? organizerId;
  @override
  final StaffRole? filterRole;
  @override
  final StaffStatus? filterStatus;

  @override
  String toString() {
    return 'StaffManagementState(staffMembers: $staffMembers, isLoading: $isLoading, isInviting: $isInviting, isUpdating: $isUpdating, hasError: $hasError, errorMessage: $errorMessage, selectedStaff: $selectedStaff, pendingInvitation: $pendingInvitation, searchQuery: $searchQuery, selectedEventId: $selectedEventId, organizerId: $organizerId, filterRole: $filterRole, filterStatus: $filterStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffManagementStateImpl &&
            const DeepCollectionEquality()
                .equals(other._staffMembers, _staffMembers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isInviting, isInviting) ||
                other.isInviting == isInviting) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.selectedStaff, selectedStaff) ||
                other.selectedStaff == selectedStaff) &&
            (identical(other.pendingInvitation, pendingInvitation) ||
                other.pendingInvitation == pendingInvitation) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.selectedEventId, selectedEventId) ||
                other.selectedEventId == selectedEventId) &&
            (identical(other.organizerId, organizerId) ||
                other.organizerId == organizerId) &&
            (identical(other.filterRole, filterRole) ||
                other.filterRole == filterRole) &&
            (identical(other.filterStatus, filterStatus) ||
                other.filterStatus == filterStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_staffMembers),
      isLoading,
      isInviting,
      isUpdating,
      hasError,
      errorMessage,
      selectedStaff,
      pendingInvitation,
      searchQuery,
      selectedEventId,
      organizerId,
      filterRole,
      filterStatus);

  /// Create a copy of StaffManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffManagementStateImplCopyWith<_$StaffManagementStateImpl>
      get copyWith =>
          __$$StaffManagementStateImplCopyWithImpl<_$StaffManagementStateImpl>(
              this, _$identity);
}

abstract class _StaffManagementState implements StaffManagementState {
  const factory _StaffManagementState(
      {final List<StaffMemberEntity> staffMembers,
      final bool isLoading,
      final bool isInviting,
      final bool isUpdating,
      final bool hasError,
      final String errorMessage,
      final StaffMemberEntity? selectedStaff,
      final StaffInvitation? pendingInvitation,
      final String searchQuery,
      final String? selectedEventId,
      final String? organizerId,
      final StaffRole? filterRole,
      final StaffStatus? filterStatus}) = _$StaffManagementStateImpl;

  @override
  List<StaffMemberEntity> get staffMembers;
  @override
  bool get isLoading;
  @override
  bool get isInviting;
  @override
  bool get isUpdating;
  @override
  bool get hasError;
  @override
  String get errorMessage;
  @override
  StaffMemberEntity? get selectedStaff;
  @override
  StaffInvitation? get pendingInvitation;
  @override
  String get searchQuery;
  @override
  String? get selectedEventId;
  @override
  String? get organizerId;
  @override
  StaffRole? get filterRole;
  @override
  StaffStatus? get filterStatus;

  /// Create a copy of StaffManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffManagementStateImplCopyWith<_$StaffManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
