import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/utils/constants.dart';

import '../../../../core/themes/app_colors.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.pageController,
  });
  final PageController pageController;

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
          onPressed: () {
            pageController.animateToPage(
              2,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadius),
            ),
            backgroundColor: AppColors.kSecondaryColor,
          ),
          child: Text(
            'Skip',
            style: TextStyle(color: AppColors.kPrimaryColor),
          ),
        ));
  }
}
