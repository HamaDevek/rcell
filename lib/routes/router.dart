import 'package:flutter/material.dart';
import 'package:netspot/app/view/choose_language_screen.dart';
import 'package:netspot/app/view/clock_screen.dart';
import 'package:netspot/app/view/signin_screen.dart';
import 'package:netspot/app/view/success_screen.dart';
import 'package:netspot/app/view/unknowen_route_page.dart';
import 'package:netspot/utils/utils.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return animateRoute(ClockScreen());
      case '/choose-lang':
        return animateRoute(ChooseLanguageScreen());
      case '/signin':
        return animateRoute(SignInScreen());
      case '/success':
        return animateRoute(SuccessScreen());
      default:
        // PAGE NOT FOUND
        return animateRoute(UnknownRoutePage());
    }
  }
}
