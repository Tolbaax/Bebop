import 'package:bebop/core/utils/app_color.dart';
import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../cubit/register_cubit.dart';
import 'custom_row.dart';
import 'custom_sliding_segmented_control.dart';

class BabyInfoForm extends StatelessWidget {
  final RegisterCubit cubit;

  const BabyInfoForm({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: TextStyle(fontSize: 13.sp, color: AppColors.black),
          controller: cubit.babyNameController,
          decoration: InputDecoration(
            label: Text(
              AppStrings.name,
              style: TextStyle(
                fontSize: 13.5.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.5.h,
        ),
        CustomRow(
          title: AppStrings.gender,
          widget: CustomSlidingSegmentedButton(
            text1: AppStrings.boy,
            text2: AppStrings.girl,
            groupValue: cubit.genderGroupValue,
            onValueChanged: (groupValue) {
              cubit.selectGenderSegment(groupValue);
            },
          ),
        ),
        GestureDetector(
          onTap: () => cubit.selectDate(context),
          child: TextFormField(
            controller: cubit.dateController,
            keyboardType: TextInputType.none,
            enabled: false,
            style: TextStyle(fontSize: 13.sp, color: AppColors.black),
            decoration: InputDecoration(
              label: Text(
                AppStrings.birthdate,
                style: TextStyle(
                  fontSize: 13.5.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              suffixIcon: Icon(
                Icons.calendar_month,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.5.h,
        ),
        CustomRow(
          title: AppStrings.relation,
          widget: CustomSlidingSegmentedButton(
            text1: AppStrings.dad,
            text2: AppStrings.mom,
            groupValue: cubit.relationshipGroupValue,
            onValueChanged: (groupValue) {
              cubit.selectRelationshipSegment(groupValue);
            },
          ),
        ),
      ],
    );
  }
}
