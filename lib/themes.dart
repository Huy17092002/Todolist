import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppTheme.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppTheme.backgroundColor,
    ),
  );
  static const Color backgroundColor = Colors.white;
}

