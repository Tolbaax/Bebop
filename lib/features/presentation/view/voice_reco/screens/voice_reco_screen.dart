import 'dart:async';

import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/features/presentation/components/buttons/appbar_back_button.dart';
import 'package:bebop/features/presentation/components/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/assets_manager.dart';

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

    Timer(Duration(seconds: 6), () {
      stopAnimation();
      showLoadingDialog();
      loadingTimer = Timer(Duration(seconds: 3), () {
        hideLoadingDialog();
        navigateToVoiceRecoResult();
      });
    });
  }

  void stopAnimation() {
    setState(() {
      isAnimationPlaying = false;
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
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 7.5.w),
                Text(
                  'Detecting Voices...',
                  style: TextStyle(
                    fontSize: 12.0.sp,
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
                ? 'Stop Detecting Voices'
                : 'Start Detecting Voices',
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
