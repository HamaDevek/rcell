import 'package:flutter/material.dart';

class Themes {
  /*--------------- Light Mode ---------------*/
  final lightMode = ThemeData.light().copyWith(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Color(0xff182341),
      onPrimary: Colors.white,
      secondary: Color(0xFFEEF2FF),
      onSecondary: Color(0xff182341),
    ),
    primaryColor: Color(0xffffffff),
    buttonColor: Color(0xffffffff),
    indicatorColor: Colors.white,
    toggleableActiveColor: Color(0xFFF9F1A3),
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: Color(0xff6E7791),
    canvasColor: Color(0xffEEF2FF),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: const Color(0xFFd63031),
    buttonTheme: ButtonThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Color(0xffffffff),
          onPrimary: Color(0xFF182341),
          secondary: Color(0xFF323D58),
          onSecondary: Colors.white,
        ),
        textTheme: ButtonTextTheme.primary,
        splashColor: Colors.grey,
        buttonColor: Color(0xffffffff)),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 31,
        fontWeight: FontWeight.w800,
        fontFamily: "Poppins",
        color: Color(0xff182341),
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
        color: Color(0xFF6E7791),
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
        color: Color(0xFF6E7791),
      ),
    ),
  );
  /*--------------- Dark Mode ---------------*/
  final darkMode = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    colorScheme: const ColorScheme.light().copyWith(
      primary: Color(0xffffffff),
      onPrimary: Color(0xFF182341),
      secondary: Color(0xFF323D58),
      onSecondary: Colors.white,
      onSurface: Colors.white,
      surface: Color(0xff222F3E),
    ),
    primaryColor: Color(0xffffffff),
    buttonColor: Color(0xffffffff),
    indicatorColor: Colors.white,
    toggleableActiveColor: Color(0xFFF9F1A3),
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    accentColor: Color(0xFF6E7791),
    canvasColor: Color(0xff3F4862),
    scaffoldBackgroundColor: Color(0xFF182341),
    backgroundColor: Color(0xFF1E272E),
    errorColor: const Color(0xFFd63031),
    buttonTheme: ButtonThemeData(
        colorScheme: const ColorScheme.light().copyWith(
          primary: Color(0xffffffff),
          secondary: Color(0xFFF9F1A3),
        ),
        textTheme: ButtonTextTheme.primary,
        splashColor: Colors.grey,
        buttonColor: Color(0xffffffff)),
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 31,
        fontWeight: FontWeight.w800,
        fontFamily: "Poppins",
        color: Color(0xffffffff),
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
        color: Color(0xFF6E7791),
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "Poppins",
        color: Colors.white,
      ),
    ),
  );
}
