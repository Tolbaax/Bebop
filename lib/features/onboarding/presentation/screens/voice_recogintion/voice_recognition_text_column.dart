import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class VoiceRecognitionTextColumn extends StatelessWidget {
  const VoiceRecognitionTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: AppStrings.title2,
      text: AppStrings.desc2,
    );
  }
}
