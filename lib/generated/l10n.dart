// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Movies Anywhere, Anytime`
  String get onboardingTitle1 {
    return Intl.message(
      'Movies Anywhere, Anytime',
      name: 'onboardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Your Unlimited Movie Destination`
  String get onboardingTitle2 {
    return Intl.message(
      'Your Unlimited Movie Destination',
      name: 'onboardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Cinema in Your Pocket`
  String get onboardingTitle3 {
    return Intl.message(
      'Cinema in Your Pocket',
      name: 'onboardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Unlock the world of entertainment with LetsSee. Stream your favorite films from wherever you are, whenever you want.`
  String get onboardingDescription1 {
    return Intl.message(
      'Unlock the world of entertainment with LetsSee. Stream your favorite films from wherever you are, whenever you want.',
      name: 'onboardingDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Where movie magic knows no boundaries. Experience a seamless cinematic journey at your fingertips.`
  String get onboardingDescription2 {
    return Intl.message(
      'Where movie magic knows no boundaries. Experience a seamless cinematic journey at your fingertips.',
      name: 'onboardingDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Carry the magic of the movies with you. LetsSee lets you watch films on the go, connecting you to cinematic adventures.`
  String get onboardingDescription3 {
    return Intl.message(
      'Carry the magic of the movies with you. LetsSee lets you watch films on the go, connecting you to cinematic adventures.',
      name: 'onboardingDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get onboardingContinue {
    return Intl.message(
      'Continue',
      name: 'onboardingContinue',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get onboardingGetStarted {
    return Intl.message(
      'Get Started',
      name: 'onboardingGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get onboardingSkip {
    return Intl.message(
      'Skip',
      name: 'onboardingSkip',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
