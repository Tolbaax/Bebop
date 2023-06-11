import 'package:bebop/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/utils/app_color.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../view/home/cubit/cubit.dart';
import '../../../view/home/cubit/states.dart';
import '../widgets/build_dialog_header.dart';
import '../widgets/date_time_filed.dart';
import '../widgets/dialog_filed.dart';
import '../widgets/save_cancel_buttons.dart';

class OthersDialog {
  static void show({required BuildContext context}) {
    final Color color = AppColors.spaceCadet.withOpacity(0.6);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 9.0.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0.sp),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0.sp),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BuildDialogHeader(
                text: AppStrings.others,
                color: color,
              ),
              SizedBox(height: 2.0.h),
              _buildContent(context, color),
              SizedBox(
                height: 1.0.h,
              ),
              SaveCancelButtons(
                savePressed: () {},
                color: color,
              ),
              SizedBox(
                height: 0.15.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildContent(BuildContext context, Color color) {
    final cubit = ReminderCubit.get(context);
    final textStyle = TextStyle(
      fontSize: 14.5.sp,
      color: color,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    );

    return BlocBuilder<ReminderCubit, ReminderStates>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DateTimeRow(
                text: AppStrings.date,
                hintText1: AppStrings.hintTime,
                hintText2: DateFormat.MMMMd().format(DateTime.now()),
                controller1: cubit.startTime,
                controller2: cubit.startDate,
                onTap1: () => cubit.selectStartTime(context),
                onTap2: () => cubit.selectStartDate(context),
                color: color,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.type,
                    style: textStyle,
                  ),
                  Spacer(),
                  DialogField(
                    controller: cubit.othersType,
                    color: color,
                    width: context.width * 0.43,
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                children: [
                  Text(
                    AppStrings.details,
                    style: textStyle,
                  ),
                  Spacer(),
                  DialogField(
                    controller: cubit.leisureDetails,
                    color: color,
                    width: context.width * 0.43,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
