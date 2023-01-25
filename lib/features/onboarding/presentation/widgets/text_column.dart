import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';

class TextColumn extends StatelessWidget {
  final String title;
  final String text;

  const TextColumn({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.spaceCadet,
            fontSize: 35.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 15.0),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 20.0,
                color: AppColors.spaceCadet.withOpacity(0.8),
                wordSpacing: 2,
                height: 1.5,
              ),
        ),
      ],
    );
  }
}
