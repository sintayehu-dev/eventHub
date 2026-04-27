import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  Future<void> deleteAccount();
}

@Injectable(as: FirebaseAuthDataSource)
class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  FirebaseAuthDataSourceImpl(
    this._firebaseAuth,
    this._googleSignIn,
    this._firestore,
    this._storage,
  );

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

  @override
  Future<void> deleteAccount() async {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      throw FirebaseAuthException(
        code: 'no-current-user',
        message: 'No user is currently signed in',
      );
    }

    final userId = user.uid;

    try {
      // 1. Delete user data from Firestore
      await _deleteUserData(userId);

      // 2. Delete user files from Storage
      await _deleteUserStorage(userId);

      // 3. Sign out from Google if signed in with Google
      await _googleSignIn.signOut();

      // 4. Delete the Firebase Auth account
      await user.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw FirebaseAuthException(
          code: 'requires-recent-login',
          message: 'Please sign in again before deleting your account',
        );
      }
      rethrow;
    }
  }

  Future<void> _deleteUserData(String userId) async {
    final batch = _firestore.batch();

    try {
      // Delete user profile
      final userProfileRef = _firestore.collection('users').doc(userId);
      batch.delete(userProfileRef);

      // Delete user's events (as organizer)
      final eventsQuery = await _firestore
          .collection('events')
          .where('organizerId', isEqualTo: userId)
          .get();

      for (final doc in eventsQuery.docs) {
        batch.delete(doc.reference);
      }

      // Delete user's event registrations
      final registrationsQuery = await _firestore
          .collection('eventRegistrations')
          .where('userId', isEqualTo: userId)
          .get();

      for (final doc in registrationsQuery.docs) {
        batch.delete(doc.reference);
      }

      // Delete user's staff assignments
      final staffQuery = await _firestore
          .collection('staff')
          .where('userId', isEqualTo: userId)
          .get();

      for (final doc in staffQuery.docs) {
        batch.delete(doc.reference);
      }

      // Commit all deletions
      await batch.commit();
    } catch (e) {
      print('Error deleting user data: $e');
      // Continue with account deletion even if data deletion fails
    }
  }

  Future<void> _deleteUserStorage(String userId) async {
    try {
      // Delete user profile images
      final profileRef = _storage.ref().child('users/$userId');
      await _deleteStorageFolder(profileRef);

      // Delete user's event images
      final eventsRef = _storage.ref().child('events/$userId');
      await _deleteStorageFolder(eventsRef);
    } catch (e) {
      print('Error deleting user storage: $e');
      // Continue with account deletion even if storage deletion fails
    }
  }

  Future<void> _deleteStorageFolder(Reference folderRef) async {
    try {
      final listResult = await folderRef.listAll();

      // Delete all files in the folder
      for (final item in listResult.items) {
        await item.delete();
      }

      // Recursively delete subfolders
      for (final prefix in listResult.prefixes) {
        await _deleteStorageFolder(prefix);
      }
    } catch (e) {
      // Folder might not exist, which is fine
      print('Error deleting storage folder: $e');
    }
  }
}