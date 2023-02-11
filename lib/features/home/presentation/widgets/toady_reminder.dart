import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';
import 'custom_reminder_container.dart';

class ToadyReminder extends StatelessWidget {
  const ToadyReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.toadyReminder,
            style: TextStyle(
              fontSize: 16.0.sp,
              fontWeight: FontWeight.w500,
              fontFamily: AppStrings.defaultFont,
            ),
          ),
          SizedBox(height: 1.8.h),
          Row(
            children: [
              CustomReminder(
                text: AppStrings.medicine,
                color: AppColors.primary.withOpacity(0.8),
                icon: FontAwesomeIcons.syringe,
              ),
              CustomReminder(
                text: AppStrings.feeding,
                color: AppColors.teal.withOpacity(0.8),
                icon: FontAwesomeIcons.bowlFood,
              ),
              CustomReminder(
                text: AppStrings.bathing,
                color: AppColors.darkBlue.withOpacity(0.7),
                icon: FontAwesomeIcons.bath,
              ),
              CustomReminder(
                text: AppStrings.others,
                color: AppColors.spaceCadet.withOpacity(0.4),
                icon: FontAwesomeIcons.plus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
