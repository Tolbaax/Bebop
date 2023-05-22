import 'package:bebop/core/params/signup_params.dart';
import 'package:bebop/features/domain/usecases/auth/signup_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/functions/app_dialogs.dart';
import 'register_mixin.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> with RegisterMixin {
  final SignUpUseCase _signUpUseCase;

  RegisterCubit(this._signUpUseCase) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> register() async {
    emit(RegisterLoadingState());
    final result = await _signUpUseCase(
      SignUpParams(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        babyName: babyNameController.text.trim(),
        gender: genderGroupValue == 0 ? 'Boy' : 'Girl',
        birthDate: dateController.text,
        relationship: relationshipGroupValue == 0 ? 'Dad' : 'Mom',
        babyHeight: double.parse(babyHeight.toStringAsFixed(1)),
        babyWeight: double.parse(babyWeight.toStringAsFixed(1)),
      ),
    ).catchError((e) {
      if (e is FirebaseAuthException) {
        AppDialogs.showToast(msg: e.message.toString());
        return Left(ServerFailure(e.message.toString()));
      }
      AppDialogs.showToast(msg: e.message.toString());
      return Left(ServerFailure(e.message.toString()));
    });

    result.fold(
      (l) => emit(RegisterErrorState()),
      (r) => emit(RegisterSuccessState()),
    );
  }
}
