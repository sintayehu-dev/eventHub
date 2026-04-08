import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';

abstract class FirebaseAuthDataSource {
  Future<FirebaseUserEntity> signInWithEmailAndPassword(String email, String password);
  Future<FirebaseUserEntity> registerWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<FirebaseUserEntity> signInWithGoogle();
  Future<void> sendPasswordResetEmail(String email);
  Future<FirebaseUserEntity?> getCurrentUser();
  Stream<FirebaseUserEntity?> get authStateChanges;
}

@Injectable(as: FirebaseAuthDataSource)
class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDataSourceImpl(this._firebaseAuth);

  @override
  Future<FirebaseUserEntity> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      if (credential.user == null) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user found after sign in',
        );
      }
      
      return FirebaseUserEntity.fromFirebaseUser(credential.user!);
    } on FirebaseAuthException catch (e) {
      // Log the specific error for debugging
      print('FirebaseAuth Error: ${e.code} - ${e.message}');
      rethrow; // Re-throw to be handled by repository layer
    } catch (e) {
      print('Unexpected error during sign in: $e');
      throw FirebaseAuthException(
        code: 'unknown-error',
        message: 'An unexpected error occurred: $e',
      );
    }
  }

  @override
  Future<FirebaseUserEntity> registerWithEmailAndPassword(String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    if (credential.user == null) {
      throw FirebaseAuthException(
        code: 'user-creation-failed',
        message: 'Failed to create user',
      );
    }
    
    return FirebaseUserEntity.fromFirebaseUser(credential.user!);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // TODO: Implement Google Sign-In when needed
  @override
  Future<FirebaseUserEntity> signInWithGoogle() async {
    throw UnimplementedError('Google Sign-In not implemented yet');
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<FirebaseUserEntity?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;
    return user != null ? FirebaseUserEntity.fromFirebaseUser(user) : null;
  }

  @override
  Stream<FirebaseUserEntity?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((user) {
      return user != null ? FirebaseUserEntity.fromFirebaseUser(user) : null;
    });
  }
}