import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class CryingTextColumn extends StatelessWidget {
  const CryingTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Cry Translator',
      text:
          'Real-time crying translation Just record the crying for 10 seconds, and artificial intelligence interprets the cry and tells you what your baby needs.',
    );
  }
}
