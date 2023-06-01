import 'package:bebop/features/presentation/components/app_dialogs/widgets/save_cancel_buttons.dart';
import 'package:bebop/features/presentation/view/home/cubit/cubit.dart';
import 'package:bebop/features/presentation/view/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';
import 'date_time_filed.dart';

class FeedingDialog {
  static void show({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 9.0.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.sp),
        ),
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildHeader(context),
              SizedBox(height: 2.0.h),
              _buildContent(context),
              SizedBox(
                height: 1.0.h,
              ),
              SaveCancelButtons(),
              SizedBox(
                height: 0.15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildHeader(context) {
    return Container(
      height: 6.5.h,
      decoration: BoxDecoration(
        color: AppColors.teal.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0.sp),
          topRight: Radius.circular(15.0.sp),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 8.0.sp),
          child: Text(
            AppStrings.feeding,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 20.0.sp,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildContent(BuildContext context) {
    final cubit = ReminderCubit.get(context);

    return BlocBuilder<ReminderCubit, ReminderStates>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DateTimeRow(
                text: AppStrings.start,
                label1: '8:37 PM',
                label2: DateFormat.MMMMd().format(DateTime.now()),
                value1: cubit.feedingStartTime,
                value2: cubit.feedingStartDate,
                onTap1: () => cubit.selectStartTime(context),
                onTap2: () => cubit.selectStartDate(context),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              DateTimeRow(
                text: AppStrings.finish,
                label1: '11:37 PM',
                label2: DateFormat.MMMMd().format(DateTime.now()),
                value1: cubit.feedingFinishTime,
                value2: cubit.feedingFinishDate,
                onTap1: () => cubit.selectFinishTime(context),
                onTap2: () => cubit.selectFinishDate(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
