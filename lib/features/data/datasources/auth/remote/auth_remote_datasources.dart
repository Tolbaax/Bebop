import 'package:bebop/core/params/signup_params.dart';

import '../../../../../core/params/signin_params.dart';

abstract class FirebaseRemoteAuthDataSource {
  Future<void> signUp(SignUpParams params);

  Future<void> signIn(SignInParams params);

  Future<void> signOut();
}
