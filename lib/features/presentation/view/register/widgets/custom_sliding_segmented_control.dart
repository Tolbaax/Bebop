import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';

class CustomSlidingSegmentedButton extends StatelessWidget {
  final String text1;
  final String text2;
  final ValueChanged<int> onValueChanged;
  final int groupValue;

  const CustomSlidingSegmentedButton({
    Key? key,
    required this.text1,
    required this.text2,
    required this.onValueChanged,
    required this.groupValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSlidingSegmentedControl<int>(
      isStretch: true,
      children: {
        0: buildSegment(text: text1, isSelected: groupValue == 0),
        1: buildSegment(text: text2, isSelected: groupValue == 1),
      },
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(15.0.sp),
      ),
      thumbDecoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(15.0.sp),
      ),
      onValueChanged: onValueChanged,
    );
  }

  Widget buildSegment({
    required String text,
    required bool isSelected,
  }) {

    Color textColor = isSelected ? AppColors.white : AppColors.primary;
    return Center(
      child: DefaultTextStyle(
        style: TextStyle(
          fontSize: 13.0.sp,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        child: Text(text),
      ),
    );
  }
}
