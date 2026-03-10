// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationResponseImpl _$$RegistrationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationResponseImpl(
      email: json['email'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      avatar: json['avatar'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$RegistrationResponseImplToJson(
        _$RegistrationResponseImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
      'created_at': instance.created_at.toIso8601String(),
    };
