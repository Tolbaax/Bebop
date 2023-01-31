import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_color.dart';

class CustomRoundedLoadingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  var btnController;

  CustomRoundedLoadingButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.btnController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      width: 57.w,
      child: RoundedLoadingButton(
        controller: btnController!,
        onPressed: onPressed,
        color: AppColors.primary,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
