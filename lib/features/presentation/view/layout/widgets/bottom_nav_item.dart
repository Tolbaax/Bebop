import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/constants.dart';

class BottomNavItem extends StatelessWidget {
  final int index;
  final bool isActive;

  const BottomNavItem({
    Key? key,
    required this.index,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        isActive ? AppColors.primary : AppColors.spaceCadet.withOpacity(0.5);
    final fontWeight = isActive ? FontWeight.w600 : FontWeight.w500;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
              end: index == 0 ? 1.5.w : 0.0, bottom: 1.5.sp),
          child: Icon(
            Constants().iconList[index],
            size: 15.0.sp,
            color: color,
          ),
        ),
        Text(
          Constants().titles[index],
          maxLines: 1,
          style: TextStyle(color: color, fontWeight: fontWeight),
        )
      ],
    );
  }
}
