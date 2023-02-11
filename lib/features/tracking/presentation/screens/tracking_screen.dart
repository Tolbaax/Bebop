import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'فيتشر شمال',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 35.0.sp,
                fontFamily: '',
              ),
            ),
            Lottie.asset(ImageAssets.logo),
          ],
        ),
      ),
    );
  }
}
