import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/controller/login/login_cubit.dart';
import 'package:movie_app/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:movie_app/features/onboarding/presentation/views/onboarding_screen.dart';

import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import '../networking/firebase_service.dart';

abstract class AppRoutes {
  static const kInitialRoute = '/';
  static const kOnboardingRoute = '/onboarding';
  static const kSignupRoute = '/signup';
  static const kLoginRoute = '/login';

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
      GoRoute(
        path: kSignupRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(AuthRepoImpl(FirebaseService(
                  FirebaseAuth.instance, FirebaseFirestore.instance))),
            ),
            BlocProvider(
              create: (context) => SignupCubit(AuthRepoImpl(FirebaseService(
                  FirebaseAuth.instance, FirebaseFirestore.instance))),
            ),
          ],
          child: const SignupScreen(),
        ),
      ),
      GoRoute(
        path: kLoginRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(AuthRepoImpl(FirebaseService(
                  FirebaseAuth.instance, FirebaseFirestore.instance))),
            ),
            BlocProvider(
              create: (context) => LoginCubit(AuthRepoImpl(FirebaseService(
                  FirebaseAuth.instance, FirebaseFirestore.instance))),
            ),
          ],
          child: const LoginScreen(),
        ),
      ),
    ],
  );
}
