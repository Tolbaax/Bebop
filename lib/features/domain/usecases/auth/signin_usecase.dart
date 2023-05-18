import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/params/signin_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repositories/firebase_auth_repository.dart';

class SignInUseCase implements UseCase<void, SignInParams> {
  final FirebaseAuthRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(SignInParams params) async {
    return await _repository.signIn(params);
  }
}
