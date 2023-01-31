import 'dart:async';

import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/core/widgets/rounded_loading_button.dart';
import 'package:bebop/features/register/presentation/cubit/register_cubit.dart';
import 'package:bebop/features/register/presentation/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/custom_input_field.dart';
import '../../../../core/widgets/divider.dart';
import '../../../../core/widgets/social_signup.dart';
import 'have_account.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    final btnController = RoundedLoadingButtonController();
    final height = context.height - context.toPadding;
    final space = height > 650 ? 2.0.h : 1.0.h;
    final RegisterCubit cubit = RegisterCubit.get(context);

    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
          child: Column(
            children: [
              const CustomInputField(
                label: AppStrings.name,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.person,
              ),
              SizedBox(height: space),
              const CustomInputField(
                label: AppStrings.username,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.person,
              ),
              SizedBox(height: space),
              CustomInputField(
                label: AppStrings.password,
                prefixIcon: Icons.lock,
                suffixIcon: cubit.suffix1,
                obscureText: cubit.isPassword1,
                suffixTab: () {
                  cubit.changeVisibility1();
                },
              ),
              SizedBox(height: space),
              CustomInputField(
                label: AppStrings.confirmPassword,
                prefixIcon: Icons.lock,
                suffixIcon: cubit.suffix2,
                obscureText: cubit.isPassword2,
                suffixTab: () {
                  cubit.changeVisibility2();
                },
              ),
              SizedBox(height: 3.5.h),
              CustomRoundedLoadingButton(
                onPressed: () {
                  btnController.success();
                  Timer(const Duration(seconds: 1), () {
                    Navigator.pushNamed(context, Routes.initialRoute);
                  });
                },
                text: AppStrings.signup,
                btnController: btnController,
              ),
              SizedBox(height: 3.h),
              const DividerLine(),
              SizedBox(height: 2.0.h),
              const SocialSignUp(),
              SizedBox(height: 2.0.h),
              const HaveAccount(),
            ],
          ),
        );
      },
    );
  }
}
