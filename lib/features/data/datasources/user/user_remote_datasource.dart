import '../../../../core/params/baby_params.dart';
import '../../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUser();

  Future<String> getCurrentUID();

  Future<void> updateBabyInfo(BabyParams params);
}
