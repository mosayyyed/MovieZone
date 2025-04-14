part of 'movie_videos_cubit.dart';

sealed class MovieVideosState extends Equatable {}

final class MovieVideosInitial extends MovieVideosState {
  @override
  List<Object?> get props => [];
}

final class MovieVideosLoading extends MovieVideosState {
  final List<MovieVideosModel> fakeVideosList;

  MovieVideosLoading(this.fakeVideosList);

  @override
  List<Object?> get props => [fakeVideosList];
}

final class MovieVideosSuccess extends MovieVideosState {
  final List<MovieVideosModel> movieVideosList;

  MovieVideosSuccess(
    this.movieVideosList,
  );

  @override
  List<Object?> get props => [movieVideosList];
}

final class MovieVideosError extends MovieVideosState {
  final String message;

  MovieVideosError(this.message);

  @override
  List<Object?> get props => [message];
}
