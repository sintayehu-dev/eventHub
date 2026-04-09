import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/domain/entities/firebase_user_entity.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';

@injectable
class GoogleSignInUseCase {
  final AuthRepository _authRepository;

  GoogleSignInUseCase(this._authRepository);

  Future<Either<NetworkExceptions, FirebaseUserEntity>> call() async {
    return await _authRepository.signInWithGoogle();
  }
}