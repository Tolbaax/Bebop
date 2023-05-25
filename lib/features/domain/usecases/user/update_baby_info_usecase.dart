import 'package:bebop/core/params/baby_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repositories/user_repository.dart';

class UpdateBabyInfoUseCase implements UseCase<void, BabyParams> {
  final UserRepository _repository;

  UpdateBabyInfoUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(BabyParams params) async {
    return await _repository.updateBabyInfo(params);
  }
}
