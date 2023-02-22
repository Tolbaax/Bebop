import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:bebop/core/utils/assets_manager.dart';
import 'package:bebop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/appbar_back_button.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({Key? key}) : super(key: key);

  @override
  State<GetLocationScreen> createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackButton(),
      ),
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset(ImageAssets.location, height: 32.0.h),
            SizedBox(
              height: 8.0.h,
            ),
            Text(
              AppStrings.detectBabyLocation,
              style: TextStyle(fontSize: 19.0.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Text(
              AppStrings.detectBabyLocationDesc,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black.withOpacity(0.7),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 9.0.h),
              child: CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, Routes.mapScreen);
                },
                text: AppStrings.getLocation,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
