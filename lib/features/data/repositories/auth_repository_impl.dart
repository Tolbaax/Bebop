import 'package:bebop/core/params/signup_params.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/failure.dart';
import '../../../core/params/signin_params.dart';
import '../../domain/repositories/firebase_auth_repository.dart';
import '../datasources/auth/local/auth_local_data_sources.dart';
import '../datasources/auth/remote/auth_remote_datasources.dart';
import '../datasources/user/user_remote_datasource.dart';

class FirebaseAuthRepositoryImpl implements FirebaseAuthRepository {
  final FirebaseRemoteAuthDataSource authDataSource;
  final UserRemoteDataSource userRemoteDataSource;
  final AuthLocalDataSource localDataSource;

  FirebaseAuthRepositoryImpl({
    required this.authDataSource,
    required this.userRemoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> signIn(SignInParams params) async {
    final result = await authDataSource.signIn(params);
    await localDataSource
        .setUserLoggedIn(await userRemoteDataSource.getCurrentUID());
    try {
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, void>> signUp(SignUpParams params) async {
    final result = await authDataSource.signUp(params);

    try {
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    final result = await authDataSource.signOut();
    await localDataSource.removeUser();

    try {
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }
}
