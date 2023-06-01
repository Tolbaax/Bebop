import 'package:bebop/core/params/signup_params.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/domain/usecases/auth/signup_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../components/app_dialogs/app_dialogs.dart';
import 'register_mixin.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> with RegisterMixin {
  final SignUpUseCase _signUpUseCase;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
        gender: genderGroupValue == 0 ? AppStrings.boy : AppStrings.girl,
        birthDate: dateController.text,
        relationship:
            relationshipGroupValue == 0 ? AppStrings.dad : AppStrings.mom,
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

  Future<bool> isEmailAlreadyRegistered() async {
    final email = emailController.text.trim();

    try {
      final signInMethods = await _auth.fetchSignInMethodsForEmail(email);
      return signInMethods.isNotEmpty;
    } catch (e) {
      print('Error checking email existence: $e');
      return false;
    }
  }
}
