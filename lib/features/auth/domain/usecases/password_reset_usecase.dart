import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/domain/entities/auth_request.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';

@injectable
class PasswordResetUseCase {
  final AuthRepository _authRepository;

  PasswordResetUseCase(this._authRepository);

  Future<Either<NetworkExceptions, void>> call(PasswordResetRequest request) async {
    if (!request.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    return await _authRepository.sendPasswordResetEmail(request.emailValue);
  }
}