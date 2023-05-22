import 'package:bebop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double size = 40.0.sp;
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          strokeWidth: 2.5.sp,
        ),
      ),
    );
  }
}
