import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ResultPercentage extends StatelessWidget {
  final String title, percent, image;

  const ResultPercentage({
    Key? key,
    required this.title,
    required this.percent,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(
          height: 3.5.h,
          image: AssetImage(image),
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.5.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          percent,
          style: TextStyle(
            fontSize: 14.5.sp,
          ),
        ),
      ],
    );
  }
}
