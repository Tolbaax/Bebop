import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';

class CustomMeasurementCard extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Color? color;
  final String title, text1, text2;
  final Widget child;

  const CustomMeasurementCard({
    Key? key,
    this.onTap,
    required this.title,
    required this.text1,
    required this.text2,
    this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsetsDirectional.all(8.0.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.sp),
          border: Border.all(color: AppColors.hint),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14.0.sp,
                ),
              ],
            ),
            Text(
              AppStrings.lastTime,
              style: TextStyle(
                fontSize: 13.0.sp,
                color: AppColors.black.withOpacity(0.7),
              ),
            ),
            Row(
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: 25.0.sp,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 10, start: 5),
                  child: Text(
                    text2,
                    style: TextStyle(
                      fontSize: 11.0.sp,
                      color: AppColors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                const Spacer(),
                child,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
