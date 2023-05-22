import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.haveAccount,
          style: ThemeData()
              .textTheme
              .displayLarge!
              .copyWith(color: AppColors.black, fontSize: 11.5.sp),
        ),
        TextButton(
          style: ButtonStyle(
            alignment: AlignmentDirectional.centerStart,
            padding: MaterialStateProperty.all(
              EdgeInsetsDirectional.only(start: 1.5.w),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            AppStrings.login,
            style: ThemeData()
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.primary, fontSize: 11.5.sp),
          ),
        ),
      ],
    );
  }
}
