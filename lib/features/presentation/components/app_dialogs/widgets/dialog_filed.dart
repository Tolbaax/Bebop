import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:bebop/core/extensions/extensions.dart';
import 'package:bebop/core/utils/app_color.dart';

import 'custom_pop_menu.dart';

class DialogField extends StatelessWidget {
  final Color color;
  final double? width;
  final String? hintText;
  final GestureTapCallback? onTap;
  final bool havePopupMenuButton;
  final TextEditingController? controller;
  final bool centerText;
  final TextInputType? keyboardType;
  final List<String>? popupMenuItems;
  final Function(String)? onItemSelected;

  const DialogField({
    Key? key,
    this.havePopupMenuButton = false,
    required this.color,
    this.hintText = '',
    this.controller,
    this.width,
    this.onTap,
    this.centerText = false,
    this.keyboardType,
    this.popupMenuItems,
    this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = TextFormField(
      cursorColor: color,
      controller: controller,
      keyboardType: keyboardType,
      enabled: onTap == null,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      decoration: InputDecoration(
        isCollapsed: true,
        // Remove vertical padding
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.black),
        labelStyle: TextStyle(color: AppColors.black),
        suffixIcon: havePopupMenuButton
            ? Icon(
          Icons.arrow_drop_down_outlined,
          color: AppColors.black,
        )
            : null,
        suffixIconConstraints: BoxConstraints.loose(Size(10.0.w, 10.0.h)),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.6),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: 1),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color, width: 1),
        ),
      ),
      style: TextStyle(
        fontSize: 12.0.sp,
        fontFamily: '',
        color: AppColors.black,
      ),
    );

    final sizedTextField = SizedBox(
      width: width ?? context.width * 0.2,
      child: textField,
    );

    final wrappedTextField = InkWell(
      onTap: havePopupMenuButton ? null : onTap,
      child: sizedTextField,
    );

    return CustomPopupMenuButton(
      onItemSelected: onItemSelected,
      popupMenuItems: popupMenuItems ?? [],
      child: wrappedTextField,
    );
  }
}
