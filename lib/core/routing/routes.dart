import 'package:go_router/go_router.dart';
import 'package:movie_app/features/onboarding/presentation/views/onboarding_screen.dart';

import '../../features/splash/presentation/views/splash_screen.dart';

abstract class AppRoutes {
  static const kInitialRoute = '/';
  static const kOnboardingRoute = '/onboarding';
  static const kHomeRoute = '/home';
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kInitialRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kOnboardingRoute,
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
  );
}
