import 'package:bebop/core/functions/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';
import 'custom_reminder_container.dart';

class ToadyReminder extends StatelessWidget {
  const ToadyReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 11.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.toadyReminder,
            style: TextStyle(
              fontSize: 18.0.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 1.8.h),
          Row(
            children: [
              CustomReminder(
                onTap: () => navigateTo(context, Routes.reminder, arguments: 0),
                text: AppStrings.medicine,
                color: AppColors.primary.withOpacity(0.8),
                icon: FontAwesomeIcons.syringe,
              ),
              CustomReminder(
                onTap: () => navigateTo(context, Routes.reminder, arguments: 1),
                text: AppStrings.feeding,
                color: AppColors.teal.withOpacity(0.8),
                icon: FontAwesomeIcons.bowlFood,
              ),
              CustomReminder(
                onTap: () => navigateTo(context, Routes.reminder, arguments: 2),
                text: AppStrings.bathing,
                color: AppColors.darkBlue.withOpacity(0.7),
                icon: FontAwesomeIcons.bath,
              ),
              CustomReminder(
                onTap: () => navigateTo(context, Routes.reminder, arguments: 3),
                text: AppStrings.others,
                color: AppColors.spaceCadet.withOpacity(0.5),
                icon: FontAwesomeIcons.plus,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
