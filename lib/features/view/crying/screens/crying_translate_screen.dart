import 'package:bebop/core/utils/assets_manager.dart';
import 'package:bebop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/progress_clipper.dart';

class CryingTranslateScreen extends StatefulWidget {
  const CryingTranslateScreen({Key? key}) : super(key: key);

  @override
  State<CryingTranslateScreen> createState() => _CryingTranslateScreenState();
}

class _CryingTranslateScreenState extends State<CryingTranslateScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );

    _animation = Tween<double>(begin: 0, end: 1.0).animate(_controller)
      ..addListener(() => setState(() {}));

    _controller.forward().then((value) {
      Navigator.pushReplacementNamed(context, Routes.translateResult);
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 8.0.h,
              ),
              Text(
                AppStrings.cryListening,
                style: TextStyle(
                  fontSize: 23.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 4.5.h,
              ),
              Stack(
                children: [
                  Image(
                    image: const AssetImage(ImageAssets.homeLogo),
                    color: AppColors.hint,
                    height: 30.h,
                  ),
                  ClipPath(
                    clipper: ProgressClipper(animation: _animation),
                    child: Image(
                      image: const AssetImage(ImageAssets.homeLogo),
                      color: AppColors.primary,
                      height: 30.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 11.h,
                child: Lottie.asset(ImageAssets.voiceReco),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                AppStrings.translateTip,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.5.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                text: AppStrings.stop,
                color: AppColors.primary,
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
