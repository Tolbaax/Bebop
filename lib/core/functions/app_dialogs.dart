import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_color.dart';
import '../utils/app_strings.dart';

class AppDialogs {
  static void showToast(
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      backgroundColor: color ?? AppColors.primary,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }

  static void showLogOutDialog({required context, VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0.sp)),
        title: Icon(
          CupertinoIcons.exclamationmark_circle,
          size: 55.0.sp,
          color: AppColors.primary,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Are you leaving?',
              style: TextStyle(
                color: AppColors.black,
                fontSize: 17.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Are you sure want to log out?',
              style: TextStyle(fontSize: 14.0.sp, color: AppColors.black),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.black,
              textStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              textStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),
            child: const Text(AppStrings.logout),
          ),
        ],
      ),
    );
  }
}
