import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/utils/app_color.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    fontFamily: AppStrings.crimsonProFont,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontFamily: AppStrings.crimsonProFont,
        fontWeight: FontWeight.w500,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary.withOpacity(0.9),
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 70.0,
        height: 2.2,
        color: AppColors.primary,
        letterSpacing: 1,
        fontFamily: AppStrings.guyonGazeboFont,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
