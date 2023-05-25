import 'package:bebop/core/params/memory_params.dart';
import 'package:bebop/features/domain/entities/memory_entity.dart';

import '../../../../core/params/baby_params.dart';
import '../../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUser();

  Future<String> getCurrentUID();

  Future<void> updateBabyInfo(BabyParams params);

  Future<void> addMemory(MemoryParams params);

  Future<List<MemoryEntity>> getMemories();

  Future<void> deleteMemory(String memoryId);
}
