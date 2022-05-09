import 'package:blindside/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    colorScheme: const ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    fontFamily: "Poppins",
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    colorScheme: const ColorScheme.light(),
  );
}
