import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../widgets/result_percentage.dart';

class TranslateResultScreen extends StatelessWidget {
  const TranslateResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.cryingResult,
          style: TextStyle(fontSize: 18.0.sp),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              FontAwesomeIcons.xmark,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            width: 2.5.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0.sp),
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.center,
              child: Image(
                height: 15.0.h,
                image: const AssetImage(ImageAssets.babyBottle),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Text(
              AppStrings.hungry,
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 16.0.h,
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: 10.0.sp, horizontal: 8.0.sp),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.0.sp),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 1.0,
                    spreadRadius: 0.4,
                  )
                ],
              ),
              child: Column(
                children: [
                  const ResultPercentage(
                    image: ImageAssets.babyBottle,
                    title: AppStrings.hungry,
                    percent: '78%',
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(vertical: 0.8.h),
                    child: const Divider(),
                  ),
                  const ResultPercentage(
                    image: ImageAssets.babyDiaper,
                    title: AppStrings.diaper,
                    percent: '14%',
                  ),
                ],
              ),
            ),
            SizedBox(height: 6.0.h),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppStrings.hungryTips,
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 1.0.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsetsDirectional.only(
                    top: 8.0.sp, end: 8.0.sp, start: 8.0.sp),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.0.sp),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 1.0,
                      spreadRadius: 0.4,
                    )
                  ],
                ),
                child: ListView(
                  children: [
                    Text(
                      AppStrings.hungryTip,
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4.0.h,
            ),
          ],
        ),
      ),
    );
  }
}
