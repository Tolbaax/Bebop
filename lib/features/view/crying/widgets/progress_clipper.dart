import 'package:flutter/material.dart';

class ProgressClipper extends CustomClipper<Path> {
  final Animation animation;

  ProgressClipper({required this.animation});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0.0, size.height * (1 - animation.value));
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height * (1 - animation.value));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
