import 'package:bebop/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(16.0),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: AppColors.primary,
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
        size: 32.0,
      ),
    );
  }
}
