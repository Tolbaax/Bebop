import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../core/utils/app_color.dart';
import '../cubit/register_cubit.dart';

class BabyHeightPage extends StatefulWidget {
  const BabyHeightPage({Key? key}) : super(key: key);

  @override
  State<BabyHeightPage> createState() => _BabyHeightPageState();
}

class _BabyHeightPageState extends State<BabyHeightPage> {
  double selectedBabyHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              ImageAssets.babyHeight,
              height: 32.h,
            ),
            SizedBox(height: 4.h),
            Text(
              AppStrings.whatsHeight,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.0.sp,
              ),
            ),
            SizedBox(height: 3.5.h),
            Text(
              '${selectedBabyHeight.toStringAsFixed(1)}cm',
              style: TextStyle(
                fontSize: 30.0.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 9.0.h,
              child: SfSlider(
                value: selectedBabyHeight,
                min: 10.0,
                max: 100.0,
                interval: 20,
                showTicks: true,
                minorTicksPerInterval: 3,
                activeColor: AppColors.primary,
                onChanged: (value) {
                  setState(() {
                    selectedBabyHeight = value;
                  });
                },
                onChangeEnd: (value) => cubit.setBabyHeight(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
