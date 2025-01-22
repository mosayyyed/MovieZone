import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie_model.dart';
import '../../../data/repositories/trending_movie/trending_movies_repo.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final TrendingMoviesRepo trendingMovieRepo;
  final List<MovieModel> trendingMovies = [];

  TrendingCubit(this.trendingMovieRepo) : super(TrendingInitial());

  Future<List<MovieModel>> fetchTrendingMoviesByDay() async {
    emit(TrendingLoading());
    final response = await trendingMovieRepo.fetchTrendingMoviesByDay();
    response.fold(
      (failure) {
        emit(TrendingError(failure.message));
      },
      (movies) {
        trendingMovies.clear();

        trendingMovies.addAll(movies.take(10));
        emit(TrendingSuccess(trendingMovies));
      },
    );
    return trendingMovies;
  }
}
