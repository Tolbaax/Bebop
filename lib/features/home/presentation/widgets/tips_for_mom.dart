import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/features/home/data/models/tips_model.dart';
import 'package:bebop/features/home/presentation/widgets/selected_tip.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_strings.dart';

class TipsForMom extends StatelessWidget {
  const TipsForMom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppStrings.tipsForMoms,
                style: TextStyle(
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.defaultFont,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  AppStrings.viewMore,
                  style: TextStyle(
                    fontSize: 10.0.sp,
                    color: AppColors.black.withOpacity(0.4),
                    fontWeight: FontWeight.w500,
                    fontFamily: AppStrings.defaultFont,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.8.h),
          SizedBox(
            height: 59.h,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0.sp,
              mainAxisSpacing: 10.0.sp,
              childAspectRatio: 0.84,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(tips.length, (index) {
                return SelectedTip(tipsModel: tips[index]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}
