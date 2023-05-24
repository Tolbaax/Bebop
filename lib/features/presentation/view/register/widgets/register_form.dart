import 'package:bebop/core/functions/navigation.dart';
import 'package:bebop/core/functions/validation.dart';
import 'package:bebop/core/shared/common.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/functions/app_dialogs.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../components/buttons/custom_button.dart';
import '../../../components/custom_input_field.dart';
import '../../../components/divider.dart';
import '../../../components/buttons/social_signup.dart';
import '../cubit/register_cubit.dart';
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
    final height = context.height - context.toPadding;
    final space = height > 650 ? 2.0.h : 1.0.h;
    final RegisterCubit cubit = RegisterCubit.get(context);
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.sp),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SlideTransition(
              position: nameOffsetAnimation,
              child: CustomInputField(
                controller: cubit.nameController,
                hintText: AppStrings.name,
                textInputAction: TextInputAction.next,
                prefixIcon: Icons.person,
                keyboardType: TextInputType.name,
                validator: (value) => Validators.validateName(value),
              ),
            ),
            SizedBox(height: space),
            CustomInputField(
              controller: cubit.emailController,
              hintText: AppStrings.email,
              textInputAction: TextInputAction.next,
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => Validators.validateEmail(value),
            ),
            SizedBox(height: space),
            CustomInputField(
              controller: cubit.passwordController,
              hintText: AppStrings.password,
              prefixIcon: Icons.lock,
              suffixIcon: cubit.suffix1,
              obscureText: cubit.isPassword1,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              suffixTab: () {
                cubit.changeVisibility1();
              },
              validator: (value) => Validators.validatePassword(value),
            ),
            SizedBox(height: space),
            SlideTransition(
              position: confirmPassOffsetAnimation,
              child: CustomInputField(
                controller: cubit.confirmPasswordController,
                hintText: AppStrings.confirmPassword,
                prefixIcon: Icons.lock,
                suffixIcon: cubit.suffix2,
                obscureText: cubit.isPassword2,
                keyboardType: TextInputType.visiblePassword,
                suffixTab: () {
                  cubit.changeVisibility2();
                },
                validator: (value) => Validators.validateConfirmPassword(
                  value,
                  cubit.passwordController.text.trim(),
                ),
              ),
            ),
            SizedBox(height: 4.4.h),
            CustomButton(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  if (await checkInternetConnectivity()) {
                    navigateTo(context, Routes.babyRegister);
                  } else {
                    AppDialogs.showToast(msg: AppStrings.noInternetAccess);
                  }
                }
              },
              text: AppStrings.signup,
              color: AppColors.primary,
            ),
            SizedBox(height: 2.5.h),
            const DividerLine(),
            SizedBox(height: 1.5.h),
            const SocialSignUp(),
            SizedBox(height: 1.5.h),
            const HaveAccount(),
          ],
        ),
      ),
    );
  }
}
