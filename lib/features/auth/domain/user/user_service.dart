import 'package:injectable/injectable.dart';
import 'package:eventhub/core/utils/local_storage.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';
import 'package:eventhub/features/auth/domain/entities/user_profile_entity.dart';
import 'package:eventhub/features/auth/infrastructure/firestore/datasources/user_firestore_data_source.dart';

abstract class UserService {
  /// Get the current Firebase user data
  FirebaseUserEntity? getCurrentUser();

  /// Show onboarding screen if user is first time opening the app
  bool isFirstTimeOpeningApp();
  
  /// Set the user as first time opening the app
  void setFirstTimeOpeningApp();
  
  /// Check if Firebase user is authenticated
  bool isLoggedIn();

  /// Logout the user
  Future<void> logout();
  
  /// Save Firebase user data locally
  Future<void> saveUserData(FirebaseUserEntity user);

  /// Create user profile in Firestore
  Future<void> createUserProfile(UserProfileEntity userProfile);

  /// Get user profile from Firestore
  Future<UserProfileEntity?> getUserProfile(String uid);

  /// Update user profile in Firestore
  Future<void> updateUserProfile(UserProfileEntity userProfile);
}

@Injectable(as: UserService)
class UserServiceImpl implements UserService {
  final UserFirestoreDataSource _userFirestoreDataSource;
  
  UserServiceImpl(this._userFirestoreDataSource);
  
  @override
  FirebaseUserEntity? getCurrentUser() {
    final userData = LocalStorage.instance.getFirebaseUserData();
    if (userData == null) {
      return null;
    }

    try {
      return FirebaseUserEntity.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  @override 
  bool isFirstTimeOpeningApp() {
    final isDoneOnboarding = LocalStorage.instance.getIsDoneOnboarding();
    return !isDoneOnboarding;
  }

  @override
  void setFirstTimeOpeningApp() {
    LocalStorage.instance.setIsDoneOnboarding(true);
  }
  
  @override
  bool isLoggedIn() {
    final firebaseUser = getCurrentUser();
    return firebaseUser != null;
  }
  
  @override
  Future<void> logout() async {
    await LocalStorage.instance.clearUserSession();
  }

  @override
  Future<void> saveUserData(FirebaseUserEntity user) async {
    await LocalStorage.instance.setFirebaseUserData(user.toJson());
  }

  @override
  Future<void> createUserProfile(UserProfileEntity userProfile) async {
    await _userFirestoreDataSource.createUserProfile(userProfile);
  }

  @override
  Future<UserProfileEntity?> getUserProfile(String uid) async {
    return await _userFirestoreDataSource.getUserProfile(uid);
  }

  @override
  Future<void> updateUserProfile(UserProfileEntity userProfile) async {
    await _userFirestoreDataSource.updateUserProfile(userProfile);
  }
} 
