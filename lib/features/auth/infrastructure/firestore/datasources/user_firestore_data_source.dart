import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/auth/domain/entities/user_profile_entity.dart';

abstract class UserFirestoreDataSource {
  Future<void> createUserProfile(UserProfileEntity userProfile);
  Future<UserProfileEntity?> getUserProfile(String uid);
  Future<void> updateUserProfile(UserProfileEntity userProfile);
  Future<void> deleteUserProfile(String uid);
  Stream<UserProfileEntity?> getUserProfileStream(String uid);
}

@Injectable(as: UserFirestoreDataSource)
class UserFirestoreDataSourceImpl implements UserFirestoreDataSource {
  final FirebaseFirestore _firestore;
  
  UserFirestoreDataSourceImpl(this._firestore);

  static const String _usersCollection = 'users';

  @override
  Future<void> createUserProfile(UserProfileEntity userProfile) async {
    try {
      await _firestore
          .collection(_usersCollection)
          .doc(userProfile.uid)
          .set(userProfile.toFirestoreData());
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to create user profile: $e',
      );
    }
  }

  @override
  Future<UserProfileEntity?> getUserProfile(String uid) async {
    try {
      final doc = await _firestore
          .collection(_usersCollection)
          .doc(uid)
          .get();

      if (!doc.exists || doc.data() == null) {
        return null;
      }

      return UserProfileEntity.fromFirestoreData(doc.data()!);
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get user profile: $e',
      );
    }
  }

  @override
  Future<void> updateUserProfile(UserProfileEntity userProfile) async {
    try {
      final updatedProfile = userProfile.copyWith(
        updatedAt: DateTime.now(),
      );
      
      await _firestore
          .collection(_usersCollection)
          .doc(userProfile.uid)
          .update(updatedProfile.toFirestoreData());
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to update user profile: $e',
      );
    }
  }

  @override
  Future<void> deleteUserProfile(String uid) async {
    try {
      await _firestore
          .collection(_usersCollection)
          .doc(uid)
          .delete();
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to delete user profile: $e',
      );
    }
  }

  @override
  Stream<UserProfileEntity?> getUserProfileStream(String uid) {
    try {
      return _firestore
          .collection(_usersCollection)
          .doc(uid)
          .snapshots()
          .map((doc) {
        if (!doc.exists || doc.data() == null) {
          return null;
        }
        return UserProfileEntity.fromFirestoreData(doc.data()!);
      });
    } catch (e) {
      throw FirebaseException(
        plugin: 'cloud_firestore',
        message: 'Failed to get user profile stream: $e',
      );
    }
  }
}