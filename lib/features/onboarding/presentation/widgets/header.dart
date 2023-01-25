import 'dart:math';

import 'package:bebop/core/utils/app_strings.dart';
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
            AppStrings.skip,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: AppColors.primary,
                  fontFamily: AppStrings.defaultFont,
                  fontSize: 16.0,
                ),
          ),
        ),
      ],
    );
  }
}
