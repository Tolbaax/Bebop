import 'package:bebop/features/domain/entities/memory_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repositories/user_repository.dart';

class GetMemoriesUseCase implements UseCase<List<MemoryEntity>, NoParams> {
  final UserRepository _repository;

  GetMemoriesUseCase(this._repository);

  @override
  Future<Either<Failure, List<MemoryEntity>>> call(NoParams params) async {
    return await _repository.getMemories();
  }
}
