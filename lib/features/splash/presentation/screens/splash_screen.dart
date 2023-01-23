import 'dart:async';

import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/assets_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  // use shared preferences to open app in right screen only
  _goNext() => Navigator.pushReplacementNamed(context, Routes.onBoarding);

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.babyLogo,
            ),
            Text(
              AppStrings.appName,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
