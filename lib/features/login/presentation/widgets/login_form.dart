import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/login/presentation/cubit/login_cubit.dart';
import 'package:bebop/features/login/presentation/widgets/dont_have_account.dart';
import 'package:bebop/features/login/presentation/widgets/forget_pass_button.dart';
import 'package:bebop/features/login/presentation/widgets/social_signup.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_input_field.dart';
import 'divider.dart';
import 'fade_slide_transition.dart';

class LoginForm extends StatefulWidget {
  final Animation<double> animation;

  const LoginForm({super.key, required this.animation});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final height = context.height - context.toPadding;
    final space = height > 650 ? 2.0.h : 1.0.h;
    final LoginCubit cubit = LoginCubit.get(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
      child: Column(
        children: [
          FadeSlideTransition(
            animation: widget.animation,
            additionalOffset: space,
            child: const CustomInputField(
              label: AppStrings.username,
              textInputAction: TextInputAction.next,
              prefixIcon: Icons.person,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: widget.animation,
            additionalOffset: space,
            child: CustomInputField(
              label: AppStrings.password,
              prefixIcon: Icons.lock,
              suffixIcon: cubit.suffix,
              obscureText: cubit.isPassword,
              suffixTab: () {
                cubit.changeVisibility();
              },
            ),
          ),
          FadeSlideTransition(
            animation: widget.animation,
            additionalOffset: 1.5 * space,
            child: const ForgetPasswordButton(),
          ),
          SizedBox(height: 3.5.h),
          FadeSlideTransition(
            animation: widget.animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              color: AppColors.primary,
              text: AppStrings.login,
            ),
          ),
          SizedBox(height: 3.h),
          FadeSlideTransition(
            animation: widget.animation,
            additionalOffset: 3 * space,
            child: const DividerLine(),
          ),
          SizedBox(height: 2.0.h),
          FadeSlideTransition(
            animation: widget.animation,
            additionalOffset: 4 * space,
            child: const SocialSignUp(),
          ),
          SizedBox(height: 2.0.h),
          FadeSlideTransition(
            animation: widget.animation,
            additionalOffset: 5 * space,
            child: const DonTHaveAccount(),
          ),
        ],
      ),
    );
  }
}
