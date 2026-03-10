// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegistrationResponse _$RegistrationResponseFromJson(Map<String, dynamic> json) {
  return _RegistrationResponse.fromJson(json);
}

/// @nodoc
mixin _$RegistrationResponse {
  String get email => throw _privateConstructorUsedError;
  String get first_name => throw _privateConstructorUsedError;
  String get last_name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;

  /// Serializes this RegistrationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationResponseCopyWith<RegistrationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationResponseCopyWith<$Res> {
  factory $RegistrationResponseCopyWith(RegistrationResponse value,
          $Res Function(RegistrationResponse) then) =
      _$RegistrationResponseCopyWithImpl<$Res, RegistrationResponse>;
  @useResult
  $Res call(
      {String email,
      String first_name,
      String last_name,
      String avatar,
      DateTime created_at});
}

/// @nodoc
class _$RegistrationResponseCopyWithImpl<$Res,
        $Val extends RegistrationResponse>
    implements $RegistrationResponseCopyWith<$Res> {
  _$RegistrationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? first_name = null,
    Object? last_name = null,
    Object? avatar = null,
    Object? created_at = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      first_name: null == first_name
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: null == last_name
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationResponseImplCopyWith<$Res>
    implements $RegistrationResponseCopyWith<$Res> {
  factory _$$RegistrationResponseImplCopyWith(_$RegistrationResponseImpl value,
          $Res Function(_$RegistrationResponseImpl) then) =
      __$$RegistrationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String first_name,
      String last_name,
      String avatar,
      DateTime created_at});
}

/// @nodoc
class __$$RegistrationResponseImplCopyWithImpl<$Res>
    extends _$RegistrationResponseCopyWithImpl<$Res, _$RegistrationResponseImpl>
    implements _$$RegistrationResponseImplCopyWith<$Res> {
  __$$RegistrationResponseImplCopyWithImpl(_$RegistrationResponseImpl _value,
      $Res Function(_$RegistrationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? first_name = null,
    Object? last_name = null,
    Object? avatar = null,
    Object? created_at = null,
  }) {
    return _then(_$RegistrationResponseImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      first_name: null == first_name
          ? _value.first_name
          : first_name // ignore: cast_nullable_to_non_nullable
              as String,
      last_name: null == last_name
          ? _value.last_name
          : last_name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      created_at: null == created_at
          ? _value.created_at
          : created_at // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegistrationResponseImpl extends _RegistrationResponse {
  const _$RegistrationResponseImpl(
      {required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar,
      required this.created_at})
      : super._();

  factory _$RegistrationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegistrationResponseImplFromJson(json);

  @override
  final String email;
  @override
  final String first_name;
  @override
  final String last_name;
  @override
  final String avatar;
  @override
  final DateTime created_at;

  @override
  String toString() {
    return 'RegistrationResponse(email: $email, first_name: $first_name, last_name: $last_name, avatar: $avatar, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationResponseImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.first_name, first_name) ||
                other.first_name == first_name) &&
            (identical(other.last_name, last_name) ||
                other.last_name == last_name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, email, first_name, last_name, avatar, created_at);

  /// Create a copy of RegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationResponseImplCopyWith<_$RegistrationResponseImpl>
      get copyWith =>
          __$$RegistrationResponseImplCopyWithImpl<_$RegistrationResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegistrationResponseImplToJson(
      this,
    );
  }
}

abstract class _RegistrationResponse extends RegistrationResponse {
  const factory _RegistrationResponse(
      {required final String email,
      required final String first_name,
      required final String last_name,
      required final String avatar,
      required final DateTime created_at}) = _$RegistrationResponseImpl;
  const _RegistrationResponse._() : super._();

  factory _RegistrationResponse.fromJson(Map<String, dynamic> json) =
      _$RegistrationResponseImpl.fromJson;

  @override
  String get email;
  @override
  String get first_name;
  @override
  String get last_name;
  @override
  String get avatar;
  @override
  DateTime get created_at;

  /// Create a copy of RegistrationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationResponseImplCopyWith<_$RegistrationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
