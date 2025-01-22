import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/data_sources/networking/api_service.dart';
import 'package:movie_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/controller/login/login_cubit.dart';
import 'package:movie_app/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:movie_app/features/home/data/repositories/popular_movies/popular_movies_repo_impl.dart';
import 'package:movie_app/features/home/presentation/controller/popular/popular_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/top_rated/top_rated_cubit.dart';
import 'package:movie_app/features/home/presentation/views/screen/layout_screen.dart';
import 'package:movie_app/features/onboarding/presentation/views/onboarding_screen.dart';

import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/presentation/views/email_verificationScreen.dart';
import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/home/data/repositories/top_rated_movies/top_rated_movies_repo_impl.dart';
import '../../features/home/data/repositories/trending_movies/trending_movies_repo_impl.dart';
import '../../features/home/presentation/controller/trending/trending_cubit.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import '../data_sources/networking/firebase_service.dart';

abstract class AppRoutes {
  static const kInitialRoute = '/';
  static const kOnboardingRoute = '/onboarding';
  static const kSignupRoute = '/signup';
  static const kLoginRoute = '/login';
  static const kEmailVerificationRoute = '/email-verification';
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
      GoRoute(
        path: kEmailVerificationRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(AuthRepoImpl(FirebaseService(
              FirebaseAuth.instance, FirebaseFirestore.instance))),
          child: EmailVerificationScreen(),
        ),
      ),
      GoRoute(
        path: kHomeRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  TrendingCubit(TrendingMoviesRepoImpl(ApiService(Dio())))
                    ..fetchTrendingMoviesByDay()
                    ..fetchTrendingMoviesByWeek(),
            ),
            BlocProvider(
              create: (context) =>
                  TopRatedCubit(TopRatedMoviesRepoImpl(ApiService(Dio())))
                    ..fetchTopRatedMovies(),
            ),
            BlocProvider(
              create: (context) =>
                  PopularCubit(PopularMoviesRepoImpl(ApiService(Dio())))
                    ..fetchPopularMovies(),
            ),
          ],
          child: LayoutScreen(),
        ),
      ),
    ],
  );
}
