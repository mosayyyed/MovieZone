class AppAssets {
  static const String appLogo = "assets/movieisme-logo.svg";

  static const icons = _AppIcons();
  static const onboarding = _AppOnboarding();
}

class _AppIcons {
  const _AppIcons();

  String get home => "assets/icons/home-04-stroke-rounded.svg";
  String get discover => "assets/icons/discover-circle-stroke-rounded.svg";
  String get bookmark => "assets/icons/bookmark-02-stroke-rounded.svg";
  String get bookmarkFilled => "assets/icons/all-bookmark-stroke-rounded.svg";
  String get bookmarkAdd => "assets/icons/bookmark-add-02-stroke-rounded.svg";
  String get bookmarkRemove =>
      "assets/icons/bookmark-remove-02-solid-rounded.svg";
  String get profile => "assets/icons/user-stroke-rounded.svg";
  String get search => "assets/icons/search-01-stroke-rounded.svg";
  String get download => "assets/icons/download-05-stroke-rounded.svg";
  String get share => "assets/icons/share-01-stroke-rounded.svg";
  String get notification => "assets/icons/notification-03-stroke-rounded.svg";
  String get playArrow => "assets/icons/play-stroke-rounded.svg";
  String get moreHorizontalCircle =>
      "assets/icons/more-horizontal-circle-01-stroke-rounded.svg";
}

class _AppOnboarding {
  const _AppOnboarding();

  String get onboarding1 => "assets/onboarding/onboarding.png";
  String get onboarding2 => "assets/onboarding/onboarding1.jpg";
  String get onboarding3 => "assets/onboarding/background.png";
}
