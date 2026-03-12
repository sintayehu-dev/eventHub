import 'package:injectable/injectable.dart';
import 'package:eventhub/core/utils/local_storage.dart';
import 'package:eventhub/features/auth/domain/entities/login/login_response.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';

abstract class UserService {
  /// Get the current logged in user data (legacy)
  LoginUser? getCurrentUser();
  
  /// Get the current Firebase user data
  FirebaseUserEntity? getCurrentFirebaseUser();

  /// Show onboarding screen if user is first time opening the app
  bool isFirstTimeOpeningApp();
  
  /// Set the user as first time opening the app
  void setFirstTimeOpeningApp();
  
  /// Check if the user is logged in (legacy)
  bool isLoggedIn();
  
  /// Check if Firebase user is authenticated
  bool isFirebaseUserAuthenticated();

  /// Logout the user (legacy)
  Future<void> logout();
  
  /// Save Firebase user data locally
  Future<void> saveFirebaseUser(FirebaseUserEntity user);

  /// Clear Firebase user data
  Future<void> clearFirebaseUser();
}

@Injectable(as: UserService)
class UserServiceImpl implements UserService {
  
  UserServiceImpl();
  
  @override
  LoginUser? getCurrentUser() {
    final userData = LocalStorage.instance.getUserData();
    if (userData == null) {
      return null;
    }
    
    try {
      return LoginUser.fromJson(userData);
    } catch (e) {
      return null;
    }
  }

  @override
  FirebaseUserEntity? getCurrentFirebaseUser() {
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
    final token = LocalStorage.instance.getAccessToken();
    return token != null && token.isNotEmpty;
  }

  @override
  bool isFirebaseUserAuthenticated() {
    final firebaseUser = getCurrentFirebaseUser();
    return firebaseUser != null;
  }
  
  @override
  Future<void> logout() async {
    await LocalStorage.instance.clearUserSession();
  }

  @override
  Future<void> saveFirebaseUser(FirebaseUserEntity user) async {
    await LocalStorage.instance.setFirebaseUserData(user.toJson());
  }

  @override
  Future<void> clearFirebaseUser() async {
    await LocalStorage.instance.clearFirebaseUserData();
  }
} 
