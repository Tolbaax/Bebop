import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class VoiceRecognitionTextColumn extends StatelessWidget {
  const VoiceRecognitionTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Voice Recognition',
      text:
          'Identify the strange sounds that surround the child and warn the mother',
    );
  }
}
