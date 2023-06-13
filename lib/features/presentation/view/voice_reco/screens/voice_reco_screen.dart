import 'dart:async';

import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../components/buttons/appbar_back_button.dart';
import '../../../components/buttons/custom_button.dart';

class VoiceRecoScreen extends StatefulWidget {
  const VoiceRecoScreen({Key? key}) : super(key: key);

  @override
  _VoiceRecoScreenState createState() => _VoiceRecoScreenState();
}

class _VoiceRecoScreenState extends State<VoiceRecoScreen> {
  bool isAnimationPlaying = false;
  bool isLoading = false;
  Timer? loadingTimer;

  void startAnimation() {
    setState(() {
      isAnimationPlaying = true;
    });

    Timer(Duration(seconds: 8), () {
      if (isAnimationPlaying) {
        stopAnimation();
        showLoadingDialog();
        loadingTimer = Timer(Duration(seconds: 3), () {
          hideLoadingDialog();
          navigateToVoiceRecoResult();
        });
      }
    });
  }

  void stopAnimation() {
    setState(() {
      isAnimationPlaying = false;
      loadingTimer?.cancel(); // Cancel the loadingTimer if it exists
      loadingTimer = null;
    });
  }

  void showLoadingDialog() {
    setState(() {
      isLoading = true;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0.sp),
          ),
          child: Container(
            padding: EdgeInsets.all(12.0.sp),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(strokeWidth: 2.0.sp),
                SizedBox(width: 6.0.w),
                Text(
                  'Detecting Voices...',
                  style: TextStyle(
                    fontSize: 13.0.sp,
                    letterSpacing: 0.35.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void hideLoadingDialog() {
    setState(() {
      isLoading = false;
    });

    Navigator.of(context).pop();
  }

  void navigateToVoiceRecoResult() {
    if (loadingTimer != null && loadingTimer!.isActive) {
      loadingTimer!.cancel();
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => VoiceRecoResult()),
    );
  }

  @override
  void dispose() {
    if (loadingTimer != null && loadingTimer!.isActive) {
      loadingTimer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(AppStrings.voiceReco),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0.h),
          Lottie.asset(
            ImageAssets.voiceDetect,
            animate: isAnimationPlaying,
          ),
          Spacer(),
          CustomButton(
            onTap: isAnimationPlaying ? stopAnimation : startAnimation,
            text: isAnimationPlaying
                ? AppStrings.stopDetection
                : AppStrings.startDetection,
          ),
          SizedBox(height: 5.0.h),
        ],
      ),
    );
  }
}

class VoiceRecoResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text('Voice Reco Result'),
      ),
      body: Center(
        child: Text('Voice Reco Result'),
      ),
    );
  }
}
