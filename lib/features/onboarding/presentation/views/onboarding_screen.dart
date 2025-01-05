import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../widgets/onboarding_fixed_container.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/skip_button.dart';

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
      backgroundColor: AppColors.kSecondaryColor,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            children: [
              OnboardingPage(imageAsset: 'assets/onboarding.png'),
              OnboardingPage(imageAsset: 'assets/onboarding1.jpg'),
              OnboardingPage(imageAsset: 'assets/background.png'),
            ],
          ),
          SkipButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRoutes.kLoginRoute);
            },
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
