import 'package:flutter/material.dart';
import 'package:netspot/app/components/custom_text_button_component.dart';
import 'package:netspot/languages/lables.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextButtonComponent(
              text: labels['terms.and.conditions'] ?? '',
              onPress: () {
                print(labels['terms.and.conditions'] ?? '');
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 13.5),
              height: 11,
              width: 1,
              color: Theme.of(context).accentColor,
            ),
            CustomTextButtonComponent(
              text: labels['privacy.policy'] ?? '',
              onPress: () {
                print(labels['privacy.policy'] ?? '');
              },
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          labels['copyright'] ?? '',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            fontFamily: "Poppins",
            color: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
