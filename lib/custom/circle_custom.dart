import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyPainter extends StatefulWidget {
  @override
  _MyPainterState createState() => _MyPainterState();
}

class _MyPainterState extends State<MyPainter> with TickerProviderStateMixin {
  var _radius = 100.0;

  Animation<double>? animationSecond;
  AnimationController? controllerSecond;
  Animation<double>? animationMeunite;
  AnimationController? controllerMeunite;
  Animation<double>? animationHoure;
  AnimationController? controllerHoure;

  @override
  void initState() {
    super.initState();

    controllerSecond = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );

    Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);

    animationSecond = _rotationTween.animate(controllerSecond!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controllerSecond!.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controllerSecond!.forward();
        }
      });

    controllerSecond!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            Transform.rotate(
              angle: math.pi / 2,
              child: CustomPaint(
                foregroundPainter:
                    PointPainter(_radius, animationSecond!.value),
                painter: CirclePainter(_radius),
                child: Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// FOR PAINTING THE CIRCLE
class CirclePainter extends CustomPainter {
  final double radius;
  CirclePainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.purpleAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var path = Path();
    path.addOval(Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 1.4),
      radius: radius,
    ));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// FOR PAINTING THE TRACKING POINT
class PointPainter extends CustomPainter {
  final double radius;
  final double radians;
  PointPainter(this.radius, this.radians);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    var pointPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    var path = Path();

    Offset center = Offset(size.width / 2, size.height / 1.4);
    final icon = Icons.lock_clock;
    var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
      fontFamily: icon.fontFamily,
    ))
      ..addText(String.fromCharCode(icon.codePoint));
    var para = builder.build();
    para.layout(const ui.ParagraphConstraints(width: 60));

    path.moveTo(center.dx, center.dy);
    Offset pointOnCircle = Offset(
      radius * math.cos(radians) + center.dx,
      radius * math.sin(radians) + center.dy,
    );
    canvas.drawParagraph(para, pointOnCircle);
    // canvas.drawCircle(pointOnCircle, 10, pointPaint);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
