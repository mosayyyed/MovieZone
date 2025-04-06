part of 'popular_cubit.dart';

sealed class PopularState extends Equatable {}

final class PopularInitial extends PopularState {
  @override
  List<Object?> get props => [];
}

final class PopularLoading extends PopularState {
  final List<MovieModel> fakePopularMovies;

  PopularLoading(this.fakePopularMovies);

  @override
  List<Object?> get props => [fakePopularMovies];
}

final class PopularSuccess extends PopularState {
  final List<MovieModel> popularMovies;

  PopularSuccess(this.popularMovies);

  @override
  List<Object?> get props => [popularMovies];
}

final class PopularError extends PopularState {
  final String message;

  PopularError(this.message);

  @override
  List<Object?> get props => [message];
}
