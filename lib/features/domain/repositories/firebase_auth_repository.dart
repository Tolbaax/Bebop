import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/params/signin_params.dart';
import '../../../core/params/signup_params.dart';

abstract class FirebaseAuthRepository {
  Future<Either<Failure, void>> signIn(SignInParams params);

  Future<Either<Failure, void>> signUp(SignUpParams params);

  Future<Either<Failure, void>> signOut();
}
