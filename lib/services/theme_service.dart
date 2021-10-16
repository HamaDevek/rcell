import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeService {
  var brightness = SchedulerBinding.instance!.window.platformBrightness;
  ThemeMode getThemeMode() {
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
