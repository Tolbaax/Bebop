import 'package:bebop/core/params/memory_params.dart';
import 'package:bebop/features/domain/entities/memory_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/params/baby_params.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<String> getCurrentUID();

  Future<Either<Failure, void>> updateBabyInfo(BabyParams params);

  Future<Either<Failure, void>> addMemory(MemoryParams params);

  Future<Either<Failure, List<MemoryEntity>>> getMemories();

  Future<Either<Failure, void>> deleteMemory(String memoryId);
}
