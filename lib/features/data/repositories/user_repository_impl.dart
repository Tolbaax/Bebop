import 'package:bebop/core/params/baby_params.dart';
import 'package:bebop/core/params/memory_params.dart';
import 'package:bebop/features/domain/entities/memory_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user/user_remote_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<String> getCurrentUID() async =>
      await userRemoteDataSource.getCurrentUID();

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    final result = await userRemoteDataSource.getCurrentUser();
    try {
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, void>> updateBabyInfo(BabyParams params) async {
    final result = await userRemoteDataSource.updateBabyInfo(params);
    try {
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, void>> addMemory(MemoryParams params) async {
    final result = await userRemoteDataSource.addMemory(params);
    try {
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, List<MemoryEntity>>> getMemories() async {
    final result = await userRemoteDataSource.getMemories();
    try {
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMemory(String memoryId) async {
    final result = await userRemoteDataSource.deleteMemory(memoryId);
    try {
      return Right(result);
    } on FirebaseAuthException catch (failure) {
      return Left(ServerFailure(failure.message!));
    }
  }
}
