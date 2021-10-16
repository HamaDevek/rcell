// FOR PAINTING THE TRACKING POINT
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

import 'package:netspot/services/theme_service.dart';

class PointPainter extends CustomPainter {
  final double radius;
  final double radians;
  final ui.Image image;
  final isShowLine;
  PointPainter(this.radius, this.radians, this.image, this.isShowLine);

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height);
    Offset pointOnCircle = Offset(
      radius * math.cos(radians) + center.dx,
      radius * math.sin(radians) + center.dy,
    );

    var paintx = Paint()
      ..color = ThemeService().getThemeMode() == ThemeMode.dark
          ? Color(0xff5F687E)
          : Color(0xffE6E6E6)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    if (isShowLine) {
      canvas.drawArc(
        Rect.fromCenter(
          center: center,
          height: radius * 2,
          width: radius * 2,
        ),
        math.pi,
        math.pi,
        false,
        paintx,
      );
    }

    canvas.translate(
        (-image.width / 2).toDouble(), (-image.height / 2).toDouble());
    canvas.drawImage(image, pointOnCircle, paintx);
    canvas.translate(
        (image.width / 2).toDouble(), (image.height / 2).toDouble());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
