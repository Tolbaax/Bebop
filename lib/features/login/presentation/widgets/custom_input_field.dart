import 'package:bebop/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixTab;
  final bool obscureText;

  const CustomInputField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.suffixTab,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.black.withOpacity(0.12)),
        ),
        hintText: label,
        hintStyle: TextStyle(
          color: AppColors.black.withOpacity(0.5),
          fontWeight: FontWeight.w500,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.black.withOpacity(0.5),
        ),
        suffixIcon: (suffixIcon != null)
            ? InkWell(
                onTap: suffixTab,
                child: Icon(
                  suffixIcon,
                  color: AppColors.black.withOpacity(0.5),
                ),
              )
            : null,
      ),
      obscureText: obscureText,
    );
  }
}
