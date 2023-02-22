import 'package:bebop/core/network/local/cache_helper.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:bebop/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  // use shared preferences to open app in right screen only
  final isBoarding = di.sl<CacheHelper>().getData(key: 'AppStrings.isBoarding');

  _goNext() {
    if (isBoarding != null) {
      Navigator.pushReplacementNamed(context, Routes.login);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            ImageAssets.logo,
            height: 60.h,
            controller: _controller,
            width: double.infinity,
            onLoaded: (composition) {
              _controller
                ..duration = composition.duration
                ..forward().then(
                  (value) {
                    _goNext();
                  },
                );
            },
          ),
          Text(
            AppStrings.appName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
