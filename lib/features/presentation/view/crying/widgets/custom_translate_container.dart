import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../components/buttons/custom_button.dart';

class CustomTranslateContainer extends StatelessWidget {
  const CustomTranslateContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.31,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.175),
        borderRadius: BorderRadius.circular(12.0.sp),
      ),
      child: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.translateDesc,
              style: Theme.of(context).textTheme.titleLarge!,
            ),
            const Spacer(),
            Align(
              alignment: AlignmentDirectional.center,
              child: CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, Routes.cryTranslate);
                },
                text: AppStrings.translate,
                color: AppColors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
