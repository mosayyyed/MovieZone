import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../../themes/app_colors.dart';
import '../../utils/constants.dart';

class CustomProgressHUD extends StatelessWidget {
  final Widget child;
  const CustomProgressHUD({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      backgroundRadius: Radius.circular(kBorderRadius),
      barrierColor: AppColors.kSecondaryColor.withAlpha(100),
      // borderColor: AppColors.kGreyColor,
      borderColor: Colors.transparent,
      borderWidth: 2,
      barrierEnabled: true,
      indicatorColor: AppColors.kPrimaryColor,
      child: child,
    );
  }
}
