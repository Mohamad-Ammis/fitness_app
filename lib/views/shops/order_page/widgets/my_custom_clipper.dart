import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height / 3)
      ..quadraticBezierTo(
          size.width / 2, size.height / 3 + 100, size.width, size.height / 3)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
