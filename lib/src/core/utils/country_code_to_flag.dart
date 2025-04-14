import 'package:movie_app/src/core/utils/app_constants.dart';

String getFlagEmoji(String languageCode) {
  final constants = AppLocalizationConstants();
  return constants.flagEmojis[languageCode] ?? '';
}
