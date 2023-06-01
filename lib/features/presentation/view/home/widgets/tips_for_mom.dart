import 'package:bebop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../data/models/tips_model.dart';
import 'selected_tip.dart';

class TipsForMom extends StatelessWidget {
  const TipsForMom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          end: 11.0.sp, start: 11.0.sp, bottom: 35.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppStrings.tipsForMoms,
                style: TextStyle(
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  AppStrings.viewMore,
                  style: TextStyle(
                    fontSize: 10.0.sp,
                    color: AppColors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.8.h),
          SizedBox(
            height: 60.5.h,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0.sp,
              mainAxisSpacing: 10.0.sp,
              childAspectRatio: 0.79,
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
