import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;

  const CustomButton({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 57.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0.sp),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
