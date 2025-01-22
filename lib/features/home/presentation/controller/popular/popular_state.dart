part of 'popular_cubit.dart';

sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularLoading extends PopularState {}

final class PopularSuccess extends PopularState {
  final List<MovieModel> popularMovies;

  PopularSuccess(this.popularMovies);
}

final class PopularError extends PopularState {
  final String message;

  PopularError(this.message);
}
