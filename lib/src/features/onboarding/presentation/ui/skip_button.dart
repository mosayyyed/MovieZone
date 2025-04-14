import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/src/core/themes/app_values.dart';

import '../../../../../generated/l10n.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    this.onPressed,
    this.icon,
    this.hasBorderSide = false,
    this.minimumSize = const Size(55, 55),
  });

  final void Function()? onPressed;
  final Widget? icon;
  final bool hasBorderSide;
  final Size minimumSize;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSize.s12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            minimumSize: minimumSize,
            shape: RoundedRectangleBorder(
              side: hasBorderSide
                  ? BorderSide(color: Colors.grey, width: 1)
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(AppSize.s12),
            ),
            backgroundColor:
                Theme.of(context).colorScheme.onSurface.withAlpha(51),
            elevation: 0,
          ),
          child: icon ??
              Text(
                S.of(context).onboardingSkip,
                style: Styles.textStyle14.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
        ),
      ),
    );
  }
}
