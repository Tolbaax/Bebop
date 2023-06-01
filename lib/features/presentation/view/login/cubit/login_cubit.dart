import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/params/signin_params.dart';
import '../../../../domain/usecases/auth/signin_usecase.dart';
import '../../../components/app_dialogs/app_dialogs.dart';
import 'login_mixin.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> with LoginMixin {
  final SignInUseCase _signInUseCase;

  LoginCubit(this._signInUseCase) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login() async {
    emit(LoginLoadingState());
    final result = await _signInUseCase(
      SignInParams(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    ).catchError((e) {
      if (e is FirebaseAuthException) {
        AppDialogs.showToast(msg: e.message.toString());
        return Left(ServerFailure(e.message.toString()));
      }
      return Left(ServerFailure(e.message.toString()));
    });

    result.fold(
      (l) => emit(LoginErrorState()),
      (r) => emit(LoginSuccessfullyState()),
    );
  }
}
