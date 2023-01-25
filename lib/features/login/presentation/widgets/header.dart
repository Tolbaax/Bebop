import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import 'fade_slide_transition.dart';

class Header extends StatelessWidget {
  final Animation<double> animation;

  const Header({
    super.key,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.rotate(
            angle: -pi / 4,
            child: Icon(
              Icons.format_bold,
              color: AppColors.primary,
              size: 33.0.sp,
            ),
          ),
          SizedBox(height: 2.h),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 0.0,
            child: Text(
              AppStrings.welcome,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                    wordSpacing: 2,
                  ),
            ),
          ),
          SizedBox(height: 0.7.h),
          FadeSlideTransition(
            animation: animation,
            additionalOffset: 16.0,
            child: Text(
              'Est ad dolor aute ex commodo tempor exercitation proident.',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: AppColors.black.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}
