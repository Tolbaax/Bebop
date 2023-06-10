import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';

class BuildDialogHeader extends StatelessWidget {
  final String text;
  final Color color;

  const BuildDialogHeader({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.5.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0.sp),
          topRight: Radius.circular(15.0.sp),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 8.0.sp),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20.0.sp,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}
