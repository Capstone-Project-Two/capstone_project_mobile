import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF005EDC),
    secondary: Color(0xFF7908D2),
    background: Color(0xFFF2F8FF),
    tertiary: Color(0xFF3B3B3B),
    inversePrimary: Color(0xFFFFFFFF),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      overflow: TextOverflow.ellipsis,
    ),
    displayMedium: TextStyle(
      overflow: TextOverflow.ellipsis,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    displaySmall: TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 16,
    ),
    bodyLarge: TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 16,
      height: 1.15,
    ),
    bodyMedium: TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 15,
      height: 1.15,
    ),
    bodySmall: TextStyle(
      overflow: TextOverflow.ellipsis,
      fontSize: 14,
      height: 1.15,
    ),
  ),
);
