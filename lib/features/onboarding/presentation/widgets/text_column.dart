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
            fontSize: 30.0,
            fontFamily: 'Guyon Gazebo',
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 15.0),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontSize: 25.0,
                color: AppColors.spaceCadet.withOpacity(0.9),
                wordSpacing: 2,
                height: 1.2,
              ),
        ),
      ],
    );
  }
}
