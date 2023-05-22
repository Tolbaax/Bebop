import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/icon_container.dart';

class TrackingLightCardContent extends StatelessWidget {
  const TrackingLightCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        IconContainer(
          icon: Icons.monitor_heart_outlined,
          padding: 8.0,
        ),
        IconContainer(
          icon: CupertinoIcons.thermometer,
          padding: 16.0,
        ),
        IconContainer(
          icon: Icons.spatial_tracking,
          padding: 8.0,
        ),
      ],
    );
  }
}
