import 'package:flutter/material.dart';

import '../../widgets/icon_container.dart';

class VoiceRecognitionLightCardContent extends StatelessWidget {
  const VoiceRecognitionLightCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(
          icon: Icons.signal_cellular_alt_sharp,
          padding: 8.0,
        ),
        IconContainer(
          icon: Icons.keyboard_voice_outlined,
          padding: 16.0,
        ),
        IconContainer(
          icon: Icons.record_voice_over,
          padding: 8.0,
        ),
      ],
    );
  }
}
