import 'package:bebop/config/routes/app_routes.dart';
import 'package:bebop/core/functions/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/assets_manager.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsetsDirectional.only(start: 10.sp, top: 2.sp),
        child: const Image(
          image: AssetImage(ImageAssets.homeLogo),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => navigateTo(context, Routes.notifications),
          child: Container(
            margin:
                EdgeInsetsDirectional.only(end: 10.sp, top: 6.sp, bottom: 5.sp),
            width: 11.w,
            decoration: BoxDecoration(
              color: AppColors.hint.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.sp),
            ),
            child: Icon(
              Icons.notifications_none,
              color: AppColors.primary,
              size: 21.0.sp,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension + 5);
}
