import 'package:bebop/core/functions/navigation/navigation.dart';
import 'package:bebop/features/presentation/view/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../view/home/cubit/cubit.dart';

class ValueDialog {
  static void show(context, String text1, String text2) {
    final cubit = ReminderCubit.get(context);
    showDialog(
      context: context,
      barrierColor: AppColors.black.withOpacity(0.2),
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.sp),
        ),
        contentPadding:
            EdgeInsetsDirectional.only(start: 6.2.w, bottom: 1.0.h, top: 1.3.h),
        title: Text(
          AppStrings.volumeUnits,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 15.5.sp,
          ),
        ),
        content: BlocBuilder<ReminderCubit, ReminderStates>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Radio(
                      value: 1,
                      activeColor: AppColors.primary,
                      groupValue: cubit.feedingAmountType,
                      onChanged: (value) => cubit.selectUnitValue(value!),
                    ),
                    Text(
                      text1,
                      style: TextStyle(color: AppColors.black),
                    ),
                    SizedBox(
                      width: 10.0.sp,
                    ),
                    Radio(
                      value: 2,
                      activeColor: AppColors.primary,
                      groupValue: cubit.feedingAmountType,
                      onChanged: (value) => cubit.selectUnitValue(value!),
                    ),
                    Text(
                      text2,
                      style: TextStyle(color: AppColors.black),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: () => navigatePop(context),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            child: const Text(AppStrings.ok),
          ),
        ],
      ),
    );
  }
}
