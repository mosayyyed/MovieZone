import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_styles.dart';
import 'package:movie_app/core/utils/constants.dart';

import '../../../../core/themes/app_colors.dart';

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
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        minimumSize: const Size(55, 55),
        shape: RoundedRectangleBorder(
          side: hasBorderSide
              ? BorderSide(color: AppColors.kGreyColor, width: 1)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        backgroundColor: AppColors.kSecondaryColor,
        elevation: 5,
      ),
      child: icon ??
          Text(
            'Skip',
            style: Styles.textStyle14.copyWith(color: AppColors.kPrimaryColor),
          ),
    );
  }
}
