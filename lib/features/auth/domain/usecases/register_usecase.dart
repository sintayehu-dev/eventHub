import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/core/value_object/value_objects.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';

@injectable
class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<Either<NetworkExceptions, FirebaseUserEntity>> call(
      String email, String password) async {
    final emailAddress = EmailAddress(email);
    final passwordValue = Password(password);

    if (!emailAddress.isValid() || !passwordValue.isValid()) {
      return left(const NetworkExceptions.badRequest());
    }

    final validEmail = emailAddress.value.getOrElse(() => '');
    final validPassword = passwordValue.value.getOrElse(() => '');

    return await _authRepository.registerWithEmailAndPassword(
      validEmail,
      validPassword,
    );
  }
}