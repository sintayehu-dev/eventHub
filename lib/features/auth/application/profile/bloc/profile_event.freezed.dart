// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(String displayName) updateDisplayName,
    required TResult Function(String? photoPath) updateProfilePhoto,
    required TResult Function(String email) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
        updatePassword,
    required TResult Function() deleteAccount,
    required TResult Function() refreshProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(String displayName)? updateDisplayName,
    TResult? Function(String? photoPath)? updateProfilePhoto,
    TResult? Function(String email)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult? Function()? deleteAccount,
    TResult? Function()? refreshProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(String displayName)? updateDisplayName,
    TResult Function(String? photoPath)? updateProfilePhoto,
    TResult Function(String email)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult Function()? deleteAccount,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(UpdateEmail value) updateEmail,
    required TResult Function(UpdatePassword value) updatePassword,
    required TResult Function(DeleteAccount value) deleteAccount,
    required TResult Function(RefreshProfile value) refreshProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult? Function(UpdateEmail value)? updateEmail,
    TResult? Function(UpdatePassword value)? updatePassword,
    TResult? Function(DeleteAccount value)? deleteAccount,
    TResult? Function(RefreshProfile value)? refreshProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(UpdateEmail value)? updateEmail,
    TResult Function(UpdatePassword value)? updatePassword,
    TResult Function(DeleteAccount value)? deleteAccount,
    TResult Function(RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadProfileImplCopyWith<$Res> {
  factory _$$LoadProfileImplCopyWith(
          _$LoadProfileImpl value, $Res Function(_$LoadProfileImpl) then) =
      __$$LoadProfileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$LoadProfileImpl>
    implements _$$LoadProfileImplCopyWith<$Res> {
  __$$LoadProfileImplCopyWithImpl(
      _$LoadProfileImpl _value, $Res Function(_$LoadProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadProfileImpl implements LoadProfile {
  const _$LoadProfileImpl();

  @override
  String toString() {
    return 'ProfileEvent.loadProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadProfileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(String displayName) updateDisplayName,
    required TResult Function(String? photoPath) updateProfilePhoto,
    required TResult Function(String email) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
        updatePassword,
    required TResult Function() deleteAccount,
    required TResult Function() refreshProfile,
  }) {
    return loadProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(String displayName)? updateDisplayName,
    TResult? Function(String? photoPath)? updateProfilePhoto,
    TResult? Function(String email)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult? Function()? deleteAccount,
    TResult? Function()? refreshProfile,
  }) {
    return loadProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(String displayName)? updateDisplayName,
    TResult Function(String? photoPath)? updateProfilePhoto,
    TResult Function(String email)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult Function()? deleteAccount,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(UpdateEmail value) updateEmail,
    required TResult Function(UpdatePassword value) updatePassword,
    required TResult Function(DeleteAccount value) deleteAccount,
    required TResult Function(RefreshProfile value) refreshProfile,
  }) {
    return loadProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult? Function(UpdateEmail value)? updateEmail,
    TResult? Function(UpdatePassword value)? updatePassword,
    TResult? Function(DeleteAccount value)? deleteAccount,
    TResult? Function(RefreshProfile value)? refreshProfile,
  }) {
    return loadProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(UpdateEmail value)? updateEmail,
    TResult Function(UpdatePassword value)? updatePassword,
    TResult Function(DeleteAccount value)? deleteAccount,
    TResult Function(RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile(this);
    }
    return orElse();
  }
}

abstract class LoadProfile implements ProfileEvent {
  const factory LoadProfile() = _$LoadProfileImpl;
}

/// @nodoc
abstract class _$$UpdateDisplayNameImplCopyWith<$Res> {
  factory _$$UpdateDisplayNameImplCopyWith(_$UpdateDisplayNameImpl value,
          $Res Function(_$UpdateDisplayNameImpl) then) =
      __$$UpdateDisplayNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String displayName});
}

