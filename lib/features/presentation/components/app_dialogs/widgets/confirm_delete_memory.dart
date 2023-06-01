import 'package:bebop/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/functions/navigation/navigation.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';


class ConfirmDeleteMemoryDialog {
  static void show(context, onPressed) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: context.height * 0.65,
          child: SingleChildScrollView(
            child: AlertDialog(
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0.sp),
              ),
              contentPadding: EdgeInsetsDirectional.all(15.0.sp),
              content: Column(
                children: [
                  Text(
                    '${AppStrings.deleteMemory}?',
                    style: TextStyle(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      fontFamily: '',
                    ),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text(
                    AppStrings.sureDeleteMemory,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.0.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  SizedBox(
                    width: context.width * 0.54,
                    child: FilledButton(
                      onPressed: onPressed,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: Text(
                        AppStrings.deleteMemory,
                        style: TextStyle(
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  SizedBox(
                    width: context.width * 0.54,
                    child: OutlinedButton(
                      onPressed: () => navigatePop(context),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                          BorderSide(color: Colors.transparent),
                        ),
                      ),
                      child: Text(
                        AppStrings.cancel,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13.4.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
