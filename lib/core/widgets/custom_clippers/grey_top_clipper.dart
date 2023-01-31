import 'package:flutter/material.dart';

class GreyTopClipper extends CustomClipper<Path> {
  final double yOffset;

  const GreyTopClipper({required this.yOffset});

  @override
  Path getClip(Size size) => Path()
    ..lineTo(0.0, 225.0 + yOffset)
    ..quadraticBezierTo(
      size.width / 2,
      245.0 + yOffset,
      size.width,
      145.0 + yOffset,
    )
    ..lineTo(size.width, 0.0)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
