import 'package:bebop/core/utils/assets_manager.dart';
import 'package:bebop/features/register/presentation/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import 'baby_info_form.dart';

class BabyInfoPage extends StatelessWidget {
  final RegisterCubit cubit;

  const BabyInfoPage({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 22.0.sp),
        child: Column(
          children: [
            SvgPicture.asset(
              ImageAssets.babyInfo,
              height: 32.h,
            ),
            BabyInfoForm(cubit: cubit),
          ],
        ),
      ),
    );
  }
}
