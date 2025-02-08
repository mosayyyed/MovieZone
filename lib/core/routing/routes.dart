import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/controller/login/login_cubit.dart';
import 'package:movie_app/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/popular/popular_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/top_rated/top_rated_cubit.dart';
import 'package:movie_app/features/home/presentation/views/screen/layout_screen.dart';
import 'package:movie_app/features/onboarding/presentation/views/onboarding_screen.dart';

import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/home/data/repositories/movie_details_repo/movie_details_repo_impl.dart';
import '../../features/home/data/repositories/movie_repo/movie_repo_impl.dart';
import '../../features/home/presentation/controller/movie_details/movie_details_cubit.dart';
import '../../features/home/presentation/controller/trending/trending_cubit.dart';
import '../../features/home/presentation/controller/upcoming/upcoming_cubit.dart';
import '../../features/home/presentation/views/screen/movie_details_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import '../data_sources/networking/firebase_service.dart';
import '../utils/service_locator.dart';

abstract class AppRoutes {
  static const kInitialRoute = '/';
  static const kOnboardingRoute = '/onboarding';
  static const kSignupRoute = '/signup';
  static const kLoginRoute = '/login';
  static const kEmailVerificationRoute = '/email-verification';
  static const kHomeRoute = '/home';
  static const kMovieDetailsRoute = '/movieDetails/:id';

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
        ),
      ),
      GoRoute(
        path: kMovieDetailsRoute,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              MovieDetailsCubit(getIt.get<MovieDetailsRepoImpl>()),
          child: MovieDetailsScreen(
              movieId: int.parse(state.pathParameters['id']!)),
        ),
      ),
      GoRoute(
        path: kHomeRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TrendingCubit(getIt.get<MovieRepoImpl>())
                ..fetchTrendingMoviesByDay()
                ..fetchTrendingMoviesByWeek(),
            ),
            BlocProvider(
              create: (context) => TopRatedCubit(getIt.get<MovieRepoImpl>())
                ..fetchTopRatedMovies(),
            ),
            BlocProvider(
              create: (context) => PopularCubit(getIt.get<MovieRepoImpl>())
                ..fetchPopularMovies(),
            ),
            BlocProvider(
              create: (context) => UpcomingCubit(getIt.get<MovieRepoImpl>())
                ..fetchUpcomingMovies(),
            ),
          ],
          child: LayoutScreen(),
        ),
      ),
    ],
  );
}
