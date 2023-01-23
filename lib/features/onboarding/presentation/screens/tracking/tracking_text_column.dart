import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class TrackingTextColumn extends StatelessWidget {
  const TrackingTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: 'Vital Signs Tracking',
      text: 'Be aware of how the \n measurements are changing',
    );
  }
}
