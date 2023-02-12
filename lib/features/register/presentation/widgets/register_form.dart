import 'dart:async';

import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/core/widgets/rounded_loading_button.dart';
import 'package:bebop/features/register/presentation/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/widgets/custom_input_field.dart';
import '../../../../core/widgets/divider.dart';
import '../../../../core/widgets/social_signup.dart';
import 'have_account.dart';

class RegisterForm extends StatelessWidget {
  final Animation<Offset> nameOffsetAnimation;
  final Animation<Offset> confirmPassOffsetAnimation;
  const RegisterForm({
    super.key,
    required this.nameOffsetAnimation,
    required this.confirmPassOffsetAnimation,
  });

  @override
  Widget build(BuildContext context) {
    final btnController = RoundedLoadingButtonController();
    final height = context.height - context.toPadding;
    final space = height > 650 ? 2.0.h : 1.0.h;
    final RegisterCubit cubit = RegisterCubit.get(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
      child: Column(
        children: [
          SlideTransition(
            position: nameOffsetAnimation,
            child: const CustomInputField(
              label: AppStrings.name,
              textInputAction: TextInputAction.next,
              prefixIcon: Icons.person,
              keyboardType: TextInputType.name,
            ),
          ),
          SizedBox(height: space),
          const CustomInputField(
            label: AppStrings.email,
            textInputAction: TextInputAction.next,
            prefixIcon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: space),
          CustomInputField(
            label: AppStrings.password,
            prefixIcon: Icons.lock,
            suffixIcon: cubit.suffix1,
            obscureText: cubit.isPassword1,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.visiblePassword,
            suffixTab: () {
              cubit.changeVisibility1();
            },
          ),
          SizedBox(height: space),
          SlideTransition(
            position: confirmPassOffsetAnimation,
            child: CustomInputField(
              label: AppStrings.confirmPassword,
              prefixIcon: Icons.lock,
              suffixIcon: cubit.suffix2,
              obscureText: cubit.isPassword2,
              keyboardType: TextInputType.visiblePassword,
              suffixTab: () {
                cubit.changeVisibility2();
              },
            ),
          ),
          SizedBox(height: 4.4.h),
          CustomRoundedLoadingButton(
            onPressed: () {
              btnController.success();
              Future.delayed(const Duration(seconds: 1), () async {
                await Navigator.pushNamed(context, Routes.babyRegister);
                btnController.reset();
              });
            },
            text: AppStrings.signup,
            btnController: btnController,
          ),
          SizedBox(height: 2.5.h),
          const DividerLine(),
          SizedBox(height: 1.5.h),
          const SocialSignUp(),
          SizedBox(height: 1.5.h),
          const HaveAccount(),
        ],
      ),
    );
  }
}
