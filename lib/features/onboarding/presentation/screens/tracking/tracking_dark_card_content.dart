import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TrackingDarkCardContent extends StatelessWidget {
  const TrackingDarkCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(ImageAssets.babyFly);
  }
}
