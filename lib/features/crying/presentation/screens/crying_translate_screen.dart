import 'package:bebop/core/utils/assets_manager.dart';
import 'package:bebop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';

class CryingTranslateScreen extends StatefulWidget {
  const CryingTranslateScreen({Key? key}) : super(key: key);

  @override
  State<CryingTranslateScreen> createState() => _CryingTranslateScreenState();
}

class _CryingTranslateScreenState extends State<CryingTranslateScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _controller.addListener(() => setState(() {}));
    _controller.repeat();
    _controller
      ..duration
      ..forward().then((value) {
        // Navigator.pushReplacementNamed(context, Routes.translateResult);
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.0.h,
            ),
            Text(
              'Listening to baby\'s crying',
              style: TextStyle(
                fontSize: 23.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 20.h,
              child: Lottie.asset(ImageAssets.voiceReco1),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              textAlign: TextAlign.center,
              'Place half an arm span from your baby\nplease',
              style: TextStyle(fontSize: 14.5.sp),
            ),
            SizedBox(
              height: 12.h,
            ),
            CustomButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: AppStrings.stop,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
