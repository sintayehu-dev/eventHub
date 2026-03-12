import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';
part 'user_profile_entity.g.dart';

@freezed
class UserProfileEntity with _$UserProfileEntity {
  const factory UserProfileEntity({
    required String uid,
    required String email,
    String? displayName,
    String? photoURL,
    required String role, // organizer or attendee
    String? phoneNumber,
    String? bio,
    List<String>? interests,
    @Default(false) bool isEmailVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserProfileEntity;

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);

  const UserProfileEntity._();

  /// Create a user profile from Firebase Auth user and additional data
  factory UserProfileEntity.fromFirebaseUser({
    required String uid,
    required String email,
    String? displayName,
    String? photoURL,
    bool? isEmailVerified,
    required String role,
    String? phoneNumber,
    String? bio,
    List<String>? interests,
  }) {
    return UserProfileEntity(
      uid: uid,
      email: email,
      displayName: displayName,
      photoURL: photoURL,
      role: role,
      phoneNumber: phoneNumber,
      bio: bio,
      interests: interests ?? [],
      isEmailVerified: isEmailVerified ?? false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }

  /// Convert to Firestore document data
  Map<String, dynamic> toFirestoreData() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'role': role,
      'phoneNumber': phoneNumber,
      'bio': bio,
      'interests': interests,
      'isEmailVerified': isEmailVerified,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  /// Create from Firestore document data
  factory UserProfileEntity.fromFirestoreData(Map<String, dynamic> data) {
    return UserProfileEntity(
      uid: data['uid'] as String,
      email: data['email'] as String,
      displayName: data['displayName'] as String?,
      photoURL: data['photoURL'] as String?,
      role: data['role'] as String,
      phoneNumber: data['phoneNumber'] as String?,
      bio: data['bio'] as String?,
      interests: (data['interests'] as List<dynamic>?)?.cast<String>(),
      isEmailVerified: data['isEmailVerified'] as bool? ?? false,
      createdAt: data['createdAt'] != null 
          ? DateTime.parse(data['createdAt'] as String)
          : null,
      updatedAt: data['updatedAt'] != null 
          ? DateTime.parse(data['updatedAt'] as String)
          : null,
    );
  }
}