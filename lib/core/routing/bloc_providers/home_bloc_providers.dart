// home_bloc_providers.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/repositories/movie_repo/movie_repo_impl.dart';
import 'package:movie_app/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/popular/popular_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/top_rated/top_rated_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/trending/trending_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/upcoming/upcoming_cubit.dart';

import '../../../features/home/data/repositories/movie_details_repo/movie_details_repo_impl.dart';
import '../../../features/home/presentation/controller/MovieVideos/movie_videos_cubit.dart';
import '../../utils/service_locator.dart';

class HomeBlocProviders {
  static List<BlocProvider> get() {
    return [
      BlocProvider(
        create: (context) => TrendingCubit(getIt.get<MovieRepoImpl>())
          ..fetchTrendingMoviesByDay()
          ..fetchTrendingMoviesByWeek(),
      ),
      BlocProvider(
        create: (context) =>
            TopRatedCubit(getIt.get<MovieRepoImpl>())..fetchTopRatedMovies(),
      ),
      BlocProvider(
        create: (context) =>
            PopularCubit(getIt.get<MovieRepoImpl>())..fetchPopularMovies(),
      ),
      BlocProvider(
        create: (context) =>
            UpcomingCubit(getIt.get<MovieRepoImpl>())..fetchUpcomingMovies(),
      ),
      BlocProvider(
        create: (context) =>
            GenresCubit(getIt.get<MovieRepoImpl>())..fetchGenres(),
      ),
      BlocProvider(
        create: (context) =>
            MovieVideosCubit(getIt.get<MovieDetailsRepoImpl>()),
      ),
    ];
  }
}
