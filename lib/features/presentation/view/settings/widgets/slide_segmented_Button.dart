import 'package:bebop/features/presentation/view/profile/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';

List<String> segments = ['Boy', 'Girl'];

class SlideSegmentedButton extends StatelessWidget {
  final ProfileCubit cubit;

  const SlideSegmentedButton({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cubit.genderGroupValue = cubit.userEntity!.gender == 'Boy' ? 0 : 1;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(15.0.sp),
      ),
      child: Row(
        children: segments.asMap().entries.map((entry) {
          final index = entry.key;
          final segment = entry.value;

          return Expanded(
            child: GestureDetector(
              onTap: () => cubit.selectGenderSegment(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 6.5.sp),
                decoration: BoxDecoration(
                  color: cubit.genderGroupValue == index
                      ? AppColors.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(15.0.sp),
                ),
                child: Text(
                  segment,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.0.sp,
                    fontWeight: FontWeight.w500,
                    color: cubit.genderGroupValue == index
                        ? Colors.white
                        : AppColors.primary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
