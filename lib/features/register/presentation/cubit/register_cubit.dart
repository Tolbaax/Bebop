import 'package:bebop/features/register/presentation/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  //Change Visibility1
  bool isPassword1 = true;
  IconData suffix1 = Icons.visibility_off_outlined;
  changeVisibility1() {
    isPassword1 = !isPassword1;
    suffix1 =
        isPassword1 ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisibilityState1());
  }

  //Change Visibility2
  bool isPassword2 = true;
  IconData suffix2 = Icons.visibility_off_outlined;
  changeVisibility2() {
    isPassword2 = !isPassword2;
    suffix2 =
        isPassword2 ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisibilityState2());
  }
}
