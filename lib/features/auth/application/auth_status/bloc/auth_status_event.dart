import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';

part 'auth_status_event.freezed.dart';

@freezed
class AuthStatusEvent with _$AuthStatusEvent {
  const factory AuthStatusEvent.authStateChanged(FirebaseUserEntity? user) = AuthStateChanged;
  const factory AuthStatusEvent.signOut() = SignOut;
  const factory AuthStatusEvent.checkAuthStatus() = CheckAuthStatus;
}