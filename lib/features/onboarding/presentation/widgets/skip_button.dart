import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_styles.dart';
import 'package:movie_app/core/utils/constants.dart';

import '../../../../core/themes/app_colors.dart';
import '../../../../generated/l10n.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    this.onPressed,
    this.icon,
    this.hasBorderSide = false,
  });

  final void Function()? onPressed;
  final Widget? icon;
  final bool hasBorderSide;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            minimumSize: const Size(55, 55),
            shape: RoundedRectangleBorder(
              side: hasBorderSide
                  ? BorderSide(color: AppColors.kGreyColor, width: 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            backgroundColor: AppColors.kSecondaryColor.withAlpha(51),
            elevation: 0,
          ),
          child: icon ??
              Text(
                S.of(context).onboardingSkip,
                style:
                    Styles.textStyle14.copyWith(color: AppColors.kPrimaryColor),
              ),
        ),
      ),
    );
  }
}
