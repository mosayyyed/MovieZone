import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/themes/app_assets.dart';

import '../../../../core/routing/routes.dart';
import '../ui/onboarding_fixed_container.dart';
import '../ui/onboarding_page.dart';
import '../ui/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              OnboardingPage(imageAsset: AppAssets.onboarding.onboarding1),
              OnboardingPage(imageAsset: AppAssets.onboarding.onboarding2),
              OnboardingPage(imageAsset: AppAssets.onboarding.onboarding3),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: SkipButton(
                hasBorderSide: true,
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRoutes.kLoginRoute);
                },
              ),
            ),
          ),
          OnboardingFixedContainer(
            currentPage: _currentPage,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
