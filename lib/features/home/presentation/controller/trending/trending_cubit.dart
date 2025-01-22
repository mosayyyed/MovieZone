import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie_model.dart';
import '../../../data/repositories/trending_movies/trending_movies_repo.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final TrendingMoviesRepo trendingMovieRepo;
  final List<MovieModel> trendingMoviesByDay = [];
  final List<MovieModel> trendingMoviesByWeek = [];

  TrendingCubit(this.trendingMovieRepo) : super(TrendingInitial());

  Future<List<MovieModel>> fetchTrendingMoviesByDay() async {
    emit(TrendingLoading());
    final response = await trendingMovieRepo.fetchTrendingMoviesByDay();
    response.fold(
      (failure) {
        emit(TrendingError(failure.message));
      },
      (movies) {
        trendingMoviesByDay.clear();

        trendingMoviesByDay.addAll(movies.take(10));
        emit(TrendingSuccess(trendingMoviesByDay));
      },
    );
    return trendingMoviesByDay;
  }

  Future<List<MovieModel>> fetchTrendingMoviesByWeek() async {
    emit(TrendingLoading());
    final response = await trendingMovieRepo.fetchTrendingMoviesByDay();
    response.fold(
      (failure) {
        emit(TrendingError(failure.message));
      },
      (movies) {
        trendingMoviesByWeek.clear();

        trendingMoviesByWeek.addAll(movies);
        emit(TrendingSuccess(trendingMoviesByWeek));
      },
    );
    return trendingMoviesByWeek;
  }
}
