import 'package:bebop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../components/buttons/appbar_back_button.dart';
import '../widgets/heart_rate_gauge.dart';

class HeartRateScreen extends StatelessWidget {
  const HeartRateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackButton(),
        title: Text(Constants().todayDate),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 2.0.h,
            ),
            Text(
              AppStrings.heartRate,
              style: TextStyle(
                fontSize: 24.0.sp,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
                fontFamily: 'Times',
              ),
            ),
            SizedBox(
              height: 5.0.h,
            ),
            HeartRateGauge(),
            SizedBox(
              height: 8.0.h,
            ),
            Text(
              AppStrings.doingGreat,
              style: TextStyle(
                fontSize: 16.5.sp,
                color: AppColors.black.withOpacity(0.7),
                fontFamily: 'Times',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
