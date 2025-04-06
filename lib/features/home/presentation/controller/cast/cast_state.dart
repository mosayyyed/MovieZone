part of 'cast_cubit.dart';

sealed class MovieCastState extends Equatable {}

final class MovieCastInitial extends MovieCastState {
  @override
  List<Object?> get props => [];
}

final class MovieCastLoading extends MovieCastState {
  final List<MovieCastModel> fakeCastList;

  MovieCastLoading(this.fakeCastList);

  @override
  List<Object?> get props => [fakeCastList];
}

final class MovieCastSuccess extends MovieCastState {
  final List<MovieCastModel> movieCastList;

  MovieCastSuccess(
    this.movieCastList,
  );

  @override
  List<Object?> get props => [movieCastList];
}

final class MovieCastError extends MovieCastState {
  final String message;

  MovieCastError(this.message);

  @override
  List<Object?> get props => [message];
}
