import 'package:bebop/config/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';


class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.forgetPassword);
        },
        child: Text(
          AppStrings.forgetPassword,
          style: TextStyle(color: AppColors.black.withOpacity(0.6)),
        ),
      ),
    );
  }
}
