import 'package:movie_app/core/utils/app_constants.dart';

String getFlagEmoji(String languageCode) {
  final constants = AppLocalizationConstants();
  return constants.flagEmojis[languageCode] ?? '';
}
