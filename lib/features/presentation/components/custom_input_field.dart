import 'package:bebop/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixTab;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final FormFieldValidator? validator;

  const CustomInputField({
    super.key,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixTab,
    this.textInputAction,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: keyboardType == TextInputType.multiline ? null : 1,
      validator: validator,
      style: TextStyle(color: AppColors.black, fontSize: 12.0.sp),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10.0.sp),
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.black.withOpacity(0.8),
          fontSize: 13.0.sp,
          letterSpacing: 0.5,
        ),
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
            : null,
        suffixIcon: (suffixIcon != null)
            ? GestureDetector(
                onTap: suffixTab,
                child: Icon(
                  suffixIcon,
                  size: 18.0.sp,
                ),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.sp),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.sp),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.sp),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.sp),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
