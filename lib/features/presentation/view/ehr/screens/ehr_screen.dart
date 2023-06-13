import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_measurement_card.dart';

class EHRScreen extends StatelessWidget {
  const EHRScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measurements'),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0.sp),
        child: Column(
          children: [
            SizedBox(
              height: 4.0.h,
            ),
            CustomMeasurementCard(
              onTap: () => Navigator.pushNamed(context, Routes.heartRate),
              title: AppStrings.heartRate,
              text1: '72',
              text2: AppStrings.beatsPer,
              color: AppColors.desire,
              child:  Image(
                height: 2.8.h,
                image: const AssetImage(ImageAssets.oxygen),
                color: Colors.red,
              ),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            CustomMeasurementCard(
              onTap: () => Navigator.pushNamed(context, Routes.temp),
              title: AppStrings.bodyTemp,
              text1: '37c',
              text2: 'Degree',
              color: AppColors.darkBlue,
              child: Image(
                height: 2.8.h,
                image: const AssetImage(ImageAssets.oxygen),
                color: AppColors.darkBlue,
              ),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            CustomMeasurementCard(
              onTap: () => Navigator.pushNamed(context, Routes.oxygen),
              title: AppStrings.bloodOxygen,
              text1: '97/80',
              text2: 'mmHg',
              color: AppColors.teal,
              child: Image(
                height: 2.8.h,
                image: const AssetImage(ImageAssets.oxygen),
                color: AppColors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
