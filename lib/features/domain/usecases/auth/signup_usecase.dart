import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/params/signup_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repositories/firebase_auth_repository.dart';

class SignUpUseCase implements UseCase<void, SignUpParams> {
  final FirebaseAuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(SignUpParams params) async {
    return await _repository.signUp(params);
  }
}
