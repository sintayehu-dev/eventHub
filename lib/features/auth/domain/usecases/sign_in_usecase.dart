import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';
import 'package:eventhub/features/auth/domain/entities/auth_request.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';

@injectable
class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<Either<NetworkExceptions, FirebaseUserEntity>> call(SignInRequest request) async {
    if (!request.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    return await _authRepository.signInWithEmailAndPassword(
      request.emailValue,
      request.passwordValue,
    );
  }
}