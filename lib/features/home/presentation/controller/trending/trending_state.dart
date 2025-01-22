part of 'trending_cubit.dart';

sealed class TrendingState {}

final class TrendingInitial extends TrendingState {}

final class TrendingLoading extends TrendingState {}

final class TrendingSuccess extends TrendingState {
  final List<MovieModel> trendingMovies;

  TrendingSuccess(this.trendingMovies);
}

final class TrendingError extends TrendingState {
  final String message;

  TrendingError(this.message);
}
