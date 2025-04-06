part of 'movie_details_cubit.dart';

sealed class MovieDetailsState extends Equatable {}

final class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object?> get props => [];
}

final class MovieDetailsLoading extends MovieDetailsState {
  final MovieDetailsModel fakeMovieDetailsModel;

  MovieDetailsLoading(this.fakeMovieDetailsModel);

  @override
  List<Object?> get props => [fakeMovieDetailsModel];
}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetailsModel movieDetailsModel;

  MovieDetailsSuccess(this.movieDetailsModel);

  @override
  List<Object?> get props => [movieDetailsModel];
}

final class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
