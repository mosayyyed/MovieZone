import 'package:flutter/material.dart';

import '../../../../../../core/themes/app_colors.dart';

class GradientOverlay extends StatelessWidget {
  const GradientOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.kSecondaryColor,
              AppColors.kSecondaryColor.withAlpha(230),
              AppColors.kSecondaryColor.withAlpha(150),
              AppColors.kSecondaryColor.withAlpha(100),
              AppColors.kSecondaryColor.withAlpha(51),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
