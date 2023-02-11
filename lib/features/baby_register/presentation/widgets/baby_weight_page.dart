import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../core/utils/app_color.dart';

class BabyWeightPage extends StatefulWidget {
  const BabyWeightPage({Key? key}) : super(key: key);

  @override
  State<BabyWeightPage> createState() => _BabyWeightPageState();
}

class _BabyWeightPageState extends State<BabyWeightPage> {
  double _value = 12.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 0.4.h,
            ),
            SvgPicture.asset(
              height: 32.h,
              ImageAssets.babyWeight,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              AppStrings.whatsWeight,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28.0.sp,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '${_value.toString().substring(0, 3)}kg',
              style: TextStyle(
                fontSize: 30.0.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.0.h,
              child: SfSlider(
                value: _value,
                min: 5.0,
                max: 45.0,
                interval: 20,
                showTicks: true,
                minorTicksPerInterval: 3,
                activeColor: AppColors.primary,
                onChanged: (dynamic value) {
                  setState(() {
                    _value = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}