import 'package:bebop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextColumn extends StatelessWidget {
  final String title;
  final String text;

  const TextColumn({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0.sp,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(),
        ),
      ],
    );
  }
}
