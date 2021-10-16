import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netspot/languages/lables.dart';
import '../../components/footer_component.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 300,
                        width: 300,
                        child:
                            Lottie.asset('assets/lottie/64787-success.json')),
                    Text(
                      labels['successful'] ?? '',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      labels['message.signin.success'] ?? '',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
              FooterComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
