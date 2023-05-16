import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../core/utils/app_color.dart';

class BabyHeightPage extends StatefulWidget {
  const BabyHeightPage({Key? key}) : super(key: key);

  @override
  State<BabyHeightPage> createState() => _BabyHeightPageState();
}

class _BabyHeightPageState extends State<BabyHeightPage> {
  double _value = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              height: 32.h,
              ImageAssets.babyHeight,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              AppStrings.whatsHeight,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.0.sp,
              ),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            Text(
              '${_value.toString().substring(0, 4)}cm',
              style: TextStyle(
                fontSize: 30.0.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 9.0.h,
              child: SfSlider(
                value: _value,
                min: 10.0,
                max: 100.0,
                interval: 20,
                showTicks: true,
                minorTicksPerInterval: 3,
                activeColor: AppColors.primary,
                onChanged: (value) {
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
