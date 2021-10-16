import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netspot/components/button_secondary_component.dart';
import 'package:netspot/components/icon_component.dart';
import 'package:netspot/components/button_primary_component.dart';
import 'package:netspot/components/textfiled_primary_component.dart';
import 'package:netspot/languages/lables.dart';
import '../../components/footer_component.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController? _emailController, _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 121,
                    ),
                    Row(children: [
                      IconComponent(
                        size: 48,
                        fontSize: 21,
                      ),
                    ]),
                    SizedBox(
                      height: 45,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        labels['btn.signin'] ?? '',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      labels['message.signin'] ?? '',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    TextfieldPrimaryComponent(
                      textHint: labels['label.email'] ?? '',
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextfieldPrimaryComponent(
                      textHint: labels['label.password'] ?? '',
                      obscureText: true,
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    ButtonPrimaryComponent(
                      child: Text(labels['btn.signin'] ?? ''),
                      fontWeight: FontWeight.w700,
                      onPress: () {
                        Navigator.of(context).pushReplacementNamed('/success');
                      },
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.secondary,
                      margin: EdgeInsets.symmetric(
                        vertical: 35,
                      ),
                    ),
                    ButtonSecondaryComponent(
                      child: Text(labels['btn.auto.signin'] ?? ''),
                      fontWeight: FontWeight.w700,
                      onPress: () {
                        _emailController!.text = 'meer@netspot.com';
                        _passwordController!.text = 'meer@netspot.com';
                      },
                    ),
                  ],
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
