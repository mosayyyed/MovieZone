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

  /// `en`
  String get languageCode {
    return Intl.message(
      'en',
      name: 'languageCode',
      desc: '',
      args: [],
    );
  }

  /// `Movie Zone`
  String get appName {
    return Intl.message(
      'Movie Zone',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Your ultimate movie destination. Stream, watch, and enjoy movies anytime, anywhere.`
  String get appDescription {
    return Intl.message(
      'Your ultimate movie destination. Stream, watch, and enjoy movies anytime, anywhere.',
      name: 'appDescription',
      desc: '',
      args: [],
    );
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

  /// `Unlock the world of entertainment with LetsSee. Stream your favorite films from anywhere, anytime.`
  String get onboardingDescription1 {
    return Intl.message(
      'Unlock the world of entertainment with LetsSee. Stream your favorite films from anywhere, anytime.',
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

  /// `Carry the magic of movies with you. LetsSee lets you watch films on the go, connecting you to cinematic adventures.`
  String get onboardingDescription3 {
    return Intl.message(
      'Carry the magic of movies with you. LetsSee lets you watch films on the go, connecting you to cinematic adventures.',
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

  /// `Sign up`
  String get loginDontHaveAccHighlightText {
    return Intl.message(
      'Sign up',
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

  /// `Log in`
  String get signupHaveAccHighlightText {
    return Intl.message(
      'Log in',
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

  /// `Country code or name`
  String get phoneSearchHint {
    return Intl.message(
      'Country code or name',
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

  /// `Sign up now and start exploring everything our app has to offer. We're excited to welcome you to our community!`
  String get registerDescriptionText {
    return Intl.message(
      'Sign up now and start exploring everything our app has to offer. We\'re excited to welcome you to our community!',
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

  /// `Full Name can only contain letters and spaces`
  String get fullNameInvalidError {
    return Intl.message(
      'Full Name can only contain letters and spaces',
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

  /// `Email is invalid`
  String get emailInvalidError {
    return Intl.message(
      'Email is invalid',
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

  /// `Verification Email`
  String get verificationEmail {
    return Intl.message(
      'Verification Email',
      name: 'verificationEmail',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a verification link to your email:`
  String get verificationInfoText1 {
    return Intl.message(
      'We have sent a verification link to your email:',
      name: 'verificationInfoText1',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email and click the link to verify your email address.`
  String get verificationInfoText2 {
    return Intl.message(
      'Please check your email and click the link to verify your email address.',
      name: 'verificationInfoText2',
      desc: '',
      args: [],
    );
  }

  /// `Didn't receive the email?`
  String get dontReceive {
    return Intl.message(
      'Didn\'t receive the email?',
      name: 'dontReceive',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Email verified successfully`
  String get verificationSuccess {
    return Intl.message(
      'Email verified successfully',
      name: 'verificationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Please check the information you entered and try again.`
  String get invalidDataInput {
    return Intl.message(
      'Please check the information you entered and try again.',
      name: 'invalidDataInput',
      desc: '',
      args: [],
    );
  }

  /// `Network error: Please check your internet connection and try again.`
  String get networkRequestFailed {
    return Intl.message(
      'Network error: Please check your internet connection and try again.',
      name: 'networkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid credentials. Please check your information and try again.`
  String get invalidCredential {
    return Intl.message(
      'Invalid credentials. Please check your information and try again.',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password. Please try again.`
  String get wrongPassword {
    return Intl.message(
      'Incorrect password. Please try again.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email address is not valid.`
  String get invalidEmail {
    return Intl.message(
      'The email address is not valid.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The account associated with this email has been disabled.`
  String get userDisabled {
    return Intl.message(
      'The account associated with this email has been disabled.',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `No account found with this email.`
  String get userNotFound {
    return Intl.message(
      'No account found with this email.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The email is already in use by another account.`
  String get emailAlreadyInUse {
    return Intl.message(
      'The email is already in use by another account.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak. Please choose a stronger one.`
  String get weakPassword {
    return Intl.message(
      'The password is too weak. Please choose a stronger one.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `This operation has been disabled by the administrator.`
  String get operationNotAllowed {
    return Intl.message(
      'This operation has been disabled by the administrator.',
      name: 'operationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Please try again later.`
  String get tooManyRequests {
    return Intl.message(
      'Too many requests. Please try again later.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again.`
  String get unknownError {
    return Intl.message(
      'An unknown error occurred. Please try again.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `No data available at the moment`
  String get noDataAvailable {
    return Intl.message(
      'No data available at the moment',
      name: 'noDataAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No cast available`
  String get noCastAvailable {
    return Intl.message(
      'No cast available',
      name: 'noCastAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Trailers`
  String get trailers {
    return Intl.message(
      'Trailers',
      name: 'trailers',
      desc: '',
      args: [],
    );
  }

  /// `Cast`
  String get cast {
    return Intl.message(
      'Cast',
      name: 'cast',
      desc: '',
      args: [],
    );
  }

  /// `Production Companies`
  String get productionCompanies {
    return Intl.message(
      'Production Companies',
      name: 'productionCompanies',
      desc: '',
      args: [],
    );
  }

  /// `No description available`
  String get noDescriptionAvailable {
    return Intl.message(
      'No description available',
      name: 'noDescriptionAvailable',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Less`
  String get less {
    return Intl.message(
      'Less',
      name: 'less',
      desc: '',
      args: [],
    );
  }

  /// `Error loading data`
  String get errorLoadingData {
    return Intl.message(
      'Error loading data',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Trending Today`
  String get trendingToday {
    return Intl.message(
      'Trending Today',
      name: 'trendingToday',
      desc: '',
      args: [],
    );
  }

  /// `Trending This Week`
  String get trendingThisWeek {
    return Intl.message(
      'Trending This Week',
      name: 'trendingThisWeek',
      desc: '',
      args: [],
    );
  }

  /// `Start Watching`
  String get startWatching {
    return Intl.message(
      'Start Watching',
      name: 'startWatching',
      desc: '',
      args: [],
    );
  }

  /// `Top Rated`
  String get topRated {
    return Intl.message(
      'Top Rated',
      name: 'topRated',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get popular {
    return Intl.message(
      'Popular',
      name: 'popular',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get upcoming {
    return Intl.message(
      'Upcoming',
      name: 'upcoming',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get seeMore {
    return Intl.message(
      'See More',
      name: 'seeMore',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Changes`
  String get confirmChanges {
    return Intl.message(
      'Confirm Changes',
      name: 'confirmChanges',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get accountStatus {
    return Intl.message(
      'Active',
      name: 'accountStatus',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Wifi Only`
  String get wifiOnly {
    return Intl.message(
      'Wifi Only',
      name: 'wifiOnly',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message(
      'Dark Mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Connect to TV`
  String get connectToTV {
    return Intl.message(
      'Connect to TV',
      name: 'connectToTV',
      desc: '',
      args: [],
    );
  }

  /// `Default Quality`
  String get defultQuality {
    return Intl.message(
      'Default Quality',
      name: 'defultQuality',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Auto`
  String get autoAppearance {
    return Intl.message(
      'Auto',
      name: 'autoAppearance',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get lightAppearance {
    return Intl.message(
      'Light',
      name: 'lightAppearance',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get darkAppearance {
    return Intl.message(
      'Dark',
      name: 'darkAppearance',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get appLanguage {
    return Intl.message(
      'App Language',
      name: 'appLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get chooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Allow Notifications`
  String get allowNotifications {
    return Intl.message(
      'Allow Notifications',
      name: 'allowNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Search for your favorite movies`
  String get searchForYourFavoriteMovies {
    return Intl.message(
      'Search for your favorite movies',
      name: 'searchForYourFavoriteMovies',
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
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
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
