import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences _prefs;

  ThemeCubit(this._prefs) : super(ThemeInitial()) {
    loadTheme();
  }

  void loadTheme() {
    final themeIndex =
        _prefs.getInt(AppConstants.sharedPreferences.themeKey) ?? 0;
    emit(ThemeChanged(ThemeMode.values[themeIndex]));
  }

  Future<void> toggleTheme(ThemeMode themeMode) async {
    await _prefs.setInt(
        AppConstants.sharedPreferences.themeKey, themeMode.index);
    emit(ThemeChanged(themeMode));
  }
}

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeChanged extends ThemeState {
  final ThemeMode themeMode;
  ThemeChanged(this.themeMode);
}
