import 'package:flutter/material.dart';

import '../../core/utils/app_color.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    fontFamily: 'Crimson Pro',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontFamily: 'Crimson Pro',
        fontWeight: FontWeight.w500,
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 70.0,
        height: 2.2,
        color: AppColors.primary,
        letterSpacing: 1,
        fontFamily: 'Guyon Gazebo',
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
