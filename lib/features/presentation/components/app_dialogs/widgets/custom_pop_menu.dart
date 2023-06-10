import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/app_color.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final Widget child;
  final List<String> popupMenuItems;
  final Function(String)? onItemSelected;

  const CustomPopupMenuButton({
    Key? key,
    required this.child,
    required this.popupMenuItems,
    this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: '',
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0.sp)),
      ),
      onSelected: (value) => onItemSelected!(value),
      itemBuilder: (BuildContext context) {
        return popupMenuItems.map((text) {
          return _buildPopupMenuItem(text: text);
        }).toList();
      },
      child: child,
    );
  }

  PopupMenuEntry<String> _buildPopupMenuItem({required String text}) {
    return PopupMenuItem<String>(
      value: text,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 12.0.sp,
          fontFamily: '',
        ),
      ),
    );
  }
}
