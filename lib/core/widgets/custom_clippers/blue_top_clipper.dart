import 'package:flutter/material.dart';

class BlueTopClipper extends CustomClipper<Path> {
  final double yOffset;

  const BlueTopClipper({required this.yOffset});

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 180.0 + yOffset)
    ..quadraticBezierTo(
      size.width / 2.2,
      220.0 + yOffset,
      size.width,
      130.0 + yOffset,
    )
    ..lineTo(size.width, 0.0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
