import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({Key? key}) : super(key: key);

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );

    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CircularRevealAnimation(
      animation: _animation,
      child: SpeedDial(
        icon: FontAwesomeIcons.baby,
        backgroundColor: AppColors.primary,
        spacing: 2.5.sp,
        childPadding: EdgeInsets.all(4.sp),
        spaceBetweenChildren: 6.sp,
        elevation: 4.0,
        animationCurve: Curves.elasticInOut,
        childMargin: EdgeInsets.only(right: 2.0.sp),
        children: [
          SpeedDialChild(
            child: Icon(Icons.record_voice_over_outlined, size: 18.0.sp),
            backgroundColor: AppColors.primary.withOpacity(0.9),
            foregroundColor: Colors.white,
            label: AppStrings.voiceReco,
            labelBackgroundColor: AppColors.white,
            labelStyle:
                TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.2.sp),
            labelShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.5),
                blurRadius: 0.5,
              ),
            ],
          ),
          SpeedDialChild(
            onTap: () => Navigator.pushNamed(context, Routes.getLocation),
            child: Icon(FontAwesomeIcons.locationDot, size: 16.0.sp),
            backgroundColor: AppColors.primary.withOpacity(0.8),
            foregroundColor: Colors.white,
            label: AppStrings.location,
            labelBackgroundColor: AppColors.white,
            labelStyle:
                TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.2.sp),
            labelShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.5),
                blurRadius: 0.5,
              ),
            ],
          ),
          SpeedDialChild(
            onTap: () => Navigator.pushNamed(context, Routes.ehrScreen),
            child: Icon(FontAwesomeIcons.notesMedical, size: 18.0.sp),
            backgroundColor: AppColors.primary.withOpacity(0.7),
            foregroundColor: Colors.white,
            labelBackgroundColor: AppColors.white,
            label: AppStrings.ehr,
            labelStyle:
                TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.3.sp),
            labelShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.5),
                blurRadius: 0.5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
