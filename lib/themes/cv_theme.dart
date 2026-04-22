import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CVTheme {
  final String id;
  final String name;
  final Color primaryColor;
  final Color accentColor;
  final TextStyle titleStyle;
  final TextStyle bodyStyle;

  CVTheme({
    required this.id,
    required this.name,
    required this.primaryColor,
    required this.accentColor,
    required this.titleStyle,
    required this.bodyStyle,
  });

  // Predefined Themes
  static CVTheme get modernTheme => CVTheme(
    id: 'modern',
    name: 'Modern (Vibrant)',
    primaryColor: const Color(0xFF6200EA), // Deep vibrant purple
    accentColor: const Color(0xFF03DAC6), // Teal accent
    titleStyle: GoogleFonts.outfit(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF1E1E1E),
    ),
    bodyStyle: GoogleFonts.inter(fontSize: 16, color: const Color(0xFF4A4A4A)),
  );

  static CVTheme get classicTheme => CVTheme(
    id: 'classic',
    name: 'Classic (Professional)',
    primaryColor: const Color(0xFF1A365D), // Navy Blue
    accentColor: const Color(0xFFD69E2E), // Gold accent
    titleStyle: GoogleFonts.merriweather(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: const Color(0xFF1A202C),
    ),
    bodyStyle: GoogleFonts.lora(fontSize: 16, color: const Color(0xFF4A5568)),
  );

  static CVTheme get minimalTheme => CVTheme(
    id: 'minimal',
    name: 'Minimal (Clean)',
    primaryColor: const Color(0xFF000000), // Pure Black
    accentColor: const Color(0xFF718096), // Slate Grey
    titleStyle: GoogleFonts.workSans(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF000000),
    ),
    bodyStyle: GoogleFonts.workSans(
      fontSize: 16,
      color: const Color(0xFF2D3748),
    ),
  );

  // Converts our CVTheme class into standard Flutter ThemeData for UI
  ThemeData toThemeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: accentColor,
        surface: const Color(
          0xFFF4F5F7,
        ), // Uniform clean surface for app background
      ),
      scaffoldBackgroundColor: const Color(0xFFF4F5F7),
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: titleStyle.copyWith(color: Colors.white, fontSize: 20),
      ),
      textTheme: TextTheme(
        titleLarge: titleStyle,
        titleMedium: titleStyle.copyWith(fontSize: 18),
        bodyLarge: bodyStyle,
        bodyMedium: bodyStyle.copyWith(fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  // CSS-like unified container card decoration
  BoxDecoration get cardDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.04),
        blurRadius: 16,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
