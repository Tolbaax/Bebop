import 'package:bebop/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';


class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        AppStrings.babyProfile,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.settings);
          },
          icon: Icon(
            Icons.settings,
            color: AppColors.primary,
            size: 22.5.sp,
          ),
        ),
        SizedBox(
          width: 3.0.w,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension);
}
