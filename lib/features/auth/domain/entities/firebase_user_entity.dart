import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_user_entity.freezed.dart';
part 'firebase_user_entity.g.dart';

@freezed
class FirebaseUserEntity with _$FirebaseUserEntity {
  const factory FirebaseUserEntity({
    required String uid,
    required String email,
    String? displayName,
    String? photoUrl,
  }) = _FirebaseUserEntity;

  const FirebaseUserEntity._();

  factory FirebaseUserEntity.fromJson(Map<String, dynamic> json) => 
      _$FirebaseUserEntityFromJson(json);
}