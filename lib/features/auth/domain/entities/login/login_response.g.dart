// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseImpl _$$LoginResponseImplFromJson(Map<String, dynamic> json) =>
    _$LoginResponseImpl(
      session_id: json['session_id'] as String,
      access_token: json['access_token'] as String,
      access_token_expires_at:
          DateTime.parse(json['access_token_expires_at'] as String),
      refresh_token: json['refresh_token'] as String,
      refresh_token_expires_at:
          DateTime.parse(json['refresh_token_expires_at'] as String),
      user: LoginUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseImplToJson(_$LoginResponseImpl instance) =>
    <String, dynamic>{
      'session_id': instance.session_id,
      'access_token': instance.access_token,
      'access_token_expires_at':
          instance.access_token_expires_at.toIso8601String(),
      'refresh_token': instance.refresh_token,
      'refresh_token_expires_at':
          instance.refresh_token_expires_at.toIso8601String(),
      'user': instance.user,
    };

_$LoginUserImpl _$$LoginUserImplFromJson(Map<String, dynamic> json) =>
    _$LoginUserImpl(
      email: json['email'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      avatar: json['avatar'] as String,
      created_at: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$LoginUserImplToJson(_$LoginUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
      'created_at': instance.created_at.toIso8601String(),
    };
