import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomReminder extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final GestureTapCallback? onTap;
  const CustomReminder({
    Key? key,
    required this.text,
    required this.color,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 3.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: context.height * 0.08,
              width: context.width * 0.17,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1.0.h,
          ),
          SizedBox(
            width: context.width * 0.17,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w500,
                  fontSize: 11.0.sp,
                  fontFamily: '',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
