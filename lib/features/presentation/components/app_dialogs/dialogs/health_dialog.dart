import 'package:bebop/core/extensions/extensions.dart';
import 'package:bebop/features/presentation/components/app_dialogs/app_dialogs.dart';
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

class HealthDialog {
  static void show({required BuildContext context}) {
    final Color color = AppColors.primary.withOpacity(0.8);

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
                text: AppStrings.health,
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
                hintText1: '11:37 PM',
                hintText2: DateFormat.MMMMd().format(DateTime.now()),
                controller1: cubit.feedingFinishTime,
                controller2: cubit.feedingFinishDate,
                onTap1: () => cubit.selectFinishTime(context),
                onTap2: () => cubit.selectFinishDate(context),
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
                    onTap: () {},
                    onItemSelected: (value) =>
                        cubit.selectHealthType(context, value),
                    hintText: AppStrings.medication,
                    controller: cubit.healthType,
                    color: color,
                    width: context.width * 0.43,
                    havePopupMenuButton: true,
                    popupMenuItems: [
                      AppStrings.medication,
                      AppStrings.temperature,
                      AppStrings.vaccination,
                    ],
                  ),
                ],
              ),
              Visibility(
                visible: cubit.healthType.text == AppStrings.temperature,
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.value,
                          style: textStyle,
                        ),
                        Spacer(),
                        DialogField(
                          hintText: '0',
                          color: color,
                          keyboardType: TextInputType.number,
                          centerText: true,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        DialogField(
                          onTap: () => AppDialogs.showValueDialog(
                            context: context,
                            text1: AppStrings.f,
                            text2: AppStrings.c,
                          ),
                          hintText: cubit.feedingAmountType == 1
                              ? AppStrings.f
                              : AppStrings.c,
                          color: color,
                          centerText: true,
                        ),
                      ],
                    ),
                  ],
                ),
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
                    controller: cubit.feedingDetails,
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
