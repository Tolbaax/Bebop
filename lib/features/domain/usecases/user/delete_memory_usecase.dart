import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../repositories/user_repository.dart';

class DeleteMemoryUseCase implements UseCase<void, String> {
  final UserRepository _repository;

  DeleteMemoryUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call(String memoryId) async {
    return await _repository.deleteMemory(memoryId);
  }
}
