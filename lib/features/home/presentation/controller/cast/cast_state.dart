part of 'cast_cubit.dart';

sealed class MovieCastState {}

final class MovieCastInitial extends MovieCastState {}

final class MovieCastLoading extends MovieCastState {}

final class MovieCastSuccess extends MovieCastState {
  final List<MovieCastModel> movieCastModel;

  MovieCastSuccess(
    this.movieCastModel,
  );
}

final class MovieCastError extends MovieCastState {
  final String message;

  MovieCastError(this.message);
}
