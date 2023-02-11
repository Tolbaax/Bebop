import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final Widget widget;
  const CustomRow({Key? key, required this.title, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 40.w,
              child: widget,
            ),
          ],
        ),
        Divider(
          height: 3.5.h,
          thickness: 1.0,
          color: Colors.black45,
        ),
      ],
    );
  }
}
