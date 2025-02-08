part of 'movie_details_cubit.dart';

sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsModel movieDetailsModel;

  MovieDetailsSuccess(
    this.movieDetailsModel,
  );
}

final class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}
