import 'dart:async';

import 'package:bebop/core/network/local/cache_helper.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/injection_container.dart' as di;
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 1800), vsync: this)
    ..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

  late Timer _timer;

  // use shared preferences to open app in right screen only
  final isBoarding = di.sl<CacheHelper>().getData(key: 'AppStrings.isBoarding');

  _goNext() {
    if (isBoarding != null) {
      Navigator.pushReplacementNamed(context, Routes.login);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    }
  }

  _startDelay() =>
      _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.babyLogo),
              Text(
                AppStrings.appName,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
