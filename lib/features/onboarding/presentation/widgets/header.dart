import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/assets_manager.dart';

class Header extends StatelessWidget {
  final VoidCallback onSkip;

  const Header({
    super.key,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Transform.rotate(
          angle: -pi / 20.0,
          child: const Image(
            image: AssetImage(ImageAssets.babyLogo),
            height: 32.0,
          ),
        ),
        GestureDetector(
          onTap: onSkip,
          child: Text(
            'Skip',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.primary,
                  fontFamily: '',
                  fontSize: 18.0,
                ),
          ),
        ),
      ],
    );
  }
}
