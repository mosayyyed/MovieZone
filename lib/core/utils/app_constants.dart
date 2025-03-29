import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static const api = _ApiConstants();
  static const sharedPreferences = _SharedPreferencesConstants();
  static const String appName = "Movie App";
}

class _ApiConstants {
  const _ApiConstants();

  String get baseUrl => "https://api.themoviedb.org/3";
  String get imageUrl => "https://image.tmdb.org/t/p/original";
  String get apiKey => dotenv.env["API_KEY"] ?? '';
}

class _SharedPreferencesConstants {
  const _SharedPreferencesConstants();
  String get themeKey => "theme_key";
  String get languageKey => "language_key";
}
