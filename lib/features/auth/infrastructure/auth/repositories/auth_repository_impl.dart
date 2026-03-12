import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';
import 'package:eventhub/features/auth/infrastructure/auth/datasources/firebase_auth_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource _firebaseDataSource;

  AuthRepositoryImpl(this._firebaseDataSource);

  @override
  Future<Either<NetworkExceptions, FirebaseUserEntity>>
      signInWithEmailAndPassword(String email, String password) async {
    try {
      final user =
          await _firebaseDataSource.signInWithEmailAndPassword(email, password);
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, FirebaseUserEntity>>
      registerWithEmailAndPassword(String email, String password) async {
    try {
      final user = await _firebaseDataSource.registerWithEmailAndPassword(
          email, password);
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, void>> signOut() async {
    try {
      await _firebaseDataSource.signOut();
      return right(null);
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, FirebaseUserEntity>>
      signInWithGoogle() async {
    try {
      final user = await _firebaseDataSource.signInWithGoogle();
      return right(user);
    } on FirebaseAuthException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, void>> sendPasswordResetEmail(
      String email) async {
    try {
      await _firebaseDataSource.sendPasswordResetEmail(email);
      return right(null);
    } on FirebaseAuthException catch (e) {
      return left(NetworkExceptions.defaultError(_getFirebaseErrorMessage(e)));
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Future<Either<NetworkExceptions, FirebaseUserEntity?>>
      getCurrentUser() async {
    try {
      final user = await _firebaseDataSource.getCurrentUser();
      return right(user);
    } catch (e) {
      return left(NetworkExceptions.defaultError(e.toString()));
    }
  }

  @override
  Stream<FirebaseUserEntity?> get authStateChanges {
    return _firebaseDataSource.authStateChanges;
  }

  String _getFirebaseErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found with this email address.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'An account already exists with this email address.';
      case 'weak-password':
        return 'Password is too weak. Please choose a stronger password.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many failed attempts. Please try again later.';
      case 'operation-not-allowed':
        return 'This sign-in method is not enabled.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      case 'google-sign-in-cancelled':
        return 'Google sign-in was cancelled.';
      case 'google-sign-in-failed':
        return 'Failed to sign in with Google. Please try again.';
      default:
        return e.message ?? 'An unexpected error occurred. Please try again.';
    }
  }
} 
