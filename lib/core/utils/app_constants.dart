//border radius
const kBorderRadius = 12.0;

//api base url
// const kBaseUrl = "https://api.themoviedb.org/3";

//api image base url
// String kFullImageUrl = "https://image.tmdb.org/t/p/original";

//api key
const kApiKey = "d6ae02fa2806b362ce91ce9b710bd2c5";

class AppConstants {
  static const api = _ApiConstants();
  static const sharedPreferences = _SharedPreferencesConstants();
  static const String appName = "Movie App";
}

class _ApiConstants {
  const _ApiConstants();

  String get baseUrl => "https://api.themoviedb.org/3";
  String get imageUrl => "https://image.tmdb.org/t/p/original";
  String get apiKey => "d6ae02fa2806b362ce91ce9b710bd2c5";
}

class _SharedPreferencesConstants {
  const _SharedPreferencesConstants();
  String get themeKey => "theme_key";
  String get languageKey => "language_key";
}
