import 'package:bebop/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/app_strings.dart';

class DonTHaveAccount extends StatelessWidget {
  const DonTHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.noAccount,
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
            Navigator.pushNamed(context, Routes.register);
          },
          child: Text(
            AppStrings.signup,
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
