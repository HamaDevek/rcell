import 'package:flutter/material.dart';
import 'package:netspot/components/icon_component.dart';
import 'package:netspot/languages/lables.dart';
import '../../components/footer_component.dart';
import '../../components/button_primary_component.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(children: [IconComponent()]),
                SizedBox(
                  height: 70,
                ),
                Text(
                  labels['message.start'] ?? '',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  labels['message.lorem'] ?? '',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 60,
                ),
                ButtonPrimaryComponent(
                  child: Text(labels['btn.start'] ?? ''),
                  fontWeight: FontWeight.w700,
                  onPress: () {
                    Navigator.of(context).pushReplacementNamed('/choose-lang');
                  },
                ),
                SizedBox(
                  height: 97,
                ),
                FooterComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
