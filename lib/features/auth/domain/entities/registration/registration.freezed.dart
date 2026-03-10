// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationRequest {
  Name get firstName => throw _privateConstructorUsedError;
  Name get lastName => throw _privateConstructorUsedError;
  EmailAddress get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;
  ConfirmPassword get confirmPassword => throw _privateConstructorUsedError;
  TermsAcceptance get termsAcceptance => throw _privateConstructorUsedError;
  ProfilePhoto get profilePhoto => throw _privateConstructorUsedError;

  /// Create a copy of RegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegistrationRequestCopyWith<RegistrationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationRequestCopyWith<$Res> {
  factory $RegistrationRequestCopyWith(
          RegistrationRequest value, $Res Function(RegistrationRequest) then) =
      _$RegistrationRequestCopyWithImpl<$Res, RegistrationRequest>;
  @useResult
  $Res call(
      {Name firstName,
      Name lastName,
      EmailAddress email,
      Password password,
      ConfirmPassword confirmPassword,
      TermsAcceptance termsAcceptance,
      ProfilePhoto profilePhoto});
}

/// @nodoc
class _$RegistrationRequestCopyWithImpl<$Res, $Val extends RegistrationRequest>
    implements $RegistrationRequestCopyWith<$Res> {
  _$RegistrationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? termsAcceptance = null,
    Object? profilePhoto = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Name,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Name,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPassword,
      termsAcceptance: null == termsAcceptance
          ? _value.termsAcceptance
          : termsAcceptance // ignore: cast_nullable_to_non_nullable
              as TermsAcceptance,
      profilePhoto: null == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as ProfilePhoto,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegistrationImplCopyWith<$Res>
    implements $RegistrationRequestCopyWith<$Res> {
  factory _$$RegistrationImplCopyWith(
          _$RegistrationImpl value, $Res Function(_$RegistrationImpl) then) =
      __$$RegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Name firstName,
      Name lastName,
      EmailAddress email,
      Password password,
      ConfirmPassword confirmPassword,
      TermsAcceptance termsAcceptance,
      ProfilePhoto profilePhoto});
}

/// @nodoc
class __$$RegistrationImplCopyWithImpl<$Res>
    extends _$RegistrationRequestCopyWithImpl<$Res, _$RegistrationImpl>
    implements _$$RegistrationImplCopyWith<$Res> {
  __$$RegistrationImplCopyWithImpl(
      _$RegistrationImpl _value, $Res Function(_$RegistrationImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? termsAcceptance = null,
    Object? profilePhoto = null,
  }) {
    return _then(_$RegistrationImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as Name,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as Name,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as ConfirmPassword,
      termsAcceptance: null == termsAcceptance
          ? _value.termsAcceptance
          : termsAcceptance // ignore: cast_nullable_to_non_nullable
              as TermsAcceptance,
      profilePhoto: null == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as ProfilePhoto,
    ));
  }
}

/// @nodoc

class _$RegistrationImpl extends _Registration {
  const _$RegistrationImpl(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.termsAcceptance,
      required this.profilePhoto})
      : super._();

  @override
  final Name firstName;
  @override
  final Name lastName;
  @override
  final EmailAddress email;
  @override
  final Password password;
  @override
  final ConfirmPassword confirmPassword;
  @override
  final TermsAcceptance termsAcceptance;
  @override
  final ProfilePhoto profilePhoto;

  @override
  String toString() {
    return 'RegistrationRequest(firstName: $firstName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword, termsAcceptance: $termsAcceptance, profilePhoto: $profilePhoto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegistrationImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.termsAcceptance, termsAcceptance) ||
                other.termsAcceptance == termsAcceptance) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, email,
      password, confirmPassword, termsAcceptance, profilePhoto);

  /// Create a copy of RegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegistrationImplCopyWith<_$RegistrationImpl> get copyWith =>
      __$$RegistrationImplCopyWithImpl<_$RegistrationImpl>(this, _$identity);
}

abstract class _Registration extends RegistrationRequest {
  const factory _Registration(
      {required final Name firstName,
      required final Name lastName,
      required final EmailAddress email,
      required final Password password,
      required final ConfirmPassword confirmPassword,
      required final TermsAcceptance termsAcceptance,
      required final ProfilePhoto profilePhoto}) = _$RegistrationImpl;
  const _Registration._() : super._();

  @override
  Name get firstName;
  @override
  Name get lastName;
  @override
  EmailAddress get email;
  @override
  Password get password;
  @override
  ConfirmPassword get confirmPassword;
  @override
  TermsAcceptance get termsAcceptance;
  @override
  ProfilePhoto get profilePhoto;

  /// Create a copy of RegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegistrationImplCopyWith<_$RegistrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
