import 'package:flutter/material.dart';
import '../themes/cv_theme.dart';

class ThemeController extends ChangeNotifier {
  CVTheme _currentTheme = CVTheme.modernTheme;

  CVTheme get currentTheme => _currentTheme;

  final List<CVTheme> availableThemes = [
    CVTheme.modernTheme,
    CVTheme.classicTheme,
    CVTheme.minimalTheme,
  ];

  void switchTheme(CVTheme theme) {
    if (_currentTheme.id != theme.id) {
      _currentTheme = theme;
      notifyListeners();
    }
  }

  void switchThemeById(String id) {
    final theme = availableThemes.firstWhere(
      (t) => t.id == id,
      orElse: () => CVTheme.modernTheme,
    );
    switchTheme(theme);
  }
}
