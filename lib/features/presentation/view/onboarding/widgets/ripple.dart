import 'package:bebop/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final double radius;

  const Ripple({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      left: screenWidth / 2 - radius,
      bottom: 2 * 32.0 - radius,
      child: Container(
        width: 2.2 * radius,
        height: 2.2 * radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
      ),
    );
  }
}
