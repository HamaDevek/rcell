import 'package:flutter/material.dart';

class CustomTextButtonComponent extends StatelessWidget {
  const CustomTextButtonComponent(
      {Key? key, required this.text, required this.onPress})
      : super(key: key);
  final String text;
  final onPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins",
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
