import 'dart:math';

import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;

  const Header({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Transform.rotate(
          angle: -pi / 4,
          child: Icon(
            Icons.format_bold,
            color: AppColors.white,
            size: 33.0.sp,
          ),
        ),
        GestureDetector(
          onTap: onSkip,
          child: Text(
            AppStrings.skip,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.white,
                ),
          ),
        ),
      ],
    );
  }
}
