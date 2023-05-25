import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/params/baby_params.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<String> getCurrentUID();

  Future<Either<Failure, void>> updateBabyInfo(BabyParams params);
}
