import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          final user = FirebaseAuth.instance.currentUser;
          if (user == null) {
            return GoRouter.of(context).go(AppRoutes.kOnboardingRoute);
          }
          return GoRouter.of(context).go(AppRoutes.kHomeRoute);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/movieisme-logo.svg',
              width: 150,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
