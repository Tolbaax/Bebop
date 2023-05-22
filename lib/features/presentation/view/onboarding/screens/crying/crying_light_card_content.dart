import 'package:flutter/material.dart';

import '../../widgets/icon_container.dart';

class CryingLightCardContent extends StatelessWidget {
  const CryingLightCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(
          icon: Icons.timeline,
          padding: 8.0,
        ),
        IconContainer(
          icon: Icons.child_care,
          padding: 16.0,
        ),
        IconContainer(
          icon: Icons.translate_outlined,
          padding: 8.0,
        ),
      ],
    );
  }
}
