import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:movie_app/features/auth/presentation/controller/login/login_cubit.dart';
import 'package:movie_app/features/auth/presentation/controller/signup/signup_cubit.dart';
import 'package:movie_app/features/home/presentation/views/screen/layout_screen.dart';
import 'package:movie_app/features/onboarding/presentation/views/onboarding_screen.dart';

import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/presentation/views/email_verificationScreen.dart';
import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/signup_screen.dart';
import '../../features/explore/data/repositories/search_repo/search_movies_repo_impl.dart';
import '../../features/explore/presentation/controller/cast/search_cubit.dart';
import '../../features/explore/presentation/views/screen/explore_screen.dart';
import '../../features/home/data/repositories/movie_details_repo/movie_details_repo_impl.dart';
import '../../features/home/data/repositories/movie_repo/movie_repo_impl.dart';
import '../../features/home/presentation/controller/MovieVideos/movie_videos_cubit.dart';
import '../../features/home/presentation/controller/cast/cast_cubit.dart';
import '../../features/home/presentation/controller/genres/genres_cubit.dart';
import '../../features/home/presentation/controller/movie_details/movie_details_cubit.dart';
import '../../features/home/presentation/controller/popular/popular_cubit.dart';
import '../../features/home/presentation/controller/top_rated/top_rated_cubit.dart';
import '../../features/home/presentation/controller/trending/trending_cubit.dart';
import '../../features/home/presentation/controller/upcoming/upcoming_cubit.dart';
import '../../features/home/presentation/views/screen/movie_details_screen.dart';
import '../../features/splash/presentation/views/splash_screen.dart';
import '../utils/service_locator.dart';

abstract class AppRoutes {
  static const kInitialRoute = '/';
  static const kOnboardingRoute = '/onboarding';
  static const kSignupRoute = '/signup';
  static const kLoginRoute = '/login';
  static const kEmailVerificationRoute = '/email-verification';
  static const kHomeRoute = '/home';
  static const kMovieDetailsRoute = '/movieDetails/:id';
  static const kSearchRoute = '/search';

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
            BlocProvider.value(
              value: state.extra as AuthCubit,
            ),
            BlocProvider(
              create: (context) => SignupCubit(getIt.get<AuthRepoImpl>()),
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
              create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
            ),
            BlocProvider(
              create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
            ),
          ],
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: kEmailVerificationRoute,
        builder: (context, state) => BlocProvider.value(
          value: state.extra as AuthCubit,
          child: const EmailVerificationScreen(),
        ),
      ),
      GoRoute(
        path: kMovieDetailsRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: MovieVideosCubit(getIt.get<MovieDetailsRepoImpl>())
                ..fetchMovieVideos(int.parse(state.pathParameters['id']!)),
            ),
            BlocProvider(
              create: (context) =>
                  MovieDetailsCubit(getIt.get<MovieDetailsRepoImpl>())
                    ..fetchMovieDetails(int.parse(state.pathParameters['id']!)),
            ),
            BlocProvider(
              create: (context) =>
                  MovieCastCubit(getIt.get<MovieDetailsRepoImpl>())
                    ..fetchMovieCast(
                      int.parse(state.pathParameters['id']!),
                    ),
            ),
          ],
          child: MovieDetailsScreen(
            movieId: int.parse(state.pathParameters['id']!),
          ),
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
            BlocProvider(
              create: (context) =>
                  GenresCubit(getIt.get<MovieRepoImpl>())..fetchGenres(),
            ),
            BlocProvider(
              create: (context) =>
                  MovieVideosCubit(getIt.get<MovieDetailsRepoImpl>()),
            ),
          ],
          child: LayoutScreen(),
        ),
      ),
      GoRoute(
        path: kSearchRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    SearchMoiveCubit(getIt.get<SearchMoviesRepoImpl>())),
            BlocProvider.value(value: GenresCubit(getIt.get<MovieRepoImpl>())),
            BlocProvider.value(
                value: TrendingCubit(getIt.get<MovieRepoImpl>())),
          ],
          child: ExploreScreen(),
        ),
      ),
    ],
  );
}
