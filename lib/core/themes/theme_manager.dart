import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences prefs;

  ThemeCubit(this.prefs) : super(ThemeInitial()) {
    loadTheme();
  }

  static const String _themeKey = "theme_mode";

  void loadTheme() {
    final themeIndex = prefs.getInt(_themeKey) ?? 0;
    emit(ThemeChanged(ThemeMode.values[themeIndex]));
  }

  Future<void> toggleTheme(ThemeMode themeMode) async {
    await prefs.setInt(_themeKey, themeMode.index);
    emit(ThemeChanged(themeMode));
  }
}

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState {
  final ThemeMode themeMode;
  ThemeChanged(this.themeMode);
}
