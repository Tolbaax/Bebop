import 'package:bebop/core/utils/media_query_values.dart';
import 'package:bebop/features/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_strings.dart';

class HeightWeightRow extends StatelessWidget {
  final UserEntity user;
  const HeightWeightRow({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomHeightWeightContainer(
            color: AppColors.primary.withOpacity(0.65),
            text1: AppStrings.height,
            text2: '${user.babyHeight}cm',
            icon: Icons.height_sharp,
          ),
          CustomHeightWeightContainer(
            color: AppColors.desire.withOpacity(0.7),
            text1: AppStrings.weight,
            text2: '${user.babyWeight}kg',
            icon: FontAwesomeIcons.weightScale,
          ),
        ],
      ),
    );
  }
}

class CustomHeightWeightContainer extends StatelessWidget {
  final Color color;
  final String text1;
  final String text2;
  final IconData icon;
  const CustomHeightWeightContainer(
      {Key? key,
      required this.color,
      required this.text1,
      required this.text2,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.5.h,
      width: context.width * 0.3,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(11.0.sp),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: 0.4.h, start: 2.w, end: 2.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: AppColors.white,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0.sp,
                  ),
                ),
                Text(
                  text2,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            Icon(
              icon,
              color: AppColors.white.withOpacity(0.8),
              size: 25.0.sp,
            )
          ],
        ),
      ),
    );
  }
}
