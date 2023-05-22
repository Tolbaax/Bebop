import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';

class CustomCryRow extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomCryRow({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
        ),
        SizedBox(
          width: 1.w,
        ),
        Text(
          title,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 15.5.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
