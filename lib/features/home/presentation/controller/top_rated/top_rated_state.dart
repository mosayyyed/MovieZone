part of 'top_rated_cubit.dart';

sealed class TopRatedState {}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedSuccess extends TopRatedState {

  final List<MovieModel> topRatedMovies;

  TopRatedSuccess(this.topRatedMovies);
}

final class TopRatedError extends TopRatedState {
  final String message;

  TopRatedError(this.message);
}
