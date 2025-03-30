import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferences _prefs;
  static const String _themeKey = 'selected_theme';

  ThemeCubit(this._prefs) : super(ThemeMode.system) {
    loadTheme();
  }

  void loadTheme() {
    final themeIndex = _prefs.getInt(_themeKey) ?? 0;
    emit(ThemeMode.values[themeIndex]);
  }

  Future<void> toggleTheme(ThemeMode themeMode) async {
    await _prefs.setInt(_themeKey, themeMode.index);
    emit(themeMode);
  }
}
