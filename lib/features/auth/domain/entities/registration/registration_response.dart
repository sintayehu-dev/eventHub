import 'package:freezed_annotation/freezed_annotation.dart';

part 'registration_response.freezed.dart';
part 'registration_response.g.dart';

@freezed
class RegistrationResponse with _$RegistrationResponse {
  const factory RegistrationResponse({
    required String email,
    required String first_name,
    required String last_name,
    required String avatar,
    required DateTime created_at,
  }) = _RegistrationResponse;

  const RegistrationResponse._();

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) => _$RegistrationResponseFromJson(json);
} 
