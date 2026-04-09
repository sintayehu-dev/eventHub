import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/value_object/value_objects.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';

@injectable
class PasswordResetUseCase {
  final AuthRepository _authRepository;

  PasswordResetUseCase(this._authRepository);

  Future<Either<NetworkExceptions, void>> call(String email) async {
    final emailAddress = EmailAddress(email);

    if (!emailAddress.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    final validEmail = emailAddress.value.getOrElse(() => '');
    return await _authRepository.sendPasswordResetEmail(validEmail);
  }
}