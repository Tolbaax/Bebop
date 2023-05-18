import 'package:bebop/features/view/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin LoginMixin on Cubit<LoginStates> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //Change Visibility
  bool isPassword = true;
  IconData suffix = Icons.visibility_off_outlined;

  changeVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangeVisibilityState());
  }

  void clearSignInControllers() {
    emailController.clear();
    passwordController.clear();
    emit(ClearSignInControllersState());
  }
}
