import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';
import 'package:eventhub/features/auth/domain/entities/login/login_request.dart';
import 'package:eventhub/features/auth/domain/entities/login/login_response.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration_response.dart';
import 'package:eventhub/features/auth/domain/verification/entities/verification_code_response.dart';
import 'package:eventhub/features/auth/domain/verification/entities/verification_confirm_response.dart';

abstract class AuthRepository {
  // Legacy methods (keeping for backward compatibility)
  Future<Either<NetworkExceptions, RegistrationResponse>> register(RegistrationRequest registration);
  Future<Either<NetworkExceptions, VerificationCodeResponse>> sendVerificationCode(String phoneNumber);
  Future<Either<NetworkExceptions, VerificationConfirmResponse>> verifyOtp(String phoneNumber, String otp);
  Future<Either<NetworkExceptions, LoginResponse>> login(LoginRequest loginRequest);
  Future<Either<NetworkExceptions, LoginResponse>> googleLogin(String idToken);
  
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
