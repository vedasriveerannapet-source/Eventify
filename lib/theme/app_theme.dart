
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF5B3CC4);
  static const Color secondary = Color(0xFF8B6CE0);
  static const Color background = Color(0xFFF8F6FF);
  static const Color darkText = Color(0xFF242033);
  static const Color lightPurple = Color(0xFFEDE7FF);

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
