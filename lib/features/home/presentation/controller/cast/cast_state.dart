part of 'cast_cubit.dart';

sealed class MovieCastState {}

final class MovieCastInitial extends MovieCastState {}

final class MovieCastLoading extends MovieCastState {
  final List<MovieCastModel> fakeCastList;

  MovieCastLoading(this.fakeCastList);
}

final class MovieCastSuccess extends MovieCastState {
  final List<MovieCastModel> movieCastList;

  MovieCastSuccess(
    this.movieCastList,
  );
}

final class MovieCastError extends MovieCastState {
  final String message;

  MovieCastError(this.message);
}
