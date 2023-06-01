import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_color.dart';

ThemeData appTheme(context) {
  return ThemeData(
    primaryColor: AppColors.primary,
    colorScheme:
        Theme.of(context).colorScheme.copyWith(primary: AppColors.primary),
    hintColor: AppColors.hint,
    fontFamily: AppStrings.muktaFont,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0.sp,
        fontFamily: AppStrings.muktaFont,
        fontWeight: FontWeight.w500,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary.withOpacity(0.065),
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 56.5.sp,
        color: AppColors.primary,
        letterSpacing: 1,
        fontFamily: AppStrings.guyonGazeboFont,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 15.0.sp,
        height: 0.18.h,
      ),
      titleLarge: TextStyle(
        color: AppColors.black,
        wordSpacing: 2.sp,
        fontSize: 25.sp,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: AppColors.black.withOpacity(0.5),
        wordSpacing: 0.5.sp,
        fontSize: 12.5.sp,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      labelPadding: EdgeInsetsDirectional.zero,
      unselectedLabelColor: AppColors.black,
      labelColor: AppColors.white,
      labelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.2,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.hint,
      elevation: 0.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
    timePickerTheme: TimePickerThemeData(
      dialTextStyle: TextStyle(fontFamily: ''),
      dayPeriodShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0.sp)),
      hourMinuteShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0.sp)),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.sp)),
    ),
    datePickerTheme: DatePickerThemeData(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0.sp)),
    ),
  );
}
