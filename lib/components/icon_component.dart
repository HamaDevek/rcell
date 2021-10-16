import 'package:flutter/material.dart';
import 'package:netspot/services/theme_service.dart';

class IconComponent extends StatelessWidget {
  const IconComponent({Key? key, this.size, this.fontSize}) : super(key: key);
  final double? size;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 63,
      width: size ?? 63,
      decoration: ThemeService().brightness == Brightness.dark
          ? BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff406AFF), Colors.transparent],
              ),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xff406AFF),
            ),
      child: Center(
        child: Text(
          'R',
          style: TextStyle(
              fontSize: fontSize ?? 32,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
