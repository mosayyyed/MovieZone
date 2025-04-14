part of 'trending_cubit.dart';

sealed class TrendingState extends Equatable {
  const TrendingState();

  @override
  List<Object> get props => [];
}

final class TrendingInitial extends TrendingState {}

final class TrendingLoading extends TrendingState {
  final List<MovieModel> fakeTrendingMovies;

  const TrendingLoading(this.fakeTrendingMovies);

  @override
  List<Object> get props => [fakeTrendingMovies];
}

final class TrendingSuccess extends TrendingState {
  final List<MovieModel> trendingMovies;

  const TrendingSuccess(this.trendingMovies);

  @override
  List<Object> get props => [trendingMovies];
}

final class TrendingError extends TrendingState {
  final String message;

  const TrendingError(this.message);

  @override
  List<Object> get props => [message];
}
