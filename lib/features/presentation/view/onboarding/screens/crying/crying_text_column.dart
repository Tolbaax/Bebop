import 'package:bebop/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class CryingTextColumn extends StatelessWidget {
  const CryingTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextColumn(
      title: AppStrings.title3,
      text: AppStrings.desc3,
    );
  }
}
