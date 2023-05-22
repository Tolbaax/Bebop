import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_strings.dart';
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
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 0.0,
              child: Text(
                AppStrings.welcome,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            FadeSlideTransition(
              animation: animation,
              additionalOffset: 8.0,
              child: Text(
                AppStrings.welcomeDesc,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
