import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      primaryColorLight: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.lightOnPrimary,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.primaryColor,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightOnSurface,
        onPrimaryFixed: Colors.grey,
      ),
      fontFamily: 'Cairo',
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Cairo',
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.darkOnPrimary,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.primaryColor,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkOnSurface,
        onPrimaryFixed: Colors.grey,
      ),
      fontFamily: 'Cairo',
    );
  }
}
