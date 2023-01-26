import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:bebop/core/widgets/custom_button.dart';
import 'package:bebop/core/widgets/custom_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_color.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Lottie.asset(ImageAssets.forgetPassword, height: 27.0.h),
            ),
            SizedBox(
              height: 4.0.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 22.0.sp, end: 22.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forget\nPassword?',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 35.0.sp,
                      fontFamily: AppStrings.guyonGazeboFont,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text(
                    AppStrings.forgetPassDesc,
                    style: TextStyle(
                      color: AppColors.black.withOpacity(0.7),
                      fontSize: 14.0.sp,
                    ),
                  ),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  const CustomInputField(
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.alternate_email,
                  ),
                  SizedBox(
                    height: 6.0.h,
                  ),
                  Center(
                    child: CustomButton(
                      color: AppColors.primary,
                      text: AppStrings.submit,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
