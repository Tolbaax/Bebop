import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import 'app_color.dart';

class Constants {
  static void showToast(
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      backgroundColor: color ?? AppColors.primary,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }

  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          msg,
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            child: const Text('Ok'),
          )
        ],
      ),
    );
  }

  static void showLogOutDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          AppStrings.logout,
          style: TextStyle(color: Colors.black, fontSize: 17.0.sp),
        ),
        content: Padding(
          padding: EdgeInsetsDirectional.only(top: 1.h),
          child: Text(
            'Are you sure want to exit?',
            style: TextStyle(fontSize: 14.0.sp),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              textStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, Routes.login),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.black,
              textStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }

  final iconList = <IconData>[
    FontAwesomeIcons.house,
    FontAwesomeIcons.faceSadCry,
    FontAwesomeIcons.chartSimple,
    FontAwesomeIcons.user,
  ];

  final titles = <String>[
    AppStrings.home,
    AppStrings.cry,
    AppStrings.track,
    AppStrings.profile,
  ];

  final List<String> images = [
    ImageAssets.baby1,
    ImageAssets.baby2,
    ImageAssets.baby3,
    ImageAssets.baby4,
  ];
  final List<String> imageTitle = [
    AppStrings.baby1,
    AppStrings.baby2,
    AppStrings.baby3,
    AppStrings.baby4,
  ];
}
