import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.85);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7, size.width * 0.5, size.height * 0.84);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.97, size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    /* path.moveTo(0, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.05, size.height, size.width * 0.3, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.7, size.width * 0.6, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.85, size.height, size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height); */

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}