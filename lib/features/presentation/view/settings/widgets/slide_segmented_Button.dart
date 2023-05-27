import 'package:bebop/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';
import '../../profile/cubit/cubit.dart';

class SlideSegmentedButton extends StatefulWidget {
  @override
  State<SlideSegmentedButton> createState() => _SlideSegmentedButtonState();
}

class _SlideSegmentedButtonState extends State<SlideSegmentedButton> {
  late int genderValue;

  @override
  void initState() {
    super.initState();
    final gender = ProfileCubit.get(context).userEntity!.gender;
    genderValue = (gender == 'Boy') ? 0 : 1;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProfileCubit>(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(15.0.sp),
      ),
      child: Row(
        children: Constants().segments.asMap().entries.map((entry) {
          final index = entry.key;
          final segment = entry.value;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  genderValue = index;
                  cubit.genderGroupValue = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 6.5.sp),
                decoration: BoxDecoration(
                  color: (genderValue == index)
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
                    color: (genderValue == index)
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
