import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';

class AnalysisHistoryList extends StatelessWidget {
  const AnalysisHistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: context.height * 0.075,
          margin:
              EdgeInsetsDirectional.only(bottom: 10.sp, end: 5.sp, start: 5.sp),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 3.0.w),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.0.sp),
              border: Border.all(color: AppColors.primary.withOpacity(0.05)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 1.0,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.faceTired,
                color: AppColors.primary,
                size: 20.0.sp,
              ),
              SizedBox(
                width: 2.5.w,
              ),
              Text(
                index % 2 == 1 ? AppStrings.hungry : AppStrings.tired,
                style: TextStyle(
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                '1$index/${index + 1}/2023',
                style: TextStyle(
                  color: AppColors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 16.0.w,
              ),
              Text(
                '${index + 1}:14Am',
                style: TextStyle(
                  color: AppColors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
