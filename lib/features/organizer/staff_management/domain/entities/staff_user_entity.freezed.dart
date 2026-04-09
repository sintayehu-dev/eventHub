// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StaffUserEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  StaffUserStatus get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastActiveAt => throw _privateConstructorUsedError;
  List<String>? get specializations => throw _privateConstructorUsedError;

  /// Create a copy of StaffUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StaffUserEntityCopyWith<StaffUserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffUserEntityCopyWith<$Res> {
  factory $StaffUserEntityCopyWith(
          StaffUserEntity value, $Res Function(StaffUserEntity) then) =
      _$StaffUserEntityCopyWithImpl<$Res, StaffUserEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String? phone,
      String? profileImageUrl,
      StaffUserStatus status,
      DateTime createdAt,
      DateTime? lastActiveAt,
      List<String>? specializations});
}

/// @nodoc
class _$StaffUserEntityCopyWithImpl<$Res, $Val extends StaffUserEntity>
    implements $StaffUserEntityCopyWith<$Res> {
  _$StaffUserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StaffUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? profileImageUrl = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? lastActiveAt = freezed,
    Object? specializations = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StaffUserStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specializations: freezed == specializations
          ? _value.specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffUserEntityImplCopyWith<$Res>
    implements $StaffUserEntityCopyWith<$Res> {
  factory _$$StaffUserEntityImplCopyWith(_$StaffUserEntityImpl value,
          $Res Function(_$StaffUserEntityImpl) then) =
      __$$StaffUserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String email,
      String? phone,
      String? profileImageUrl,
      StaffUserStatus status,
      DateTime createdAt,
      DateTime? lastActiveAt,
      List<String>? specializations});
}

/// @nodoc
class __$$StaffUserEntityImplCopyWithImpl<$Res>
    extends _$StaffUserEntityCopyWithImpl<$Res, _$StaffUserEntityImpl>
    implements _$$StaffUserEntityImplCopyWith<$Res> {
  __$$StaffUserEntityImplCopyWithImpl(
      _$StaffUserEntityImpl _value, $Res Function(_$StaffUserEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of StaffUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? profileImageUrl = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? lastActiveAt = freezed,
    Object? specializations = freezed,
  }) {
    return _then(_$StaffUserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as StaffUserStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastActiveAt: freezed == lastActiveAt
          ? _value.lastActiveAt
          : lastActiveAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      specializations: freezed == specializations
          ? _value._specializations
          : specializations // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$StaffUserEntityImpl implements _StaffUserEntity {
  const _$StaffUserEntityImpl(
      {required this.id,
      required this.name,
      required this.email,
      this.phone,
      this.profileImageUrl,
      required this.status,
      required this.createdAt,
      this.lastActiveAt,
      final List<String>? specializations})
      : _specializations = specializations;

  @override
  final String id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final String? profileImageUrl;
  @override
  final StaffUserStatus status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastActiveAt;
  final List<String>? _specializations;
  @override
  List<String>? get specializations {
    final value = _specializations;
    if (value == null) return null;
    if (_specializations is EqualUnmodifiableListView) return _specializations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'StaffUserEntity(id: $id, name: $name, email: $email, phone: $phone, profileImageUrl: $profileImageUrl, status: $status, createdAt: $createdAt, lastActiveAt: $lastActiveAt, specializations: $specializations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffUserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastActiveAt, lastActiveAt) ||
                other.lastActiveAt == lastActiveAt) &&
            const DeepCollectionEquality()
                .equals(other._specializations, _specializations));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      phone,
      profileImageUrl,
      status,
      createdAt,
      lastActiveAt,
      const DeepCollectionEquality().hash(_specializations));

  /// Create a copy of StaffUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffUserEntityImplCopyWith<_$StaffUserEntityImpl> get copyWith =>
      __$$StaffUserEntityImplCopyWithImpl<_$StaffUserEntityImpl>(
          this, _$identity);
}

abstract class _StaffUserEntity implements StaffUserEntity {
  const factory _StaffUserEntity(
      {required final String id,
      required final String name,
      required final String email,
      final String? phone,
      final String? profileImageUrl,
      required final StaffUserStatus status,
      required final DateTime createdAt,
      final DateTime? lastActiveAt,
      final List<String>? specializations}) = _$StaffUserEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  String? get profileImageUrl;
  @override
  StaffUserStatus get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastActiveAt;
  @override
  List<String>? get specializations;

  /// Create a copy of StaffUserEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StaffUserEntityImplCopyWith<_$StaffUserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
