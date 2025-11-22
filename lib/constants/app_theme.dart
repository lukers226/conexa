import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.light.background,
    cardColor: AppColors.light.card,
    primaryColor: AppColors.light.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.light.primary,
      secondary: AppColors.light.accent,
      error: AppColors.light.error,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.light.textPrimary),
      bodyMedium: TextStyle(color: AppColors.light.textSecondary),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dark.background,
    cardColor: AppColors.dark.card,
    primaryColor: AppColors.dark.primary,
    colorScheme: ColorScheme.dark(
      primary: AppColors.dark.primary,
      secondary: AppColors.dark.accent,
      error: AppColors.dark.error,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.dark.textPrimary),
      bodyMedium: TextStyle(color: AppColors.dark.textSecondary),
    ),
  );
}
