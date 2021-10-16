import 'package:flutter/material.dart';

class TextfieldPrimaryComponent extends StatelessWidget {
  const TextfieldPrimaryComponent(
      {Key? key, this.obscureText, required this.textHint, this.controller})
      : super(key: key);
  final bool? obscureText;
  final String textHint;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyText2,
      obscureText: obscureText ?? false,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).canvasColor, width: 1),
        ),
        hintText: textHint,
        hintStyle: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
