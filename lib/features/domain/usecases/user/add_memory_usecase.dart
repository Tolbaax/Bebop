import 'package:bebop/core/params/memory_params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repositories/user_repository.dart';

class AddMemoryUseCase implements UseCase<void, MemoryParams> {
  final UserRepository _repository;

  AddMemoryUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(MemoryParams params) async {
    return await _repository.addMemory(params);
  }
}
