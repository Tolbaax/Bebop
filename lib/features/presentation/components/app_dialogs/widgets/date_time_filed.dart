import 'package:bebop/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';


class DateTimeRow extends StatelessWidget {
  final String text, label1, label2, value1, value2;
  final VoidCallback onTap1, onTap2;

  const DateTimeRow({
    Key? key,
    required this.text,
    required this.label1,
    required this.label2,
    required this.value1,
    required this.value2,
    required this.onTap1,
    required this.onTap2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14.5.sp,
            color: AppColors.teal.withOpacity(0.8),
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
        ),
        Spacer(),
        DateTimeField(
          label: label1,
          value: value1,
          onTap: onTap1,
        ),
        SizedBox(
          width: 3.w,
        ),
        DateTimeField(
          label: label2,
          value: value2,
          onTap: onTap2,
        ),
      ],
    );
  }
}

class DateTimeField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  DateTimeField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width * 0.2,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.teal.withOpacity(0.8),
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.only(bottom: 3.0.sp),
          child: Text(
            value.isNotEmpty ? value : label,
            style: TextStyle(
              fontSize: 12.0.sp,
              fontFamily: '',
            ),
          ),
        ),
      ),
    );
  }
}
