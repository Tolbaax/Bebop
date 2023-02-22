import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_color.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
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
      unselectedLabelColor: AppColors.primary,
      labelColor: AppColors.white,
      labelStyle: TextStyle(fontSize: 12.sp),
      unselectedLabelStyle: TextStyle(fontSize: 12.sp),
    ),
    cardTheme: CardTheme(
      color: AppColors.hint,
      elevation: 0.0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    ),
  );
}

class SliverHeaderDemo extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }
}
