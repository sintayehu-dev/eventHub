// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirebaseUserEntityImpl _$$FirebaseUserEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$FirebaseUserEntityImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String?,
      photoUrl: json['photoUrl'] as String?,
      emailVerified: json['emailVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$FirebaseUserEntityImplToJson(
        _$FirebaseUserEntityImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'emailVerified': instance.emailVerified,
    };
