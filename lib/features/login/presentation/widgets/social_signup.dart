import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/assets_manager.dart';

class SocialSignUp extends StatelessWidget {
  const SocialSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(ImageAssets.google, height: 25.0.sp),
        ),
        SizedBox(width: 5.0.w),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(ImageAssets.facebook, height: 40.0.sp),
        ),
      ],
    );
  }
}
