import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/domain/entities/login/login_request.dart';
import 'package:eventhub/features/auth/domain/entities/login/login_response.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration_response.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';
import 'package:eventhub/features/auth/domain/verification/entities/verification_code_response.dart';
import 'package:eventhub/features/auth/domain/verification/entities/verification_confirm_response.dart';
import 'package:eventhub/features/auth/infrastructure/auth/datasources/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {

  AuthRepositoryImpl(this._remoteDataSource);
  final AuthRemoteDataSource _remoteDataSource;

  @override
  Future<Either<NetworkExceptions, RegistrationResponse>> register(RegistrationRequest registration) async {
    try {
      final response = await _remoteDataSource.register(registration);
      return right(response);
    } on DioException catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }
  
  @override
  Future<Either<NetworkExceptions, VerificationCodeResponse>> sendVerificationCode(String phoneNumber) async {
    try {
      final response = await _remoteDataSource.sendVerificationCode(phoneNumber);
      return right(response);
    } on DioException catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, VerificationConfirmResponse>> verifyOtp(String phoneNumber, String otp) async {
    try {
      final response = await _remoteDataSource.verifyOtp(phoneNumber, otp);
      return right(response);
    } on DioException catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final email = loginRequest.email;
      final password = loginRequest.password;
      final response = await _remoteDataSource.login(email, password);
    
      
      return right(response);
    } on DioException catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<Either<NetworkExceptions, LoginResponse>> googleLogin(String idToken) async {
    try {
      final response = await _remoteDataSource.googleLogin(idToken);
      return right(response);
    } on DioException catch (e) {
      return left(NetworkExceptions.getDioException(e));
    }
  }
} 
