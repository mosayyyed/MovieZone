import 'package:flutter/material.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      fontFamily: 'Cairo',
      appBarTheme: _appBarTheme(AppColors.primaryColor),
      inputDecorationTheme: _inputDecorationTheme(
        fillColor: AppColors.lightSurface,
        borderColor: AppColors.primaryColor,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
      colorScheme: _darkColorScheme,
      fontFamily: 'Cairo',
      appBarTheme: _appBarTheme(AppColors.primaryColor),
      inputDecorationTheme: _inputDecorationTheme(
        fillColor: AppColors.darkSurface,
        borderColor: AppColors.primaryColor,
      ),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme.light(
    primary: AppColors.primaryColor,
    onPrimary: AppColors.lightOnPrimary,
    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.primaryColor,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    error: AppColors.errorColor,
  );

  static const ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: AppColors.primaryColor,
    onPrimary: AppColors.darkOnPrimary,
    secondary: AppColors.secondaryColor,
    onSecondary: AppColors.primaryColor,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    error: AppColors.errorColor,
  );

  static AppBarTheme _appBarTheme(Color backgroundColor) {
    return AppBarTheme(
      backgroundColor: backgroundColor,
      titleTextStyle: Styles.textStyle22.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: 'Cairo',
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      actionsIconTheme: const IconThemeData(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  static InputDecorationTheme _inputDecorationTheme({
    required Color fillColor,
    required Color borderColor,
  }) {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      errorMaxLines: 2,
      errorStyle: TextStyle(
        color: AppColors.errorColor.withAlpha(180),
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
      ),
      filled: true,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderColor, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.errorColor, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: AppColors.errorColor, width: 1.5),
      ),
      labelStyle: Styles.textStyle12.copyWith(
        color: fillColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
      ),
      hintStyle: Styles.textStyle12.copyWith(
        color: fillColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
