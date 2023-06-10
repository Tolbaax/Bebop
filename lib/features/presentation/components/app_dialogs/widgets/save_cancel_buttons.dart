import 'package:bebop/core/functions/navigation/navigation.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SaveCancelButtons extends StatelessWidget {
  final VoidCallback? savePressed;
  final Color color;

  const SaveCancelButtons({Key? key, this.savePressed, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => navigatePop(context),
          child: Text(
            AppStrings.cancel,
            style: TextStyle(
              fontSize: 13.5.sp,
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TextButton(
          onPressed: savePressed,
          child: Text(
            AppStrings.save,
            style: TextStyle(
              fontSize: 13.5.sp,
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(width: 2.0.w),
      ],
    );
  }
}
