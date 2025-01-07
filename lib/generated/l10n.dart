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

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get loginDontHaveAccText {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'loginDontHaveAccText',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get loginDontHaveAccHighlightText {
    return Intl.message(
      'Register',
      name: 'loginDontHaveAccHighlightText',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get signupHaveAccText {
    return Intl.message(
      'Already have an account? ',
      name: 'signupHaveAccText',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get signupHaveAccHighlightText {
    return Intl.message(
      'Log In',
      name: 'signupHaveAccHighlightText',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get loginForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'loginForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get loginButton {
    return Intl.message(
      'Log In',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get signupButton {
    return Intl.message(
      'Create Account',
      name: 'signupButton',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get phoneSearchLabel {
    return Intl.message(
      'Search',
      name: 'phoneSearchLabel',
      desc: '',
      args: [],
    );
  }

  /// `Code or country name`
  String get phoneSearchHint {
    return Intl.message(
      'Code or country name',
      name: 'phoneSearchHint',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get loginOrDivider {
    return Intl.message(
      'OR',
      name: 'loginOrDivider',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get createAccountText {
    return Intl.message(
      'Create an account',
      name: 'createAccountText',
      desc: '',
      args: [],
    );
  }

  /// `Register now and start exploring all that our app has to offer. We’re excited to welcome you to our community!`
  String get registerDescriptionText {
    return Intl.message(
      'Register now and start exploring all that our app has to offer. We’re excited to welcome you to our community!',
      name: 'registerDescriptionText',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to the `
  String get termsAndConditionsText1 {
    return Intl.message(
      'By creating an account, you agree to the ',
      name: 'termsAndConditionsText1',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditionsText2 {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditionsText2',
      desc: '',
      args: [],
    );
  }

  /// ` and `
  String get termsAndConditionsText3 {
    return Intl.message(
      ' and ',
      name: 'termsAndConditionsText3',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy.`
  String get termsAndConditionsText4 {
    return Intl.message(
      'Privacy Policy.',
      name: 'termsAndConditionsText4',
      desc: '',
      args: [],
    );
  }

  /// `Full Name is required`
  String get fullNameRequiredError {
    return Intl.message(
      'Full Name is required',
      name: 'fullNameRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Full Name is too short`
  String get fullNameTooShortError {
    return Intl.message(
      'Full Name is too short',
      name: 'fullNameTooShortError',
      desc: '',
      args: [],
    );
  }

  /// `Nickname can only contain letters, numbers, and #`
  String get fullNameInvalidError {
    return Intl.message(
      'Nickname can only contain letters, numbers, and #',
      name: 'fullNameInvalidError',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequiredError {
    return Intl.message(
      'Email is required',
      name: 'emailRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Full Name is too short`
  String get emailInvalidError {
    return Intl.message(
      'Full Name is too short',
      name: 'emailInvalidError',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequiredError {
    return Intl.message(
      'Password is required',
      name: 'passwordRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long and include uppercase letters, lowercase letters, numbers, and special characters`
  String get passwordInvalidError {
    return Intl.message(
      'Password must be at least 8 characters long and include uppercase letters, lowercase letters, numbers, and special characters',
      name: 'passwordInvalidError',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password is required`
  String get confirmPasswordRequiredError {
    return Intl.message(
      'Confirm Password is required',
      name: 'confirmPasswordRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatchError {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatchError',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number is required`
  String get phoneNumberRequiredError {
    return Intl.message(
      'Phone Number is required',
      name: 'phoneNumberRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number is invalid`
  String get phoneNumberInvalidError {
    return Intl.message(
      'Phone Number is invalid',
      name: 'phoneNumberInvalidError',
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
