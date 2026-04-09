import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';

abstract class AuthRepository {
  // Firebase Authentication methods
  Future<Either<NetworkExceptions, FirebaseUserEntity>>
      signInWithEmailAndPassword(String email, String password);
  Future<Either<NetworkExceptions, FirebaseUserEntity>>
      registerWithEmailAndPassword(String email, String password);
  Future<Either<NetworkExceptions, void>> signOut();

  // Additional Firebase methods
  Future<Either<NetworkExceptions, FirebaseUserEntity>> signInWithGoogle();
  Future<Either<NetworkExceptions, void>> sendPasswordResetEmail(String email);
  Future<Either<NetworkExceptions, FirebaseUserEntity?>> getCurrentUser();
  Stream<FirebaseUserEntity?> get authStateChanges;
} 
