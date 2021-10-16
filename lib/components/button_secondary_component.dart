import 'package:flutter/material.dart';

class ButtonSecondaryComponent extends StatelessWidget {
  const ButtonSecondaryComponent(
      {Key? key,
      required this.child,
      required this.fontWeight,
      required this.onPress})
      : super(key: key);
  final Widget child;
  final FontWeight fontWeight;
  final onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle: TextStyle(
          fontSize: 15,
          fontWeight: fontWeight,
          fontFamily: "Poppins",
          color: Theme.of(context).primaryColor,
        ),
        onPrimary: Theme.of(context).colorScheme.onSecondary,
        primary: Theme.of(context).colorScheme.secondary,
        minimumSize: Size(double.infinity, 60),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
      child: child,
    );
  }
}
