import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/src/core/responsive_helper/size_provider.dart';

extension SizeHelperExtension on BuildContext {
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  double get screenWidth => isLandscape
      ? MediaQuery.of(this).size.height
      : MediaQuery.of(this).size.width;

  double get screenHeight => isLandscape
      ? MediaQuery.of(this).size.width
      : MediaQuery.of(this).size.height;

  SizeProvider get sizeProvider => SizeProvider.of(this);

  double get scaleWidth => sizeProvider.width / sizeProvider.baseSize.width;
  double get scaleHeight => sizeProvider.height / sizeProvider.baseSize.height;

  double setWidth(num w) => w * scaleWidth;
  double setHeight(num h) => h * scaleHeight;

  double setText(num sp) => sp * scaleWidth;

  double setMinSize(num size) => min(scaleWidth, scaleHeight);
}
