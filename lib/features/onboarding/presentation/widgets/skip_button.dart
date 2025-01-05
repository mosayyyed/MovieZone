import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/themes/app_styles.dart';
import 'package:movie_app/core/utils/constants.dart';

import '../../../../core/themes/app_colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    this.onPressed,
    this.icon,
  });

  final void Function()? onPressed;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));

    return Positioned(
        top: 40,
        right: 20,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            minimumSize: const Size(40, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            backgroundColor: AppColors.kSecondaryColor,
          ),
          child: icon ??
              Text('Skip',
                  style: Styles.textStyle14
                      .copyWith(color: AppColors.kPrimaryColor)),
        ));
  }
}
