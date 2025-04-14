part of 'top_rated_cubit.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {
  final List<MovieModel> fakeTopRatedMovies;

  const TopRatedLoading(this.fakeTopRatedMovies);

  @override
  List<Object> get props => [fakeTopRatedMovies];
}

final class TopRatedSuccess extends TopRatedState {
  final List<MovieModel> topRatedMovies;

  const TopRatedSuccess(this.topRatedMovies);

  @override
  List<Object> get props => [topRatedMovies];
}

final class TopRatedError extends TopRatedState {
  final String message;

  const TopRatedError(this.message);

  @override
  List<Object> get props => [message];
}
