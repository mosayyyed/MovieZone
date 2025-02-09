part of 'movie_videos_cubit.dart';

sealed class MovieVideosState {}

final class MovieVideosInitial extends MovieVideosState {}

final class MovieVideosLoading extends MovieVideosState {}

final class MovieVideosSuccess extends MovieVideosState {
  final List<MovieVideosModel> movieVideosModel;

  MovieVideosSuccess(
    this.movieVideosModel,
  );
}

final class MovieVideosError extends MovieVideosState {
  final String message;

  MovieVideosError(this.message);
}
