import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netspot/components/icon_component.dart';
import 'package:netspot/custom/half_circle_clock_custom.dart';
import 'package:netspot/languages/lables.dart';
import '../../components/footer_component.dart';
import '../../components/button_primary_component.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  double? fromSecond, fromHour, fromMinute;
  bool isSecondReverce = false;
  bool isHourReverce = false;
  bool isMinuteReverce = false;
  @override
  void initState() {
    super.initState();
    final DateTime now = DateTime.now();
    double s = correctFrom(time: now.second.toDouble(), min: 15, max: 45);
    double m = correctFrom(time: now.minute.toDouble(), min: 15, max: 45);
    double h = correctFrom(
        time: (now.hour < 12 ? now.hour : now.hour - 12).toDouble(),
        min: 3,
        max: 9);

    isSecondReverce = now.second > 30;
    isMinuteReverce = now.minute > 30;
    isHourReverce = now.hour > 3;

    fromSecond = s / 60;
    fromMinute = m / 60;
    fromHour = h / 12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, -0.8),
              child: Stack(
                children: [
                  HalfCircleClockCustom(
                    duration: Duration(seconds: 12),
                    radius: MediaQuery.of(context).size.width / 2,
                    imageName: 'assets/images/hr.png',
                    from: fromHour,
                    // isReverce: isHourReverce,
                  ),
                  HalfCircleClockCustom(
                    duration: Duration(minutes: 60),
                    radius: MediaQuery.of(context).size.width / 2,
                    imageName: 'assets/images/min.png',
                    isShowLine: false,
                    from: fromMinute,
                    isReverce: isMinuteReverce,
                  ),
                  HalfCircleClockCustom(
                    duration: Duration(seconds: 60),
                    radius: MediaQuery.of(context).size.width / 2.8,
                    imageName: 'assets/images/sec.png',
                    isShowLine: true,
                    from: fromSecond,
                    isReverce: isSecondReverce,
                  ),
                ],
              ),
            ),
            Center(
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
                        Navigator.of(context)
                            .pushReplacementNamed('/choose-lang');
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
          ],
        ),
      ),
    );
  }

  double correctFrom(
      {required double time, required double min, required double max}) {
    double temp = time;
    if (temp > min && temp <= max) {
      temp = temp - min;
      temp = min - temp;
      temp = temp + min;
    } else if (temp > max) {
      temp = temp - max;
    } else {
      temp = temp + min;
    }
    return temp;
  }
}
