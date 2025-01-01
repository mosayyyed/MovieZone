import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/component/widgets/custom_elevated_button.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_styles.dart';

class OnboardingFixedContainer extends StatelessWidget {
  final int currentPage;
  final PageController pageController;

  const OnboardingFixedContainer({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Movies Anywhere, Anytime',
      'Your Unlimited Movie Destination',
      'Cinema in Your Pocket',
    ];

    final descriptions = [
      'Unlock the world of entertainment with LetsSee. Stream your favorite films from wherever you are, whenever you want.',
      'Where movie magic knows no boundaries. Experience a seamless cinematic journey at your fingertips.',
      'Carry the magic of the movies with you. LetsSee lets you watch films on the go, connecting you to cinematic adventures.',
    ];

    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: AppColors.kSecondaryColor,
        ),
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titles[currentPage],
              style: Styles.boldTextStyle24.copyWith(
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              descriptions[currentPage],
              style: Styles.textStyle10.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomElevatedButton(
              text: currentPage == 2 ? 'Get Started' : 'Continue',
              backgroundColor: AppColors.kPrimaryColor,
              textColor: Colors.black,
              onPressed: () => pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInToLinear,
              ),
            ),
            const SizedBox(height: 20),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.kPrimaryColor,
                dotColor: Colors.white.withAlpha(60),
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
