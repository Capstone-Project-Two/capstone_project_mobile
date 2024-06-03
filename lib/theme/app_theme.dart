import 'package:capstone_project_mobile/theme/base_app_colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: BaseAppColors.primaryColor,
    secondary: BaseAppColors.secondaryColor,
    background: BaseAppColors.backgroundColor,
    tertiary: BaseAppColors.tertiaryColor,
    inversePrimary: BaseAppColors.inversePrimaryColor,
  ),
);
