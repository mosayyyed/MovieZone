// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'app_themes.dart';
//
// enum ThemeModeType { light, dark, system }
//
// class ThemeCubit extends Cubit<ThemeData> {
//   ThemeCubit() : super(AppThemes.lightTheme);
//
//   ThemeModeType _currentMode = ThemeModeType.system;
//
//   Future<void> loadTheme() async {
//     final prefs = await SharedPreferences.getInstance();
//     final savedMode = prefs.getString('themeMode') ?? 'system';
//     _currentMode = ThemeModeType.values
//         .firstWhere((e) => e.toString() == 'ThemeModeType.$savedMode');
//
//     switch (_currentMode) {
//       case ThemeModeType.light:
//         emit(AppThemes.lightTheme);
//         break;
//       case ThemeModeType.dark:
//         emit(AppThemes.darkTheme);
//         break;
//       case ThemeModeType.system:
//         _applySystemTheme();
//         break;
//     }
//   }
//
//   void changeTheme(ThemeModeType mode) async {
//     _currentMode = mode;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('themeMode', mode.toString().split('.').last);
//
//     if (mode == ThemeModeType.light) {
//       emit(AppThemes.lightTheme);
//     } else if (mode == ThemeModeType.dark) {
//       emit(AppThemes.darkTheme);
//     } else {
//       _applySystemTheme();
//     }
//   }
//
//   void _applySystemTheme() {
//     final brightness =
//         WidgetsBinding.instance.platformDispatcher.platformBrightness;
//     emit(brightness == Brightness.dark
//         ? AppThemes.darkTheme
//         : AppThemes.lightTheme);
//   }
// }
