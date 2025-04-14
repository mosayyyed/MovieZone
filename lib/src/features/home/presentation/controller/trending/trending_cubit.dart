import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/data/repositories/movie_repo/movie_repo.dart';

part 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  final MovieRepo trendingMovieRepo;
  final List<MovieModel> trendingMoviesByDay = [];
  final List<MovieModel> trendingMoviesByWeek = [];

  TrendingCubit(this.trendingMovieRepo) : super(TrendingInitial());

  Future<List<MovieModel>> fetchTrendingMoviesByDay() async {
    emit(TrendingLoading(List.generate(10, (index) => MovieModel.fake())));
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
    emit(TrendingLoading(List.generate(10, (index) => MovieModel.fake())));
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
