import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:netspot/custom/custom_paint_clock.dart';
import 'dart:math' as math;

import 'package:netspot/utils/utils.dart';

class HalfCircleClockCustom extends StatefulWidget {
  final duration;
  final radius;
  final imageName;
  final isShowLine;
  final isReverce;
  final from;

  const HalfCircleClockCustom(
      {Key? key,
      required this.duration,
      required this.radius,
      this.isShowLine = true,
      this.isReverce = false,
      required this.imageName,
      this.from = 0})
      : super(key: key);

  @override
  _HalfCircleClockCustomState createState() => _HalfCircleClockCustomState();
}

class _HalfCircleClockCustomState extends State<HalfCircleClockCustom>
    with TickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  late ui.Image secondImage;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    secondImage = await loadUiImage(widget.imageName);
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    Tween<double> _rotationTween = Tween(begin: -math.pi, end: math.pi);
    animation = _rotationTween.animate(controller!)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller!.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller!.forward();
        }
      });
    if (widget.isReverce) {
      controller!.reverse(from: widget.from);
    } else {
      controller!.forward(from: widget.from);
    }
    setState(() {});
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller == null
        ? Container()
        : AnimatedBuilder(
            animation: controller!,
            builder: (BuildContext context, Widget? child) {
              //Start reverse
              if (controller!.value >= 0.5) {
                controller!.reverse();
              } else if (controller!.value <= 0.000001) {
                controller!.forward();
              }
              //end reverse
              // print('value:${controller!.value}');
              return SizedBox(
                height: MediaQuery.of(context).size.width / 2,
                child: CustomPaint(
                  painter: PointPainter(widget.radius, animation!.value,
                      secondImage, widget.isShowLine),
                  child: Container(),
                ),
              );
            },
          );
  }
}
