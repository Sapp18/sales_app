import 'package:flutter/material.dart';

class CardClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, h);
    path.quadraticBezierTo(
        w * 0.0020833, h * 0.8345833, w * 0.0583333, h * 0.6666667);
    path.quadraticBezierTo(
        w * 0.1254167, h * 0.5000000, w * 0.2500000, h * 0.5000000);
    path.lineTo(w * 0.7500000, h * 0.5000000);
    path.quadraticBezierTo(
        w * 0.8754167, h * 0.5008333, w * 0.9416667, h * 0.6666667);
    path.quadraticBezierTo(w * 1.0004167, h * 0.8341667, w, h);
    path.lineTo(w, 0);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
