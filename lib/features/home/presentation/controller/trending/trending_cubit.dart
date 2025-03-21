import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/fake_loading_data.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repositories/movie_repo/movie_repo.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final MovieRepo trendingMovieRepo;
  final List<MovieModel> trendingMoviesByDay = [];
  final List<MovieModel> trendingMoviesByWeek = [];

  TrendingCubit(this.trendingMovieRepo) : super(TrendingInitial());

  Future<List<MovieModel>> fetchTrendingMoviesByDay() async {
    emit(TrendingLoading(fakeMoviesLoadingData()));
    final response = await trendingMovieRepo.fetchTrendingMoviesByDay();
    response.fold(
      (failure) {
        emit(TrendingError(failure.message));
      },
      (movies) {
        trendingMoviesByDay
          ..clear()
          ..addAll(movies.take(10));
        emit(TrendingSuccess(movies));
      },
    );
    return trendingMoviesByDay;
  }

  Future<List<MovieModel>> fetchTrendingMoviesByWeek() async {
    emit(TrendingLoading(fakeMoviesLoadingData()));
    final response = await trendingMovieRepo.fetchTrendingMoviesByWeek();
    response.fold(
      (failure) {
        emit(TrendingError(failure.message));
      },
      (movies) {
        trendingMoviesByWeek
          ..clear()
          ..addAll(movies);
        emit(TrendingSuccess(movies));
      },
    );
    return trendingMoviesByWeek;
  }
}
