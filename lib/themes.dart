import 'package:flutter/material.dart';
 // class AppTheme{
 //   static ThemeData lightTheme(){
 //     return ThemeData.light();
 //   }
 // }

class AppTheme {
  //app theme
  static ThemeData theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppTheme.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppTheme.backgroundColor,
      elevation: 0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppTheme.whiteColor,
    ),
  );

  //

  static const Color whiteColor = Colors.white;
  static const Color backgroundColor = Colors.white;
}