/// @nodoc
class __$$UpdateDisplayNameImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateDisplayNameImpl>
    implements _$$UpdateDisplayNameImplCopyWith<$Res> {
  __$$UpdateDisplayNameImplCopyWithImpl(_$UpdateDisplayNameImpl _value,
      $Res Function(_$UpdateDisplayNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
  }) {
    return _then(_$UpdateDisplayNameImpl(
      null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateDisplayNameImpl implements UpdateDisplayName {
  const _$UpdateDisplayNameImpl(this.displayName);

  @override
  final String displayName;

  @override
  String toString() {
    return 'ProfileEvent.updateDisplayName(displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDisplayNameImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDisplayNameImplCopyWith<_$UpdateDisplayNameImpl> get copyWith =>
      __$$UpdateDisplayNameImplCopyWithImpl<_$UpdateDisplayNameImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(String displayName) updateDisplayName,
    required TResult Function(String? photoPath) updateProfilePhoto,
    required TResult Function(String email) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
        updatePassword,
    required TResult Function() deleteAccount,
    required TResult Function() refreshProfile,
  }) {
    return updateDisplayName(displayName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(String displayName)? updateDisplayName,
    TResult? Function(String? photoPath)? updateProfilePhoto,
    TResult? Function(String email)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult? Function()? deleteAccount,
    TResult? Function()? refreshProfile,
  }) {
    return updateDisplayName?.call(displayName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(String displayName)? updateDisplayName,
    TResult Function(String? photoPath)? updateProfilePhoto,
    TResult Function(String email)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult Function()? deleteAccount,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateDisplayName != null) {
      return updateDisplayName(displayName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(UpdateEmail value) updateEmail,
    required TResult Function(UpdatePassword value) updatePassword,
    required TResult Function(DeleteAccount value) deleteAccount,
    required TResult Function(RefreshProfile value) refreshProfile,
  }) {
    return updateDisplayName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult? Function(UpdateEmail value)? updateEmail,
    TResult? Function(UpdatePassword value)? updatePassword,
    TResult? Function(DeleteAccount value)? deleteAccount,
    TResult? Function(RefreshProfile value)? refreshProfile,
  }) {
    return updateDisplayName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(UpdateEmail value)? updateEmail,
    TResult Function(UpdatePassword value)? updatePassword,
    TResult Function(DeleteAccount value)? deleteAccount,
    TResult Function(RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateDisplayName != null) {
      return updateDisplayName(this);
    }
    return orElse();
  }
}

abstract class UpdateDisplayName implements ProfileEvent {
  const factory UpdateDisplayName(final String displayName) =
      _$UpdateDisplayNameImpl;

  String get displayName;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDisplayNameImplCopyWith<_$UpdateDisplayNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfilePhotoImplCopyWith<$Res> {
  factory _$$UpdateProfilePhotoImplCopyWith(_$UpdateProfilePhotoImpl value,
          $Res Function(_$UpdateProfilePhotoImpl) then) =
      __$$UpdateProfilePhotoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? photoPath});
}

/// @nodoc
class __$$UpdateProfilePhotoImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateProfilePhotoImpl>
    implements _$$UpdateProfilePhotoImplCopyWith<$Res> {
  __$$UpdateProfilePhotoImplCopyWithImpl(_$UpdateProfilePhotoImpl _value,
      $Res Function(_$UpdateProfilePhotoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photoPath = freezed,
  }) {
    return _then(_$UpdateProfilePhotoImpl(
      freezed == photoPath
          ? _value.photoPath
          : photoPath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UpdateProfilePhotoImpl implements UpdateProfilePhoto {
  const _$UpdateProfilePhotoImpl(this.photoPath);

  @override
  final String? photoPath;

  @override
  String toString() {
    return 'ProfileEvent.updateProfilePhoto(photoPath: $photoPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfilePhotoImpl &&
            (identical(other.photoPath, photoPath) ||
                other.photoPath == photoPath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photoPath);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfilePhotoImplCopyWith<_$UpdateProfilePhotoImpl> get copyWith =>
      __$$UpdateProfilePhotoImplCopyWithImpl<_$UpdateProfilePhotoImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(String displayName) updateDisplayName,
    required TResult Function(String? photoPath) updateProfilePhoto,
    required TResult Function(String email) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
        updatePassword,
    required TResult Function() deleteAccount,
    required TResult Function() refreshProfile,
  }) {
    return updateProfilePhoto(photoPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(String displayName)? updateDisplayName,
    TResult? Function(String? photoPath)? updateProfilePhoto,
    TResult? Function(String email)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult? Function()? deleteAccount,
    TResult? Function()? refreshProfile,
  }) {
    return updateProfilePhoto?.call(photoPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(String displayName)? updateDisplayName,
    TResult Function(String? photoPath)? updateProfilePhoto,
    TResult Function(String email)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult Function()? deleteAccount,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateProfilePhoto != null) {
      return updateProfilePhoto(photoPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(UpdateEmail value) updateEmail,
    required TResult Function(UpdatePassword value) updatePassword,
    required TResult Function(DeleteAccount value) deleteAccount,
    required TResult Function(RefreshProfile value) refreshProfile,
  }) {
    return updateProfilePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult? Function(UpdateEmail value)? updateEmail,
    TResult? Function(UpdatePassword value)? updatePassword,
    TResult? Function(DeleteAccount value)? deleteAccount,
    TResult? Function(RefreshProfile value)? refreshProfile,
  }) {
    return updateProfilePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(UpdateEmail value)? updateEmail,
    TResult Function(UpdatePassword value)? updatePassword,
    TResult Function(DeleteAccount value)? deleteAccount,
    TResult Function(RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateProfilePhoto != null) {
      return updateProfilePhoto(this);
    }
    return orElse();
  }
}

abstract class UpdateProfilePhoto implements ProfileEvent {
  const factory UpdateProfilePhoto(final String? photoPath) =
      _$UpdateProfilePhotoImpl;

  String? get photoPath;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfilePhotoImplCopyWith<_$UpdateProfilePhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateEmailImplCopyWith<$Res> {
  factory _$$UpdateEmailImplCopyWith(
          _$UpdateEmailImpl value, $Res Function(_$UpdateEmailImpl) then) =
      __$$UpdateEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$UpdateEmailImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateEmailImpl>
    implements _$$UpdateEmailImplCopyWith<$Res> {
  __$$UpdateEmailImplCopyWithImpl(
      _$UpdateEmailImpl _value, $Res Function(_$UpdateEmailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$UpdateEmailImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateEmailImpl implements UpdateEmail {
  const _$UpdateEmailImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'ProfileEvent.updateEmail(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEmailImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEmailImplCopyWith<_$UpdateEmailImpl> get copyWith =>
      __$$UpdateEmailImplCopyWithImpl<_$UpdateEmailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(String displayName) updateDisplayName,
    required TResult Function(String? photoPath) updateProfilePhoto,
    required TResult Function(String email) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
        updatePassword,
    required TResult Function() deleteAccount,
    required TResult Function() refreshProfile,
  }) {
    return updateEmail(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(String displayName)? updateDisplayName,
    TResult? Function(String? photoPath)? updateProfilePhoto,
    TResult? Function(String email)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult? Function()? deleteAccount,
    TResult? Function()? refreshProfile,
  }) {
    return updateEmail?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(String displayName)? updateDisplayName,
    TResult Function(String? photoPath)? updateProfilePhoto,
    TResult Function(String email)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult Function()? deleteAccount,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateEmail != null) {
      return updateEmail(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(UpdateEmail value) updateEmail,
    required TResult Function(UpdatePassword value) updatePassword,
    required TResult Function(DeleteAccount value) deleteAccount,
    required TResult Function(RefreshProfile value) refreshProfile,
  }) {
    return updateEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult? Function(UpdateEmail value)? updateEmail,
    TResult? Function(UpdatePassword value)? updatePassword,
    TResult? Function(DeleteAccount value)? deleteAccount,
    TResult? Function(RefreshProfile value)? refreshProfile,
  }) {
    return updateEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(UpdateEmail value)? updateEmail,
    TResult Function(UpdatePassword value)? updatePassword,
    TResult Function(DeleteAccount value)? deleteAccount,
    TResult Function(RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updateEmail != null) {
      return updateEmail(this);
    }
    return orElse();
  }
}

abstract class UpdateEmail implements ProfileEvent {
  const factory UpdateEmail(final String email) = _$UpdateEmailImpl;

  String get email;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEmailImplCopyWith<_$UpdateEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePasswordImplCopyWith<$Res> {
  factory _$$UpdatePasswordImplCopyWith(_$UpdatePasswordImpl value,
          $Res Function(_$UpdatePasswordImpl) then) =
      __$$UpdatePasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String currentPassword, String newPassword});
}

/// @nodoc
class __$$UpdatePasswordImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdatePasswordImpl>
    implements _$$UpdatePasswordImplCopyWith<$Res> {
  __$$UpdatePasswordImplCopyWithImpl(
      _$UpdatePasswordImpl _value, $Res Function(_$UpdatePasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPassword = null,
    Object? newPassword = null,
  }) {
    return _then(_$UpdatePasswordImpl(
      null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePasswordImpl implements UpdatePassword {
  const _$UpdatePasswordImpl(this.currentPassword, this.newPassword);

  @override
  final String currentPassword;
  @override
  final String newPassword;

  @override
  String toString() {
    return 'ProfileEvent.updatePassword(currentPassword: $currentPassword, newPassword: $newPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordImpl &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentPassword, newPassword);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordImplCopyWith<_$UpdatePasswordImpl> get copyWith =>
      __$$UpdatePasswordImplCopyWithImpl<_$UpdatePasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(String displayName) updateDisplayName,
    required TResult Function(String? photoPath) updateProfilePhoto,
    required TResult Function(String email) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
        updatePassword,
    required TResult Function() deleteAccount,
    required TResult Function() refreshProfile,
  }) {
    return updatePassword(currentPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(String displayName)? updateDisplayName,
    TResult? Function(String? photoPath)? updateProfilePhoto,
    TResult? Function(String email)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult? Function()? deleteAccount,
    TResult? Function()? refreshProfile,
  }) {
    return updatePassword?.call(currentPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(String displayName)? updateDisplayName,
    TResult Function(String? photoPath)? updateProfilePhoto,
    TResult Function(String email)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult Function()? deleteAccount,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (updatePassword != null) {
      return updatePassword(currentPassword, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(UpdateEmail value) updateEmail,
    required TResult Function(UpdatePassword value) updatePassword,
    required TResult Function(DeleteAccount value) deleteAccount,
    required TResult Function(RefreshProfile value) refreshProfile,
  }) {
    return updatePassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult? Function(UpdateEmail value)? updateEmail,
    TResult? Function(UpdatePassword value)? updatePassword,
    TResult? Function(DeleteAccount value)? deleteAccount,
    TResult? Function(RefreshProfile value)? refreshProfile,
  }) {
    return updatePassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(UpdateEmail value)? updateEmail,
    TResult Function(UpdatePassword value)? updatePassword,
    TResult Function(DeleteAccount value)? deleteAccount,
    TResult Function(RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (updatePassword != null) {
      return updatePassword(this);
    }
    return orElse();
  }
}

abstract class UpdatePassword implements ProfileEvent {
  const factory UpdatePassword(
          final String currentPassword, final String newPassword) =
      _$UpdatePasswordImpl;

  String get currentPassword;
  String get newPassword;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordImplCopyWith<_$UpdatePasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAccountImplCopyWith<$Res> {
  factory _$$DeleteAccountImplCopyWith(
          _$DeleteAccountImpl value, $Res Function(_$DeleteAccountImpl) then) =
      __$$DeleteAccountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteAccountImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$DeleteAccountImpl>
    implements _$$DeleteAccountImplCopyWith<$Res> {
  __$$DeleteAccountImplCopyWithImpl(
      _$DeleteAccountImpl _value, $Res Function(_$DeleteAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteAccountImpl implements DeleteAccount {
  const _$DeleteAccountImpl();

  @override
  String toString() {
    return 'ProfileEvent.deleteAccount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteAccountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(String displayName) updateDisplayName,
    required TResult Function(String? photoPath) updateProfilePhoto,
    required TResult Function(String email) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
        updatePassword,
    required TResult Function() deleteAccount,
    required TResult Function() refreshProfile,
  }) {
    return deleteAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(String displayName)? updateDisplayName,
    TResult? Function(String? photoPath)? updateProfilePhoto,
    TResult? Function(String email)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult? Function()? deleteAccount,
    TResult? Function()? refreshProfile,
  }) {
    return deleteAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(String displayName)? updateDisplayName,
    TResult Function(String? photoPath)? updateProfilePhoto,
    TResult Function(String email)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult Function()? deleteAccount,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(UpdateEmail value) updateEmail,
    required TResult Function(UpdatePassword value) updatePassword,
    required TResult Function(DeleteAccount value) deleteAccount,
    required TResult Function(RefreshProfile value) refreshProfile,
  }) {
    return deleteAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult? Function(UpdateEmail value)? updateEmail,
    TResult? Function(UpdatePassword value)? updatePassword,
    TResult? Function(DeleteAccount value)? deleteAccount,
    TResult? Function(RefreshProfile value)? refreshProfile,
  }) {
    return deleteAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(UpdateEmail value)? updateEmail,
    TResult Function(UpdatePassword value)? updatePassword,
    TResult Function(DeleteAccount value)? deleteAccount,
    TResult Function(RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount(this);
    }
    return orElse();
  }
}

abstract class DeleteAccount implements ProfileEvent {
  const factory DeleteAccount() = _$DeleteAccountImpl;
}

/// @nodoc
abstract class _$$RefreshProfileImplCopyWith<$Res> {
  factory _$$RefreshProfileImplCopyWith(_$RefreshProfileImpl value,
          $Res Function(_$RefreshProfileImpl) then) =
      __$$RefreshProfileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$RefreshProfileImpl>
    implements _$$RefreshProfileImplCopyWith<$Res> {
  __$$RefreshProfileImplCopyWithImpl(
      _$RefreshProfileImpl _value, $Res Function(_$RefreshProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshProfileImpl implements RefreshProfile {
  const _$RefreshProfileImpl();

  @override
  String toString() {
    return 'ProfileEvent.refreshProfile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshProfileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadProfile,
    required TResult Function(String displayName) updateDisplayName,
    required TResult Function(String? photoPath) updateProfilePhoto,
    required TResult Function(String email) updateEmail,
    required TResult Function(String currentPassword, String newPassword)
        updatePassword,
    required TResult Function() deleteAccount,
    required TResult Function() refreshProfile,
  }) {
    return refreshProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadProfile,
    TResult? Function(String displayName)? updateDisplayName,
    TResult? Function(String? photoPath)? updateProfilePhoto,
    TResult? Function(String email)? updateEmail,
    TResult? Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult? Function()? deleteAccount,
    TResult? Function()? refreshProfile,
  }) {
    return refreshProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadProfile,
    TResult Function(String displayName)? updateDisplayName,
    TResult Function(String? photoPath)? updateProfilePhoto,
    TResult Function(String email)? updateEmail,
    TResult Function(String currentPassword, String newPassword)?
        updatePassword,
    TResult Function()? deleteAccount,
    TResult Function()? refreshProfile,
    required TResult orElse(),
  }) {
    if (refreshProfile != null) {
      return refreshProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateDisplayName value) updateDisplayName,
    required TResult Function(UpdateProfilePhoto value) updateProfilePhoto,
    required TResult Function(UpdateEmail value) updateEmail,
    required TResult Function(UpdatePassword value) updatePassword,
    required TResult Function(DeleteAccount value) deleteAccount,
    required TResult Function(RefreshProfile value) refreshProfile,
  }) {
    return refreshProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateDisplayName value)? updateDisplayName,
    TResult? Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult? Function(UpdateEmail value)? updateEmail,
    TResult? Function(UpdatePassword value)? updatePassword,
    TResult? Function(DeleteAccount value)? deleteAccount,
    TResult? Function(RefreshProfile value)? refreshProfile,
  }) {
    return refreshProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateDisplayName value)? updateDisplayName,
    TResult Function(UpdateProfilePhoto value)? updateProfilePhoto,
    TResult Function(UpdateEmail value)? updateEmail,
    TResult Function(UpdatePassword value)? updatePassword,
    TResult Function(DeleteAccount value)? deleteAccount,
    TResult Function(RefreshProfile value)? refreshProfile,
    required TResult orElse(),
  }) {
    if (refreshProfile != null) {
      return refreshProfile(this);
    }
    return orElse();
  }
}

abstract class RefreshProfile implements ProfileEvent {
  const factory RefreshProfile() = _$RefreshProfileImpl;
}
