import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_color.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    fontFamily: AppStrings.crimsonProFont,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontFamily: AppStrings.crimsonProFont,
        fontWeight: FontWeight.w500,
      ),
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   statusBarColor: Colors.white,
      //   statusBarBrightness: Brightness.light,
      // ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 70.0,
        height: 2.2,
        color: AppColors.primary,
        letterSpacing: 1,
        fontFamily: AppStrings.guyonGazeboFont,
        fontWeight: FontWeight.w500,
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
