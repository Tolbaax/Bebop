import 'package:bebop/core/extensions/extensions.dart';
import 'package:bebop/features/presentation/view/profile/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_color.dart';

class AddMemoryButton extends StatelessWidget {
  final ProfileCubit cubit;
  const AddMemoryButton({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.addMemory,
          arguments: cubit,
        );
      },
      child: Container(
        margin: EdgeInsetsDirectional.all(5.0.sp),
        width: context.width * 0.3,
        decoration: BoxDecoration(
          color: AppColors.hint.withOpacity(0.5.sp),
          borderRadius: BorderRadius.circular(12.0.sp),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 30.0.sp,
          ),
        ),
      ),
    );
  }
}
