import 'package:flutter/material.dart';
import 'package:netspot/services/theme_service.dart';
import '../theme/theme_modes.dart';
import '../utils/config.dart';
import 'routes/router.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: Themes().lightMode,
      initialRoute: ConfigApp.root,
      title: ConfigApp.appName,
      darkTheme: Themes().darkMode,
      themeMode: ThemeService().getThemeMode(),
    );
  }
}
