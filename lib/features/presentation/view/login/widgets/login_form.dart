import 'package:bebop/core/functions/validation.dart';
import 'package:bebop/core/shared/common.dart';
import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/functions/app_dialogs.dart';
import '../../../components/buttons/custom_button.dart';
import '../../../components/custom_input_field.dart';
import '../../../components/divider.dart';
import '../../../components/buttons/social_signup.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_states.dart';
import 'dont_have_account.dart';
import 'fade_slide_transition.dart';
import 'forget_pass_button.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;
  final LoginStates states;

  const LoginForm({super.key, required this.animation, required this.states});

  @override
  Widget build(BuildContext context) {
    final height = context.height - context.toPadding;
    final space = height > 650 ? 2.0.h : 1.0.h;
    final LoginCubit cubit = LoginCubit.get(context);

    return Form(
      key: cubit.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
        child: Column(
          children: [
            FadeSlideTransition(
              animation: animation,
              additionalOffset: space,
              child: CustomInputField(
                controller: cubit.emailController,
                hintText: AppStrings.email,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validators.validateEmail(value),
              ),
            ),
            SizedBox(height: space),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 2 * space,
              child: CustomInputField(
                controller: cubit.passwordController,
                hintText: AppStrings.password,
                prefixIcon: Icons.lock,
                suffixIcon: cubit.suffix,
                obscureText: cubit.isPassword,
                keyboardType: TextInputType.visiblePassword,
                suffixTab: () {
                  cubit.changeVisibility();
                },
                validator: (value) => Validators.validatePassword(value),
              ),
            ),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 2 * space,
              child: const ForgetPasswordButton(),
            ),
            SizedBox(height: 6.55.h),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 3 * space,
              child: CustomButton(
                onTap: () async {
                  if (cubit.formKey.currentState!.validate()) {
                    if (await checkInternetConnectivity()) {
                      await cubit.login();
                    } else {
                      AppDialogs.showToast(msg: AppStrings.noInternetAccess);
                    }
                  }
                },
                text: AppStrings.login,
                color: AppColors.primary,
                condition: states is LoginLoadingState,
              ),
            ),
            SizedBox(height: 2.5.h),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 4 * space,
              child: const DividerLine(),
            ),
            SizedBox(height: 1.5.h),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 5 * space,
              child: const SocialSignUp(),
            ),
            SizedBox(height: 1.5.h),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 6 * space,
              child: const DonTHaveAccount(),
            ),
          ],
        ),
      ),
    );
  }
}
