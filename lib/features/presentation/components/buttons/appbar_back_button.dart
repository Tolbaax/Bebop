import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/functions/navigation/navigation.dart';
import '../../../../core/utils/app_color.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => navigatePop(context),
      splashRadius: 20.0.sp,
      splashColor: AppColors.primary.withOpacity(0.2),
      icon: Icon(
        CupertinoIcons.back,
        color: AppColors.primary,
      ),
    );
  }
}
