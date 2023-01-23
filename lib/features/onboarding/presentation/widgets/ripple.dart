import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class Ripple extends StatelessWidget {
  final double radius;

  const Ripple({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.width / 2 - radius,
      bottom: 2 * 32.0 - radius,
      child: Container(
        width: 2.2 * radius,
        height: 2.2 * radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
