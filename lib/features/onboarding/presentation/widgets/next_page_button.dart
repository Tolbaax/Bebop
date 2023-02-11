import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: const EdgeInsets.all(16.0),
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: AppColors.white,
      onPressed: onPressed,
      child: Icon(
        Icons.arrow_forward,
        color: AppColors.spaceCadet,
        size: 32.0,
      ),
    );
  }
}
