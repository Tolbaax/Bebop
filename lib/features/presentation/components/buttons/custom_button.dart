import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final bool? condition;
  final String text;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.condition = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 6.h,
        width: 57.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(20.0.sp),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: condition!
              ? CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 2.5.sp,
                )
              : Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
