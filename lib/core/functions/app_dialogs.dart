import 'package:bebop/core/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../utils/app_color.dart';
import '../utils/app_strings.dart';
import 'navigation.dart';

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

  static void showConfirmDeleteMemory(context,
      {required VoidCallback? onPressed}) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: context.height * 0.65,
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0.sp),
              ),
              contentPadding: EdgeInsetsDirectional.all(15.0.sp),
              content: Column(
                children: [
                  Text(
                    '${AppStrings.deleteMemory}?',
                    style: TextStyle(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text(
                    AppStrings.sureDeleteMemory,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.0.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  SizedBox(
                    width: context.width * 0.54,
                    child: FilledButton(
                      onPressed: onPressed,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Text(
                        AppStrings.deleteMemory,
                        style: TextStyle(
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  SizedBox(
                    width: context.width * 0.54,
                    child: OutlinedButton(
                      onPressed: () => navigatePop(context),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(color: Colors.transparent),
                        ),
                      ),
                      child: Text(
                        AppStrings.cancel,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13.4.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
