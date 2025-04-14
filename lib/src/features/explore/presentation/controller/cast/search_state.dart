part of 'search_cubit.dart';

sealed class MovieSearchState {}

final class MovieSearchInitial extends MovieSearchState {}

final class MovieSearchLoading extends MovieSearchState {}

final class MovieSearchSuccess extends MovieSearchState {
  final List<MovieModel> movies;

  MovieSearchSuccess(this.movies);
}

final class MovieSearchError extends MovieSearchState {
  final String message;

  MovieSearchError(this.message);
}
