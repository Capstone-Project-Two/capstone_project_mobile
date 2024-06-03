import 'package:flutter/material.dart';

class BaseAppColors {
  static Color primaryColor = const Color(0xFF005EDC);
  static Color secondaryColor = const Color(0xFF7908D2);
  static Color backgroundColor = const Color(0xFFF2F8FF);
  static Color tertiaryColor = const Color(0xFF3B3B3B);
  static Color inversePrimaryColor = const Color(0xFFFFFFFF);

  static LinearGradient appGradient = LinearGradient(
    colors: [
      primaryColor,
      secondaryColor,
    ],
  );
}
