import 'package:dartz/dartz.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/domain/entities/login/login_request.dart';
import 'package:eventhub/features/auth/domain/entities/login/login_response.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration_response.dart';
import 'package:eventhub/features/auth/domain/verification/entities/verification_code_response.dart';
import 'package:eventhub/features/auth/domain/verification/entities/verification_confirm_response.dart';

abstract class AuthRepository {
  Future<Either<NetworkExceptions, RegistrationResponse>> register(RegistrationRequest registration);
  Future<Either<NetworkExceptions, VerificationCodeResponse>> sendVerificationCode(String phoneNumber);
  Future<Either<NetworkExceptions, VerificationConfirmResponse>> verifyOtp(String phoneNumber, String otp);
  Future<Either<NetworkExceptions, LoginResponse>> login(LoginRequest loginRequest);
  Future<Either<NetworkExceptions, LoginResponse>> googleLogin(String idToken);
} 
