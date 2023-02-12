import 'package:bebop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixTab;
  final bool obscureText;
  final TextInputAction? textInputAction;

  const CustomInputField({
    super.key,
    this.controller,
    this.keyboardType,
    this.label,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixTab,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: TextStyle(color: AppColors.black, fontSize: 12.0.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0.sp),
        hintText: label,
        hintStyle: TextStyle(
          color: AppColors.black.withOpacity(0.5),
          fontSize: 11.5.sp,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: AppColors.black.withOpacity(0.5),
                size: 17.5.sp,
              )
            : const SizedBox.shrink(),
        suffixIcon: (suffixIcon != null)
            ? InkWell(
                onTap: suffixTab,
                radius: 0.0,
                child: Icon(
                  suffixIcon,
                  size: 17.5.sp,
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
        ),
      ),
    );
  }
}
