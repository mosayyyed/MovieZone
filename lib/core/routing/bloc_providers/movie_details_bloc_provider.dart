import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/data/repositories/movie_details_repo/movie_details_repo_impl.dart';
import '../../../features/home/presentation/controller/MovieVideos/movie_videos_cubit.dart';
import '../../../features/home/presentation/controller/cast/cast_cubit.dart';
import '../../../features/home/presentation/controller/movie_details/movie_details_cubit.dart';
import '../../utils/service_locator.dart';

class MovieDetailsBlocProvider {
  static List<BlocProvider> get() {
    return [
      BlocProvider.value(
        value: MovieVideosCubit(getIt.get<MovieDetailsRepoImpl>()),
      ),
      BlocProvider(
        create: (context) =>
            MovieDetailsCubit(getIt.get<MovieDetailsRepoImpl>()),
      ),
      BlocProvider(
        create: (context) => MovieCastCubit(getIt.get<MovieDetailsRepoImpl>()),
      ),
    ];
  }
}
