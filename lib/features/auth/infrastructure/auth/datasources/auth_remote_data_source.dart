import 'dart:io';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/di/dependancy_manager.dart';
import 'package:eventhub/core/handlers/http_service.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration.dart';
import 'package:eventhub/features/auth/domain/entities/registration/registration_response.dart';
import 'package:eventhub/features/auth/domain/verification/entities/verification_code_response.dart';
import 'package:eventhub/features/auth/domain/verification/entities/verification_confirm_response.dart';
import 'package:eventhub/features/auth/domain/entities/login/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegistrationResponse> register(RegistrationRequest registration);
  Future<VerificationCodeResponse> sendVerificationCode(String phoneNumber);
  Future<VerificationConfirmResponse> verifyOtp(String phoneNumber, String otp);
  Future<LoginResponse> login(String email, String password);
  Future<LoginResponse> googleLogin(String idToken);
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  @override
  Future<RegistrationResponse> register(RegistrationRequest registration) async {
    try {
      // Get the profile photo path if available
      final profilePhotoPath = registration.profilePhoto.value.getOrElse(() => null);
      
      // Create a FormData object for multipart request
      final FormData formData = FormData.fromMap({
        'first_name': registration.firstName.value.getOrElse(() => ''),
        'last_name': registration.lastName.value.getOrElse(() => ''),
        'email': registration.email.value.getOrElse(() => ''),
        'password': registration.password.value.getOrElse(() => ''),
        // Add FCM token if needed - assuming a default value for now
        'fcmtoken': 'default_fcm_token', 
      });
      
      // Add logo/profile photo if path is available
      if (profilePhotoPath != null && profilePhotoPath.isNotEmpty) {
        // Create MultipartFile from the file path
        final File imageFile = File(profilePhotoPath);
        
        if (await imageFile.exists()) {
          formData.files.add(
            MapEntry(
              'logo', 
              await MultipartFile.fromFile(
                profilePhotoPath,
                filename: profilePhotoPath.split('/').last,
              ),
            ),
          );
        }
      }
      
      // Use the HttpService with multipart flag set to true
      final response = await getIt<HttpService>()
          .client(isMultipart: true)
          .post('/users/register', data: formData);
      
      // Check if response is JSON
      if (response.data is! Map<String, dynamic>) {
        if (response.data is String && (response.data as String).contains('<!DOCTYPE html>')) {
          throw DioException(
            requestOptions: response.requestOptions,
            error: 'Server returned HTML instead of JSON. The server might be down or not configured correctly.',
            type: DioExceptionType.badResponse,
            response: response,
          );
        }
        throw DioException(
          requestOptions: response.requestOptions,
          error: 'Expected JSON response but got: ${response.data.runtimeType}',
          type: DioExceptionType.badResponse,
          response: response,
        );
      }
      
      return RegistrationResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<VerificationCodeResponse> sendVerificationCode(String phoneNumber) async {
    try {
      final data = <String, dynamic>{
        'phone_number': phoneNumber,
      };
      
      final response = await getIt<HttpService>().client().post(
        '/verify/send',
        data: data,
      );
      
      return VerificationCodeResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<VerificationConfirmResponse> verifyOtp(String phoneNumber, String otp) async {
    try {
      final data = <String, dynamic>{
        'phone_number': phoneNumber,
        'otp': otp,
      };
      
      final response = await getIt<HttpService>().client().post(
        '/verify/confirm',
        data: data,
      );
      
      return VerificationConfirmResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    try {
      final data = <String, dynamic>{
        'email': email,
        'password': password,
      };
      
      final response = await getIt<HttpService>().client().post(
        '/users/login',
        data: data,
      );
      
      return LoginResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginResponse> googleLogin(String idToken) async {
    try {
      final data = <String, dynamic>{
        'id_token': idToken,
      };
      
      final response = await getIt<HttpService>().client().post(
        '/auth/google/verify',
        data: data,
      );
      
      return LoginResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      rethrow;
    }
  }
} 
