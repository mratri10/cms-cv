import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/cv_controller.dart';
import 'controllers/theme_controller.dart';
import 'views/screens/landing_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CvController()),
        ChangeNotifierProvider(create: (_) => ThemeController()),
      ],
      child: const CmsCvApp(),
    ),
  );
}

class CmsCvApp extends StatelessWidget {
  const CmsCvApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();

    return MaterialApp(
      title: 'Flutter CV CMS',
      theme: themeController.currentTheme.toThemeData(),
      home: const LandingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
