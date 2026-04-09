// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileEventCopyWith<$Res> {
  factory $UserProfileEventCopyWith(
          UserProfileEvent value, $Res Function(UserProfileEvent) then) =
      _$UserProfileEventCopyWithImpl<$Res, UserProfileEvent>;
}

/// @nodoc
class _$UserProfileEventCopyWithImpl<$Res, $Val extends UserProfileEvent>
    implements $UserProfileEventCopyWith<$Res> {
  _$UserProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadUserProfileImplCopyWith<$Res> {
  factory _$$LoadUserProfileImplCopyWith(_$LoadUserProfileImpl value,
          $Res Function(_$LoadUserProfileImpl) then) =
      __$$LoadUserProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadUserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$LoadUserProfileImpl>
    implements _$$LoadUserProfileImplCopyWith<$Res> {
  __$$LoadUserProfileImplCopyWithImpl(
      _$LoadUserProfileImpl _value, $Res Function(_$LoadUserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$LoadUserProfileImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadUserProfileImpl implements _LoadUserProfile {
  const _$LoadUserProfileImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'UserProfileEvent.loadUserProfile(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadUserProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadUserProfileImplCopyWith<_$LoadUserProfileImpl> get copyWith =>
      __$$LoadUserProfileImplCopyWithImpl<_$LoadUserProfileImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return loadUserProfile(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return loadUserProfile?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (loadUserProfile != null) {
      return loadUserProfile(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return loadUserProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return loadUserProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (loadUserProfile != null) {
      return loadUserProfile(this);
    }
    return orElse();
  }
}

abstract class _LoadUserProfile implements UserProfileEvent {
  const factory _LoadUserProfile({required final String userId}) =
      _$LoadUserProfileImpl;

  String get userId;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadUserProfileImplCopyWith<_$LoadUserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserProfileImplCopyWith<$Res> {
  factory _$$UpdateUserProfileImplCopyWith(_$UpdateUserProfileImpl value,
          $Res Function(_$UpdateUserProfileImpl) then) =
      __$$UpdateUserProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, UserProfileEntity profile});

  $UserProfileEntityCopyWith<$Res> get profile;
}

/// @nodoc
class __$$UpdateUserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateUserProfileImpl>
    implements _$$UpdateUserProfileImplCopyWith<$Res> {
  __$$UpdateUserProfileImplCopyWithImpl(_$UpdateUserProfileImpl _value,
      $Res Function(_$UpdateUserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? profile = null,
  }) {
    return _then(_$UpdateUserProfileImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileEntity,
    ));
  }

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileEntityCopyWith<$Res> get profile {
    return $UserProfileEntityCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$UpdateUserProfileImpl implements _UpdateUserProfile {
  const _$UpdateUserProfileImpl({required this.userId, required this.profile});

  @override
  final String userId;
  @override
  final UserProfileEntity profile;

  @override
  String toString() {
    return 'UserProfileEvent.updateUserProfile(userId: $userId, profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, profile);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserProfileImplCopyWith<_$UpdateUserProfileImpl> get copyWith =>
      __$$UpdateUserProfileImplCopyWithImpl<_$UpdateUserProfileImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return updateUserProfile(userId, profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return updateUserProfile?.call(userId, profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateUserProfile != null) {
      return updateUserProfile(userId, profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return updateUserProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return updateUserProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateUserProfile != null) {
      return updateUserProfile(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserProfile implements UserProfileEvent {
  const factory _UpdateUserProfile(
      {required final String userId,
      required final UserProfileEntity profile}) = _$UpdateUserProfileImpl;

  String get userId;
  UserProfileEntity get profile;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserProfileImplCopyWith<_$UpdateUserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserPreferencesImplCopyWith<$Res> {
  factory _$$UpdateUserPreferencesImplCopyWith(
          _$UpdateUserPreferencesImpl value,
          $Res Function(_$UpdateUserPreferencesImpl) then) =
      __$$UpdateUserPreferencesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, UserPreferences preferences});

  $UserPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$UpdateUserPreferencesImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateUserPreferencesImpl>
    implements _$$UpdateUserPreferencesImplCopyWith<$Res> {
  __$$UpdateUserPreferencesImplCopyWithImpl(_$UpdateUserPreferencesImpl _value,
      $Res Function(_$UpdateUserPreferencesImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? preferences = null,
  }) {
    return _then(_$UpdateUserPreferencesImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
    ));
  }

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res> get preferences {
    return $UserPreferencesCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value));
    });
  }
}

/// @nodoc

class _$UpdateUserPreferencesImpl implements _UpdateUserPreferences {
  const _$UpdateUserPreferencesImpl(
      {required this.userId, required this.preferences});

  @override
  final String userId;
  @override
  final UserPreferences preferences;

  @override
  String toString() {
    return 'UserProfileEvent.updateUserPreferences(userId: $userId, preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserPreferencesImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, preferences);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserPreferencesImplCopyWith<_$UpdateUserPreferencesImpl>
      get copyWith => __$$UpdateUserPreferencesImplCopyWithImpl<
          _$UpdateUserPreferencesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return updateUserPreferences(userId, preferences);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return updateUserPreferences?.call(userId, preferences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateUserPreferences != null) {
      return updateUserPreferences(userId, preferences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return updateUserPreferences(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return updateUserPreferences?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateUserPreferences != null) {
      return updateUserPreferences(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserPreferences implements UserProfileEvent {
  const factory _UpdateUserPreferences(
          {required final String userId,
          required final UserPreferences preferences}) =
      _$UpdateUserPreferencesImpl;

  String get userId;
  UserPreferences get preferences;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserPreferencesImplCopyWith<_$UpdateUserPreferencesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileImageImplCopyWith<$Res> {
  factory _$$UpdateProfileImageImplCopyWith(_$UpdateProfileImageImpl value,
          $Res Function(_$UpdateProfileImageImpl) then) =
      __$$UpdateProfileImageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String imagePath});
}

/// @nodoc
class __$$UpdateProfileImageImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateProfileImageImpl>
    implements _$$UpdateProfileImageImplCopyWith<$Res> {
  __$$UpdateProfileImageImplCopyWithImpl(_$UpdateProfileImageImpl _value,
      $Res Function(_$UpdateProfileImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? imagePath = null,
  }) {
    return _then(_$UpdateProfileImageImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateProfileImageImpl implements _UpdateProfileImage {
  const _$UpdateProfileImageImpl(
      {required this.userId, required this.imagePath});

  @override
  final String userId;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'UserProfileEvent.updateProfileImage(userId: $userId, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileImageImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, imagePath);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileImageImplCopyWith<_$UpdateProfileImageImpl> get copyWith =>
      __$$UpdateProfileImageImplCopyWithImpl<_$UpdateProfileImageImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return updateProfileImage(userId, imagePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return updateProfileImage?.call(userId, imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateProfileImage != null) {
      return updateProfileImage(userId, imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return updateProfileImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return updateProfileImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateProfileImage != null) {
      return updateProfileImage(this);
    }
    return orElse();
  }
}

abstract class _UpdateProfileImage implements UserProfileEvent {
  const factory _UpdateProfileImage(
      {required final String userId,
      required final String imagePath}) = _$UpdateProfileImageImpl;

  String get userId;
  String get imagePath;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileImageImplCopyWith<_$UpdateProfileImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserStatusImplCopyWith<$Res> {
  factory _$$UpdateUserStatusImplCopyWith(_$UpdateUserStatusImpl value,
          $Res Function(_$UpdateUserStatusImpl) then) =
      __$$UpdateUserStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, UserProfileStatus status});
}

/// @nodoc
class __$$UpdateUserStatusImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateUserStatusImpl>
    implements _$$UpdateUserStatusImplCopyWith<$Res> {
  __$$UpdateUserStatusImplCopyWithImpl(_$UpdateUserStatusImpl _value,
      $Res Function(_$UpdateUserStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
  }) {
    return _then(_$UpdateUserStatusImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as UserProfileStatus,
    ));
  }
}

/// @nodoc

class _$UpdateUserStatusImpl implements _UpdateUserStatus {
  const _$UpdateUserStatusImpl({required this.userId, required this.status});

  @override
  final String userId;
  @override
  final UserProfileStatus status;

  @override
  String toString() {
    return 'UserProfileEvent.updateUserStatus(userId: $userId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserStatusImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, status);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserStatusImplCopyWith<_$UpdateUserStatusImpl> get copyWith =>
      __$$UpdateUserStatusImplCopyWithImpl<_$UpdateUserStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return updateUserStatus(userId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return updateUserStatus?.call(userId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateUserStatus != null) {
      return updateUserStatus(userId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return updateUserStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return updateUserStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateUserStatus != null) {
      return updateUserStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserStatus implements UserProfileEvent {
  const factory _UpdateUserStatus(
      {required final String userId,
      required final UserProfileStatus status}) = _$UpdateUserStatusImpl;

  String get userId;
  UserProfileStatus get status;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserStatusImplCopyWith<_$UpdateUserStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadCurrentEventAssignmentImplCopyWith<$Res> {
  factory _$$LoadCurrentEventAssignmentImplCopyWith(
          _$LoadCurrentEventAssignmentImpl value,
          $Res Function(_$LoadCurrentEventAssignmentImpl) then) =
      __$$LoadCurrentEventAssignmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String staffId});
}

/// @nodoc
class __$$LoadCurrentEventAssignmentImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res,
        _$LoadCurrentEventAssignmentImpl>
    implements _$$LoadCurrentEventAssignmentImplCopyWith<$Res> {
  __$$LoadCurrentEventAssignmentImplCopyWithImpl(
      _$LoadCurrentEventAssignmentImpl _value,
      $Res Function(_$LoadCurrentEventAssignmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffId = null,
  }) {
    return _then(_$LoadCurrentEventAssignmentImpl(
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadCurrentEventAssignmentImpl implements _LoadCurrentEventAssignment {
  const _$LoadCurrentEventAssignmentImpl({required this.staffId});

  @override
  final String staffId;

  @override
  String toString() {
    return 'UserProfileEvent.loadCurrentEventAssignment(staffId: $staffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadCurrentEventAssignmentImpl &&
            (identical(other.staffId, staffId) || other.staffId == staffId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffId);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadCurrentEventAssignmentImplCopyWith<_$LoadCurrentEventAssignmentImpl>
      get copyWith => __$$LoadCurrentEventAssignmentImplCopyWithImpl<
          _$LoadCurrentEventAssignmentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return loadCurrentEventAssignment(staffId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return loadCurrentEventAssignment?.call(staffId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (loadCurrentEventAssignment != null) {
      return loadCurrentEventAssignment(staffId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return loadCurrentEventAssignment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return loadCurrentEventAssignment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (loadCurrentEventAssignment != null) {
      return loadCurrentEventAssignment(this);
    }
    return orElse();
  }
}

abstract class _LoadCurrentEventAssignment implements UserProfileEvent {
  const factory _LoadCurrentEventAssignment({required final String staffId}) =
      _$LoadCurrentEventAssignmentImpl;

  String get staffId;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadCurrentEventAssignmentImplCopyWith<_$LoadCurrentEventAssignmentImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateStaffDataImplCopyWith<$Res> {
  factory _$$UpdateStaffDataImplCopyWith(_$UpdateStaffDataImpl value,
          $Res Function(_$UpdateStaffDataImpl) then) =
      __$$UpdateStaffDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, StaffProfileData staffData});

  $StaffProfileDataCopyWith<$Res> get staffData;
}

/// @nodoc
class __$$UpdateStaffDataImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateStaffDataImpl>
    implements _$$UpdateStaffDataImplCopyWith<$Res> {
  __$$UpdateStaffDataImplCopyWithImpl(
      _$UpdateStaffDataImpl _value, $Res Function(_$UpdateStaffDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? staffData = null,
  }) {
    return _then(_$UpdateStaffDataImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      staffData: null == staffData
          ? _value.staffData
          : staffData // ignore: cast_nullable_to_non_nullable
              as StaffProfileData,
    ));
  }

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffProfileDataCopyWith<$Res> get staffData {
    return $StaffProfileDataCopyWith<$Res>(_value.staffData, (value) {
      return _then(_value.copyWith(staffData: value));
    });
  }
}

/// @nodoc

class _$UpdateStaffDataImpl implements _UpdateStaffData {
  const _$UpdateStaffDataImpl({required this.userId, required this.staffData});

  @override
  final String userId;
  @override
  final StaffProfileData staffData;

  @override
  String toString() {
    return 'UserProfileEvent.updateStaffData(userId: $userId, staffData: $staffData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStaffDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.staffData, staffData) ||
                other.staffData == staffData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, staffData);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStaffDataImplCopyWith<_$UpdateStaffDataImpl> get copyWith =>
      __$$UpdateStaffDataImplCopyWithImpl<_$UpdateStaffDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return updateStaffData(userId, staffData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return updateStaffData?.call(userId, staffData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateStaffData != null) {
      return updateStaffData(userId, staffData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return updateStaffData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return updateStaffData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateStaffData != null) {
      return updateStaffData(this);
    }
    return orElse();
  }
}

abstract class _UpdateStaffData implements UserProfileEvent {
  const factory _UpdateStaffData(
      {required final String userId,
      required final StaffProfileData staffData}) = _$UpdateStaffDataImpl;

  String get userId;
  StaffProfileData get staffData;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStaffDataImplCopyWith<_$UpdateStaffDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateOrganizerDataImplCopyWith<$Res> {
  factory _$$UpdateOrganizerDataImplCopyWith(_$UpdateOrganizerDataImpl value,
          $Res Function(_$UpdateOrganizerDataImpl) then) =
      __$$UpdateOrganizerDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, OrganizerProfileData organizerData});

  $OrganizerProfileDataCopyWith<$Res> get organizerData;
}

/// @nodoc
class __$$UpdateOrganizerDataImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateOrganizerDataImpl>
    implements _$$UpdateOrganizerDataImplCopyWith<$Res> {
  __$$UpdateOrganizerDataImplCopyWithImpl(_$UpdateOrganizerDataImpl _value,
      $Res Function(_$UpdateOrganizerDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? organizerData = null,
  }) {
    return _then(_$UpdateOrganizerDataImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      organizerData: null == organizerData
          ? _value.organizerData
          : organizerData // ignore: cast_nullable_to_non_nullable
              as OrganizerProfileData,
    ));
  }

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizerProfileDataCopyWith<$Res> get organizerData {
    return $OrganizerProfileDataCopyWith<$Res>(_value.organizerData, (value) {
      return _then(_value.copyWith(organizerData: value));
    });
  }
}

/// @nodoc

class _$UpdateOrganizerDataImpl implements _UpdateOrganizerData {
  const _$UpdateOrganizerDataImpl(
      {required this.userId, required this.organizerData});

  @override
  final String userId;
  @override
  final OrganizerProfileData organizerData;

  @override
  String toString() {
    return 'UserProfileEvent.updateOrganizerData(userId: $userId, organizerData: $organizerData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateOrganizerDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.organizerData, organizerData) ||
                other.organizerData == organizerData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, organizerData);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateOrganizerDataImplCopyWith<_$UpdateOrganizerDataImpl> get copyWith =>
      __$$UpdateOrganizerDataImplCopyWithImpl<_$UpdateOrganizerDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return updateOrganizerData(userId, organizerData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return updateOrganizerData?.call(userId, organizerData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateOrganizerData != null) {
      return updateOrganizerData(userId, organizerData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return updateOrganizerData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return updateOrganizerData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateOrganizerData != null) {
      return updateOrganizerData(this);
    }
    return orElse();
  }
}

abstract class _UpdateOrganizerData implements UserProfileEvent {
  const factory _UpdateOrganizerData(
          {required final String userId,
          required final OrganizerProfileData organizerData}) =
      _$UpdateOrganizerDataImpl;

  String get userId;
  OrganizerProfileData get organizerData;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateOrganizerDataImplCopyWith<_$UpdateOrganizerDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateAttendeeDataImplCopyWith<$Res> {
  factory _$$UpdateAttendeeDataImplCopyWith(_$UpdateAttendeeDataImpl value,
          $Res Function(_$UpdateAttendeeDataImpl) then) =
      __$$UpdateAttendeeDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, AttendeeProfileData attendeeData});

  $AttendeeProfileDataCopyWith<$Res> get attendeeData;
}

/// @nodoc
class __$$UpdateAttendeeDataImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$UpdateAttendeeDataImpl>
    implements _$$UpdateAttendeeDataImplCopyWith<$Res> {
  __$$UpdateAttendeeDataImplCopyWithImpl(_$UpdateAttendeeDataImpl _value,
      $Res Function(_$UpdateAttendeeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? attendeeData = null,
  }) {
    return _then(_$UpdateAttendeeDataImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      attendeeData: null == attendeeData
          ? _value.attendeeData
          : attendeeData // ignore: cast_nullable_to_non_nullable
              as AttendeeProfileData,
    ));
  }

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendeeProfileDataCopyWith<$Res> get attendeeData {
    return $AttendeeProfileDataCopyWith<$Res>(_value.attendeeData, (value) {
      return _then(_value.copyWith(attendeeData: value));
    });
  }
}

/// @nodoc

class _$UpdateAttendeeDataImpl implements _UpdateAttendeeData {
  const _$UpdateAttendeeDataImpl(
      {required this.userId, required this.attendeeData});

  @override
  final String userId;
  @override
  final AttendeeProfileData attendeeData;

  @override
  String toString() {
    return 'UserProfileEvent.updateAttendeeData(userId: $userId, attendeeData: $attendeeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateAttendeeDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.attendeeData, attendeeData) ||
                other.attendeeData == attendeeData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, attendeeData);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateAttendeeDataImplCopyWith<_$UpdateAttendeeDataImpl> get copyWith =>
      __$$UpdateAttendeeDataImplCopyWithImpl<_$UpdateAttendeeDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return updateAttendeeData(userId, attendeeData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return updateAttendeeData?.call(userId, attendeeData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateAttendeeData != null) {
      return updateAttendeeData(userId, attendeeData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return updateAttendeeData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return updateAttendeeData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateAttendeeData != null) {
      return updateAttendeeData(this);
    }
    return orElse();
  }
}

abstract class _UpdateAttendeeData implements UserProfileEvent {
  const factory _UpdateAttendeeData(
          {required final String userId,
          required final AttendeeProfileData attendeeData}) =
      _$UpdateAttendeeDataImpl;

  String get userId;
  AttendeeProfileData get attendeeData;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateAttendeeDataImplCopyWith<_$UpdateAttendeeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshProfileImplCopyWith<$Res> {
  factory _$$RefreshProfileImplCopyWith(_$RefreshProfileImpl value,
          $Res Function(_$RefreshProfileImpl) then) =
      __$$RefreshProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$RefreshProfileImplCopyWithImpl<$Res>
    extends _$UserProfileEventCopyWithImpl<$Res, _$RefreshProfileImpl>
    implements _$$RefreshProfileImplCopyWith<$Res> {
  __$$RefreshProfileImplCopyWithImpl(
      _$RefreshProfileImpl _value, $Res Function(_$RefreshProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$RefreshProfileImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RefreshProfileImpl implements _RefreshProfile {
  const _$RefreshProfileImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'UserProfileEvent.refreshProfile(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RefreshProfileImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RefreshProfileImplCopyWith<_$RefreshProfileImpl> get copyWith =>
      __$$RefreshProfileImplCopyWithImpl<_$RefreshProfileImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String userId) loadUserProfile,
    required TResult Function(String userId, UserProfileEntity profile)
        updateUserProfile,
    required TResult Function(String userId, UserPreferences preferences)
        updateUserPreferences,
    required TResult Function(String userId, String imagePath)
        updateProfileImage,
    required TResult Function(String userId, UserProfileStatus status)
        updateUserStatus,
    required TResult Function(String staffId) loadCurrentEventAssignment,
    required TResult Function(String userId, StaffProfileData staffData)
        updateStaffData,
    required TResult Function(String userId, OrganizerProfileData organizerData)
        updateOrganizerData,
    required TResult Function(String userId, AttendeeProfileData attendeeData)
        updateAttendeeData,
    required TResult Function(String userId) refreshProfile,
  }) {
    return refreshProfile(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String userId)? loadUserProfile,
    TResult? Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult? Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult? Function(String userId, String imagePath)? updateProfileImage,
    TResult? Function(String userId, UserProfileStatus status)?
        updateUserStatus,
    TResult? Function(String staffId)? loadCurrentEventAssignment,
    TResult? Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult? Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult? Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult? Function(String userId)? refreshProfile,
  }) {
    return refreshProfile?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String userId)? loadUserProfile,
    TResult Function(String userId, UserProfileEntity profile)?
        updateUserProfile,
    TResult Function(String userId, UserPreferences preferences)?
        updateUserPreferences,
    TResult Function(String userId, String imagePath)? updateProfileImage,
    TResult Function(String userId, UserProfileStatus status)? updateUserStatus,
    TResult Function(String staffId)? loadCurrentEventAssignment,
    TResult Function(String userId, StaffProfileData staffData)?
        updateStaffData,
    TResult Function(String userId, OrganizerProfileData organizerData)?
        updateOrganizerData,
    TResult Function(String userId, AttendeeProfileData attendeeData)?
        updateAttendeeData,
    TResult Function(String userId)? refreshProfile,
    required TResult orElse(),
  }) {
    if (refreshProfile != null) {
      return refreshProfile(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadUserProfile value) loadUserProfile,
    required TResult Function(_UpdateUserProfile value) updateUserProfile,
    required TResult Function(_UpdateUserPreferences value)
        updateUserPreferences,
    required TResult Function(_UpdateProfileImage value) updateProfileImage,
    required TResult Function(_UpdateUserStatus value) updateUserStatus,
    required TResult Function(_LoadCurrentEventAssignment value)
        loadCurrentEventAssignment,
    required TResult Function(_UpdateStaffData value) updateStaffData,
    required TResult Function(_UpdateOrganizerData value) updateOrganizerData,
    required TResult Function(_UpdateAttendeeData value) updateAttendeeData,
    required TResult Function(_RefreshProfile value) refreshProfile,
  }) {
    return refreshProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadUserProfile value)? loadUserProfile,
    TResult? Function(_UpdateUserProfile value)? updateUserProfile,
    TResult? Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult? Function(_UpdateProfileImage value)? updateProfileImage,
    TResult? Function(_UpdateUserStatus value)? updateUserStatus,
    TResult? Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult? Function(_UpdateStaffData value)? updateStaffData,
    TResult? Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult? Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult? Function(_RefreshProfile value)? refreshProfile,
  }) {
    return refreshProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadUserProfile value)? loadUserProfile,
    TResult Function(_UpdateUserProfile value)? updateUserProfile,
    TResult Function(_UpdateUserPreferences value)? updateUserPreferences,
    TResult Function(_UpdateProfileImage value)? updateProfileImage,
    TResult Function(_UpdateUserStatus value)? updateUserStatus,
    TResult Function(_LoadCurrentEventAssignment value)?
        loadCurrentEventAssignment,
    TResult Function(_UpdateStaffData value)? updateStaffData,
    TResult Function(_UpdateOrganizerData value)? updateOrganizerData,
    TResult Function(_UpdateAttendeeData value)? updateAttendeeData,
    TResult Function(_RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (refreshProfile != null) {
      return refreshProfile(this);
    }
    return orElse();
  }
}

abstract class _RefreshProfile implements UserProfileEvent {
  const factory _RefreshProfile({required final String userId}) =
      _$RefreshProfileImpl;

  String get userId;

  /// Create a copy of UserProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RefreshProfileImplCopyWith<_$RefreshProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStateCopyWith<$Res> {
  factory $UserProfileStateCopyWith(
          UserProfileState value, $Res Function(UserProfileState) then) =
      _$UserProfileStateCopyWithImpl<$Res, UserProfileState>;
}

/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res, $Val extends UserProfileState>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileState
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
    extends _$UserProfileStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'UserProfileState.initial()';
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
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements UserProfileState {
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
    extends _$UserProfileStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'UserProfileState.loading()';
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
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements UserProfileState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfileEntity profile});

  $UserProfileEntityCopyWith<$Res> get profile;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$LoadedImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileEntity,
    ));
  }

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileEntityCopyWith<$Res> get profile {
    return $UserProfileEntityCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required this.profile});

  @override
  final UserProfileEntity profile;

  @override
  String toString() {
    return 'UserProfileState.loaded(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return loaded(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements UserProfileState {
  const factory _Loaded({required final UserProfileEntity profile}) =
      _$LoadedImpl;

  UserProfileEntity get profile;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileUpdatedImplCopyWith<$Res> {
  factory _$$ProfileUpdatedImplCopyWith(_$ProfileUpdatedImpl value,
          $Res Function(_$ProfileUpdatedImpl) then) =
      __$$ProfileUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfileEntity profile});

  $UserProfileEntityCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ProfileUpdatedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$ProfileUpdatedImpl>
    implements _$$ProfileUpdatedImplCopyWith<$Res> {
  __$$ProfileUpdatedImplCopyWithImpl(
      _$ProfileUpdatedImpl _value, $Res Function(_$ProfileUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$ProfileUpdatedImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileEntity,
    ));
  }

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileEntityCopyWith<$Res> get profile {
    return $UserProfileEntityCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$ProfileUpdatedImpl implements _ProfileUpdated {
  const _$ProfileUpdatedImpl({required this.profile});

  @override
  final UserProfileEntity profile;

  @override
  String toString() {
    return 'UserProfileState.profileUpdated(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileUpdatedImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileUpdatedImplCopyWith<_$ProfileUpdatedImpl> get copyWith =>
      __$$ProfileUpdatedImplCopyWithImpl<_$ProfileUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return profileUpdated(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return profileUpdated?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (profileUpdated != null) {
      return profileUpdated(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return profileUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return profileUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (profileUpdated != null) {
      return profileUpdated(this);
    }
    return orElse();
  }
}

abstract class _ProfileUpdated implements UserProfileState {
  const factory _ProfileUpdated({required final UserProfileEntity profile}) =
      _$ProfileUpdatedImpl;

  UserProfileEntity get profile;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileUpdatedImplCopyWith<_$ProfileUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PreferencesUpdatedImplCopyWith<$Res> {
  factory _$$PreferencesUpdatedImplCopyWith(_$PreferencesUpdatedImpl value,
          $Res Function(_$PreferencesUpdatedImpl) then) =
      __$$PreferencesUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserPreferences preferences});

  $UserPreferencesCopyWith<$Res> get preferences;
}

/// @nodoc
class __$$PreferencesUpdatedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$PreferencesUpdatedImpl>
    implements _$$PreferencesUpdatedImplCopyWith<$Res> {
  __$$PreferencesUpdatedImplCopyWithImpl(_$PreferencesUpdatedImpl _value,
      $Res Function(_$PreferencesUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preferences = null,
  }) {
    return _then(_$PreferencesUpdatedImpl(
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
    ));
  }

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res> get preferences {
    return $UserPreferencesCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value));
    });
  }
}

/// @nodoc

class _$PreferencesUpdatedImpl implements _PreferencesUpdated {
  const _$PreferencesUpdatedImpl({required this.preferences});

  @override
  final UserPreferences preferences;

  @override
  String toString() {
    return 'UserProfileState.preferencesUpdated(preferences: $preferences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesUpdatedImpl &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences));
  }

  @override
  int get hashCode => Object.hash(runtimeType, preferences);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesUpdatedImplCopyWith<_$PreferencesUpdatedImpl> get copyWith =>
      __$$PreferencesUpdatedImplCopyWithImpl<_$PreferencesUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return preferencesUpdated(preferences);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return preferencesUpdated?.call(preferences);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (preferencesUpdated != null) {
      return preferencesUpdated(preferences);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return preferencesUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return preferencesUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (preferencesUpdated != null) {
      return preferencesUpdated(this);
    }
    return orElse();
  }
}

abstract class _PreferencesUpdated implements UserProfileState {
  const factory _PreferencesUpdated(
      {required final UserPreferences preferences}) = _$PreferencesUpdatedImpl;

  UserPreferences get preferences;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferencesUpdatedImplCopyWith<_$PreferencesUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileImageUpdatedImplCopyWith<$Res> {
  factory _$$ProfileImageUpdatedImplCopyWith(_$ProfileImageUpdatedImpl value,
          $Res Function(_$ProfileImageUpdatedImpl) then) =
      __$$ProfileImageUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String imageUrl});
}

/// @nodoc
class __$$ProfileImageUpdatedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$ProfileImageUpdatedImpl>
    implements _$$ProfileImageUpdatedImplCopyWith<$Res> {
  __$$ProfileImageUpdatedImplCopyWithImpl(_$ProfileImageUpdatedImpl _value,
      $Res Function(_$ProfileImageUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = null,
  }) {
    return _then(_$ProfileImageUpdatedImpl(
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileImageUpdatedImpl implements _ProfileImageUpdated {
  const _$ProfileImageUpdatedImpl({required this.imageUrl});

  @override
  final String imageUrl;

  @override
  String toString() {
    return 'UserProfileState.profileImageUpdated(imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImageUpdatedImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, imageUrl);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImageUpdatedImplCopyWith<_$ProfileImageUpdatedImpl> get copyWith =>
      __$$ProfileImageUpdatedImplCopyWithImpl<_$ProfileImageUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return profileImageUpdated(imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return profileImageUpdated?.call(imageUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (profileImageUpdated != null) {
      return profileImageUpdated(imageUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return profileImageUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return profileImageUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (profileImageUpdated != null) {
      return profileImageUpdated(this);
    }
    return orElse();
  }
}

abstract class _ProfileImageUpdated implements UserProfileState {
  const factory _ProfileImageUpdated({required final String imageUrl}) =
      _$ProfileImageUpdatedImpl;

  String get imageUrl;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImageUpdatedImplCopyWith<_$ProfileImageUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StatusUpdatedImplCopyWith<$Res> {
  factory _$$StatusUpdatedImplCopyWith(
          _$StatusUpdatedImpl value, $Res Function(_$StatusUpdatedImpl) then) =
      __$$StatusUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatusUpdatedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$StatusUpdatedImpl>
    implements _$$StatusUpdatedImplCopyWith<$Res> {
  __$$StatusUpdatedImplCopyWithImpl(
      _$StatusUpdatedImpl _value, $Res Function(_$StatusUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StatusUpdatedImpl implements _StatusUpdated {
  const _$StatusUpdatedImpl();

  @override
  String toString() {
    return 'UserProfileState.statusUpdated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatusUpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return statusUpdated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return statusUpdated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (statusUpdated != null) {
      return statusUpdated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return statusUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return statusUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (statusUpdated != null) {
      return statusUpdated(this);
    }
    return orElse();
  }
}

abstract class _StatusUpdated implements UserProfileState {
  const factory _StatusUpdated() = _$StatusUpdatedImpl;
}

/// @nodoc
abstract class _$$EventAssignmentLoadedImplCopyWith<$Res> {
  factory _$$EventAssignmentLoadedImplCopyWith(
          _$EventAssignmentLoadedImpl value,
          $Res Function(_$EventAssignmentLoadedImpl) then) =
      __$$EventAssignmentLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CurrentEventAssignment? assignment});

  $CurrentEventAssignmentCopyWith<$Res>? get assignment;
}

/// @nodoc
class __$$EventAssignmentLoadedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$EventAssignmentLoadedImpl>
    implements _$$EventAssignmentLoadedImplCopyWith<$Res> {
  __$$EventAssignmentLoadedImplCopyWithImpl(_$EventAssignmentLoadedImpl _value,
      $Res Function(_$EventAssignmentLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignment = freezed,
  }) {
    return _then(_$EventAssignmentLoadedImpl(
      assignment: freezed == assignment
          ? _value.assignment
          : assignment // ignore: cast_nullable_to_non_nullable
              as CurrentEventAssignment?,
    ));
  }

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentEventAssignmentCopyWith<$Res>? get assignment {
    if (_value.assignment == null) {
      return null;
    }

    return $CurrentEventAssignmentCopyWith<$Res>(_value.assignment!, (value) {
      return _then(_value.copyWith(assignment: value));
    });
  }
}

/// @nodoc

class _$EventAssignmentLoadedImpl implements _EventAssignmentLoaded {
  const _$EventAssignmentLoadedImpl({this.assignment});

  @override
  final CurrentEventAssignment? assignment;

  @override
  String toString() {
    return 'UserProfileState.eventAssignmentLoaded(assignment: $assignment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventAssignmentLoadedImpl &&
            (identical(other.assignment, assignment) ||
                other.assignment == assignment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assignment);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventAssignmentLoadedImplCopyWith<_$EventAssignmentLoadedImpl>
      get copyWith => __$$EventAssignmentLoadedImplCopyWithImpl<
          _$EventAssignmentLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return eventAssignmentLoaded(assignment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return eventAssignmentLoaded?.call(assignment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (eventAssignmentLoaded != null) {
      return eventAssignmentLoaded(assignment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return eventAssignmentLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return eventAssignmentLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (eventAssignmentLoaded != null) {
      return eventAssignmentLoaded(this);
    }
    return orElse();
  }
}

abstract class _EventAssignmentLoaded implements UserProfileState {
  const factory _EventAssignmentLoaded(
      {final CurrentEventAssignment? assignment}) = _$EventAssignmentLoadedImpl;

  CurrentEventAssignment? get assignment;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventAssignmentLoadedImplCopyWith<_$EventAssignmentLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StaffDataUpdatedImplCopyWith<$Res> {
  factory _$$StaffDataUpdatedImplCopyWith(_$StaffDataUpdatedImpl value,
          $Res Function(_$StaffDataUpdatedImpl) then) =
      __$$StaffDataUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({StaffProfileData staffData});

  $StaffProfileDataCopyWith<$Res> get staffData;
}

/// @nodoc
class __$$StaffDataUpdatedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$StaffDataUpdatedImpl>
    implements _$$StaffDataUpdatedImplCopyWith<$Res> {
  __$$StaffDataUpdatedImplCopyWithImpl(_$StaffDataUpdatedImpl _value,
      $Res Function(_$StaffDataUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? staffData = null,
  }) {
    return _then(_$StaffDataUpdatedImpl(
      staffData: null == staffData
          ? _value.staffData
          : staffData // ignore: cast_nullable_to_non_nullable
              as StaffProfileData,
    ));
  }

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffProfileDataCopyWith<$Res> get staffData {
    return $StaffProfileDataCopyWith<$Res>(_value.staffData, (value) {
      return _then(_value.copyWith(staffData: value));
    });
  }
}

/// @nodoc

class _$StaffDataUpdatedImpl implements _StaffDataUpdated {
  const _$StaffDataUpdatedImpl({required this.staffData});

  @override
  final StaffProfileData staffData;

  @override
  String toString() {
    return 'UserProfileState.staffDataUpdated(staffData: $staffData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffDataUpdatedImpl &&
            (identical(other.staffData, staffData) ||
                other.staffData == staffData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, staffData);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffDataUpdatedImplCopyWith<_$StaffDataUpdatedImpl> get copyWith =>
      __$$StaffDataUpdatedImplCopyWithImpl<_$StaffDataUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return staffDataUpdated(staffData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return staffDataUpdated?.call(staffData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (staffDataUpdated != null) {
      return staffDataUpdated(staffData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return staffDataUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return staffDataUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (staffDataUpdated != null) {
      return staffDataUpdated(this);
    }
    return orElse();
  }
}

abstract class _StaffDataUpdated implements UserProfileState {
  const factory _StaffDataUpdated({required final StaffProfileData staffData}) =
      _$StaffDataUpdatedImpl;

  StaffProfileData get staffData;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffDataUpdatedImplCopyWith<_$StaffDataUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OrganizerDataUpdatedImplCopyWith<$Res> {
  factory _$$OrganizerDataUpdatedImplCopyWith(_$OrganizerDataUpdatedImpl value,
          $Res Function(_$OrganizerDataUpdatedImpl) then) =
      __$$OrganizerDataUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({OrganizerProfileData organizerData});

  $OrganizerProfileDataCopyWith<$Res> get organizerData;
}

/// @nodoc
class __$$OrganizerDataUpdatedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$OrganizerDataUpdatedImpl>
    implements _$$OrganizerDataUpdatedImplCopyWith<$Res> {
  __$$OrganizerDataUpdatedImplCopyWithImpl(_$OrganizerDataUpdatedImpl _value,
      $Res Function(_$OrganizerDataUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizerData = null,
  }) {
    return _then(_$OrganizerDataUpdatedImpl(
      organizerData: null == organizerData
          ? _value.organizerData
          : organizerData // ignore: cast_nullable_to_non_nullable
              as OrganizerProfileData,
    ));
  }

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OrganizerProfileDataCopyWith<$Res> get organizerData {
    return $OrganizerProfileDataCopyWith<$Res>(_value.organizerData, (value) {
      return _then(_value.copyWith(organizerData: value));
    });
  }
}

/// @nodoc

class _$OrganizerDataUpdatedImpl implements _OrganizerDataUpdated {
  const _$OrganizerDataUpdatedImpl({required this.organizerData});

  @override
  final OrganizerProfileData organizerData;

  @override
  String toString() {
    return 'UserProfileState.organizerDataUpdated(organizerData: $organizerData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrganizerDataUpdatedImpl &&
            (identical(other.organizerData, organizerData) ||
                other.organizerData == organizerData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, organizerData);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizerDataUpdatedImplCopyWith<_$OrganizerDataUpdatedImpl>
      get copyWith =>
          __$$OrganizerDataUpdatedImplCopyWithImpl<_$OrganizerDataUpdatedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return organizerDataUpdated(organizerData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return organizerDataUpdated?.call(organizerData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (organizerDataUpdated != null) {
      return organizerDataUpdated(organizerData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return organizerDataUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return organizerDataUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (organizerDataUpdated != null) {
      return organizerDataUpdated(this);
    }
    return orElse();
  }
}

abstract class _OrganizerDataUpdated implements UserProfileState {
  const factory _OrganizerDataUpdated(
          {required final OrganizerProfileData organizerData}) =
      _$OrganizerDataUpdatedImpl;

  OrganizerProfileData get organizerData;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrganizerDataUpdatedImplCopyWith<_$OrganizerDataUpdatedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AttendeeDataUpdatedImplCopyWith<$Res> {
  factory _$$AttendeeDataUpdatedImplCopyWith(_$AttendeeDataUpdatedImpl value,
          $Res Function(_$AttendeeDataUpdatedImpl) then) =
      __$$AttendeeDataUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AttendeeProfileData attendeeData});

  $AttendeeProfileDataCopyWith<$Res> get attendeeData;
}

/// @nodoc
class __$$AttendeeDataUpdatedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$AttendeeDataUpdatedImpl>
    implements _$$AttendeeDataUpdatedImplCopyWith<$Res> {
  __$$AttendeeDataUpdatedImplCopyWithImpl(_$AttendeeDataUpdatedImpl _value,
      $Res Function(_$AttendeeDataUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendeeData = null,
  }) {
    return _then(_$AttendeeDataUpdatedImpl(
      attendeeData: null == attendeeData
          ? _value.attendeeData
          : attendeeData // ignore: cast_nullable_to_non_nullable
              as AttendeeProfileData,
    ));
  }

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendeeProfileDataCopyWith<$Res> get attendeeData {
    return $AttendeeProfileDataCopyWith<$Res>(_value.attendeeData, (value) {
      return _then(_value.copyWith(attendeeData: value));
    });
  }
}

/// @nodoc

class _$AttendeeDataUpdatedImpl implements _AttendeeDataUpdated {
  const _$AttendeeDataUpdatedImpl({required this.attendeeData});

  @override
  final AttendeeProfileData attendeeData;

  @override
  String toString() {
    return 'UserProfileState.attendeeDataUpdated(attendeeData: $attendeeData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendeeDataUpdatedImpl &&
            (identical(other.attendeeData, attendeeData) ||
                other.attendeeData == attendeeData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, attendeeData);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendeeDataUpdatedImplCopyWith<_$AttendeeDataUpdatedImpl> get copyWith =>
      __$$AttendeeDataUpdatedImplCopyWithImpl<_$AttendeeDataUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return attendeeDataUpdated(attendeeData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return attendeeDataUpdated?.call(attendeeData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (attendeeDataUpdated != null) {
      return attendeeDataUpdated(attendeeData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return attendeeDataUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return attendeeDataUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (attendeeDataUpdated != null) {
      return attendeeDataUpdated(this);
    }
    return orElse();
  }
}

abstract class _AttendeeDataUpdated implements UserProfileState {
  const factory _AttendeeDataUpdated(
          {required final AttendeeProfileData attendeeData}) =
      _$AttendeeDataUpdatedImpl;

  AttendeeProfileData get attendeeData;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendeeDataUpdatedImplCopyWith<_$AttendeeDataUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileRefreshedImplCopyWith<$Res> {
  factory _$$ProfileRefreshedImplCopyWith(_$ProfileRefreshedImpl value,
          $Res Function(_$ProfileRefreshedImpl) then) =
      __$$ProfileRefreshedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfileEntity profile});

  $UserProfileEntityCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ProfileRefreshedImplCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res, _$ProfileRefreshedImpl>
    implements _$$ProfileRefreshedImplCopyWith<$Res> {
  __$$ProfileRefreshedImplCopyWithImpl(_$ProfileRefreshedImpl _value,
      $Res Function(_$ProfileRefreshedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$ProfileRefreshedImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as UserProfileEntity,
    ));
  }

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileEntityCopyWith<$Res> get profile {
    return $UserProfileEntityCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$ProfileRefreshedImpl implements _ProfileRefreshed {
  const _$ProfileRefreshedImpl({required this.profile});

  @override
  final UserProfileEntity profile;

  @override
  String toString() {
    return 'UserProfileState.profileRefreshed(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileRefreshedImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileRefreshedImplCopyWith<_$ProfileRefreshedImpl> get copyWith =>
      __$$ProfileRefreshedImplCopyWithImpl<_$ProfileRefreshedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return profileRefreshed(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return profileRefreshed?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (profileRefreshed != null) {
      return profileRefreshed(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return profileRefreshed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return profileRefreshed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (profileRefreshed != null) {
      return profileRefreshed(this);
    }
    return orElse();
  }
}

abstract class _ProfileRefreshed implements UserProfileState {
  const factory _ProfileRefreshed({required final UserProfileEntity profile}) =
      _$ProfileRefreshedImpl;

  UserProfileEntity get profile;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileRefreshedImplCopyWith<_$ProfileRefreshedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$UserProfileStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfileState
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
    return 'UserProfileState.error(message: $message)';
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

  /// Create a copy of UserProfileState
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
    required TResult Function(UserProfileEntity profile) loaded,
    required TResult Function(UserProfileEntity profile) profileUpdated,
    required TResult Function(UserPreferences preferences) preferencesUpdated,
    required TResult Function(String imageUrl) profileImageUpdated,
    required TResult Function() statusUpdated,
    required TResult Function(CurrentEventAssignment? assignment)
        eventAssignmentLoaded,
    required TResult Function(StaffProfileData staffData) staffDataUpdated,
    required TResult Function(OrganizerProfileData organizerData)
        organizerDataUpdated,
    required TResult Function(AttendeeProfileData attendeeData)
        attendeeDataUpdated,
    required TResult Function(UserProfileEntity profile) profileRefreshed,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserProfileEntity profile)? loaded,
    TResult? Function(UserProfileEntity profile)? profileUpdated,
    TResult? Function(UserPreferences preferences)? preferencesUpdated,
    TResult? Function(String imageUrl)? profileImageUpdated,
    TResult? Function()? statusUpdated,
    TResult? Function(CurrentEventAssignment? assignment)?
        eventAssignmentLoaded,
    TResult? Function(StaffProfileData staffData)? staffDataUpdated,
    TResult? Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult? Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult? Function(UserProfileEntity profile)? profileRefreshed,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserProfileEntity profile)? loaded,
    TResult Function(UserProfileEntity profile)? profileUpdated,
    TResult Function(UserPreferences preferences)? preferencesUpdated,
    TResult Function(String imageUrl)? profileImageUpdated,
    TResult Function()? statusUpdated,
    TResult Function(CurrentEventAssignment? assignment)? eventAssignmentLoaded,
    TResult Function(StaffProfileData staffData)? staffDataUpdated,
    TResult Function(OrganizerProfileData organizerData)? organizerDataUpdated,
    TResult Function(AttendeeProfileData attendeeData)? attendeeDataUpdated,
    TResult Function(UserProfileEntity profile)? profileRefreshed,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_ProfileUpdated value) profileUpdated,
    required TResult Function(_PreferencesUpdated value) preferencesUpdated,
    required TResult Function(_ProfileImageUpdated value) profileImageUpdated,
    required TResult Function(_StatusUpdated value) statusUpdated,
    required TResult Function(_EventAssignmentLoaded value)
        eventAssignmentLoaded,
    required TResult Function(_StaffDataUpdated value) staffDataUpdated,
    required TResult Function(_OrganizerDataUpdated value) organizerDataUpdated,
    required TResult Function(_AttendeeDataUpdated value) attendeeDataUpdated,
    required TResult Function(_ProfileRefreshed value) profileRefreshed,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_ProfileUpdated value)? profileUpdated,
    TResult? Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult? Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult? Function(_StatusUpdated value)? statusUpdated,
    TResult? Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult? Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult? Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult? Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult? Function(_ProfileRefreshed value)? profileRefreshed,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_ProfileUpdated value)? profileUpdated,
    TResult Function(_PreferencesUpdated value)? preferencesUpdated,
    TResult Function(_ProfileImageUpdated value)? profileImageUpdated,
    TResult Function(_StatusUpdated value)? statusUpdated,
    TResult Function(_EventAssignmentLoaded value)? eventAssignmentLoaded,
    TResult Function(_StaffDataUpdated value)? staffDataUpdated,
    TResult Function(_OrganizerDataUpdated value)? organizerDataUpdated,
    TResult Function(_AttendeeDataUpdated value)? attendeeDataUpdated,
    TResult Function(_ProfileRefreshed value)? profileRefreshed,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements UserProfileState {
  const factory _Error({required final String message}) = _$ErrorImpl;

  String get message;

  /// Create a copy of UserProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
