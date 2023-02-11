import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import 'fade_slide_transition.dart';

class LoginHeader extends StatelessWidget {
  final Animation<double> animation;

  const LoginHeader({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 1.0.h),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 0.0,
              child: Text(
                AppStrings.welcome,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColors.black,
                      wordSpacing: 2,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(height: 1.0.h),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 16.0,
              child: Text(
                AppStrings.welcomeDesc,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.black.withOpacity(0.5),
                      fontSize: 14.0.sp,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
