import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  final GoogleSignIn _googleSignIn;

  FirebaseAuthDataSourceImpl(this._firebaseAuth, this._googleSignIn);

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
    await Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  @override
  Future<FirebaseUserEntity> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    
    if (googleUser == null) {
      throw FirebaseAuthException(
        code: 'google-sign-in-cancelled',
        message: 'Google sign in was cancelled',
      );
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    
    if (userCredential.user == null) {
      throw FirebaseAuthException(
        code: 'google-sign-in-failed',
        message: 'Failed to sign in with Google',
      );
    }
    
    return FirebaseUserEntity.fromFirebaseUser(userCredential.user!);
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