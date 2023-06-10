import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'dialog_filed.dart';

class DateTimeRow extends StatelessWidget {
  final String text, hintText1, hintText2;
  final TextEditingController controller1, controller2;
  final VoidCallback onTap1, onTap2;
  final Color color;

  const DateTimeRow({
    Key? key,
    required this.text,
    required this.hintText1,
    required this.hintText2,
    required this.onTap1,
    required this.onTap2,
    required this.color,
    required this.controller1,
    required this.controller2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14.5.sp,
            color: color,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
        ),
        Spacer(),
        DialogField(
          hintText: hintText1,
          controller: controller1,
          onTap: onTap1,
          color: color,
        ),
        SizedBox(
          width: 3.w,
        ),
        DialogField(
          hintText: hintText2,
          controller: controller2,
          onTap: onTap2,
          color: color,
        ),
      ],
    );
  }
}
