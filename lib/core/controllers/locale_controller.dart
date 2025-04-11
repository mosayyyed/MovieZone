import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movie_app/core/utils/app_constants.dart';

class LocaleCubit extends Cubit<Locale> {
  final SharedPreferences _prefs;

  static const String _languageKey = 'selected_language';

  LocaleCubit(this._prefs) : super(const Locale('en')) {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final savedLanguageCode = _prefs.getString(_languageKey);

    if (savedLanguageCode != null) {
      emit(Locale(savedLanguageCode));
      return;
    }

    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;

    final isSupported = AppConstants.languages.supportedLanguages.values
        .any((locale) => locale.languageCode == deviceLocale.languageCode);

    emit(
      isSupported ? Locale(deviceLocale.languageCode) : const Locale('en'),
    );
  }

  Future<void> changeLanguage(String languageCode) async {
    if (state.languageCode != languageCode) {
      await _prefs.setString(_languageKey, languageCode);
      emit(Locale(languageCode));
    }
  }
}
