import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:eventhub/core/handlers/network_exceptions.dart';
import 'package:eventhub/features/auth/domain/repositories/auth_repository.dart';

@injectable
class DeleteAccountUseCase {
  final AuthRepository _authRepository;

  DeleteAccountUseCase(this._authRepository);

  Future<Either<NetworkExceptions, void>> call() async {
    return await _authRepository.deleteAccount();
  }
}
