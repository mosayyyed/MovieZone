import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/core/responsive_helper/size_helper_extension.dart';

class DeviceUtils {
  static bool isMobile(BuildContext context) {
    if (kIsWeb) return context.screenWidth < 600;
    return context.screenWidth < 600 && (Platform.isAndroid || Platform.isIOS);
  }

  static bool isTablet(BuildContext context) {
    return context.screenWidth >= 600 && context.screenWidth <= 1024;
  }

  static bool isDesktop(BuildContext context) {
    return context.screenWidth > 1024;
  }

  static T? valueDecider<T>(
    BuildContext context, {
    required T onMobile,
    T? onTablet,
    T? onDesktop,
    T? onOther,
  }) {
    switch (getDeviceType(context)) {
      case DeviceType.mobile:
        return onMobile;
      case DeviceType.tablet:
        return onTablet;
      case DeviceType.desktop:
        return onDesktop;
      case DeviceType.unknown:
        return onOther;
    }
  }

  static DeviceType getDeviceType(BuildContext context) {
    if (isMobile(context)) return DeviceType.mobile;
    if (isTablet(context)) return DeviceType.tablet;
    if (isDesktop(context)) return DeviceType.desktop;
    return DeviceType.unknown;
  }
}

enum DeviceType { mobile, tablet, desktop, unknown }
