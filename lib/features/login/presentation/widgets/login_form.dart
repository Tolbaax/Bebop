import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/login/presentation/widgets/forget_pass_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_button.dart';
import 'custom_input_field.dart';
import 'divider.dart';
import 'fade_slide_transition.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;

  const LoginForm({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    final height = context.height - context.toPadding;
    final space = height > 650 ? 16.0 : 8.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
      child: Column(
        children: [
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: const CustomInputField(
              label: AppStrings.username,
              prefixIcon: Icons.person,
            ),
          ),
          SizedBox(height: space),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: space,
            child: const CustomInputField(
              label: AppStrings.password,
              prefixIcon: Icons.lock,
              suffixIcon: CupertinoIcons.eye_slash_fill,
              obscureText: true,
            ),
          ),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: const ForgetPasswordButton(),
          ),
          SizedBox(height: 3.5.h),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 2 * space,
            child: CustomButton(
              color: AppColors.primary,
              text: AppStrings.login,
            ),
          ),
          SizedBox(height: 3.h),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 4 * space,
            child: const DividerLine(),
          ),
        ],
      ),
    );
  }
}
