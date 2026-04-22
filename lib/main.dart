import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/cv_controller.dart';
import 'controllers/theme_controller.dart';
import 'database/database.dart';
import 'database/connection.dart';
import 'repositories/cv_repository.dart';
import 'views/screens/landing_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize WasmDatabase securely
  final database = AppDatabase(connect());
  final repository = CvRepository(database);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          final controller = CvController();
          // Inject Repository Pattern
          controller.repository = repository;
          // Auto-Load latest DB Singleton row to memory on boot
          controller.initFromDb();
          return controller;
        }),
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
