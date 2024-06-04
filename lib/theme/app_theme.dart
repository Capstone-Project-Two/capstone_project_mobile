import 'package:capstone_project_mobile/theme/base_app_colors.dart';
import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF005EDC);
Color secondaryColor = const Color(0xFF7908D2);
Color backgroundColor = const Color(0xFFF2F8FF);
Color tertiaryColor = const Color(0xFF3B3B3B);
Color inversePrimaryColor = const Color(0xFFFFFFFF);

ThemeData appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(
      color: inversePrimaryColor,
      fontSize: 24,
    ),
    iconTheme: IconThemeData(
      color: inversePrimaryColor,
    ),
  ),
  colorScheme: ColorScheme.light(
    primary: BaseAppColors.primaryColor,
    secondary: BaseAppColors.secondaryColor,
    background: BaseAppColors.backgroundColor,
    tertiary: BaseAppColors.tertiaryColor,
    inversePrimary: BaseAppColors.inversePrimaryColor,
    
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
