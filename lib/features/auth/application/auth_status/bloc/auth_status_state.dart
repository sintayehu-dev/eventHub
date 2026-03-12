import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';

part 'auth_status_state.freezed.dart';

@freezed
class AuthStatusState with _$AuthStatusState {
  const factory AuthStatusState({
    FirebaseUserEntity? user,
    @Default(AuthStatus.unknown) AuthStatus status,
    @Default(false) bool isLoading,
    @Default('') String errorMessage,
  }) = _AuthStatusState;

  const AuthStatusState._();

  bool get isAuthenticated => status == AuthStatus.authenticated && user != null;
  bool get isUnauthenticated => status == AuthStatus.unauthenticated;
}

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}