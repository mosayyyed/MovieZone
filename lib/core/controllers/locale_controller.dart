import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  final SharedPreferences _prefs;

  static const String _languageKey = 'selected_language';

  LocaleCubit(this._prefs) : super(const Locale('en')) {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final languageCode = _prefs.getString(_languageKey) ?? 'en';
    emit(Locale(languageCode));
  }

  Future<void> changeLanguage(String languageCode) async {
    await _prefs.setString(_languageKey, languageCode);
    emit(Locale(languageCode));
  }
}
