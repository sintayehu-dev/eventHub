import 'package:firebase_auth/firebase_auth.dart';
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
    @Default(false) bool emailVerified,
  }) = _FirebaseUserEntity;

  const FirebaseUserEntity._();

  factory FirebaseUserEntity.fromJson(Map<String, dynamic> json) => 
      _$FirebaseUserEntityFromJson(json);

  factory FirebaseUserEntity.fromFirebaseUser(User user) {
    return FirebaseUserEntity(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      photoUrl: user.photoURL,
      emailVerified: user.emailVerified,
    );
  }
}