part of 'genres_cubit.dart';

sealed class GenresState {}

final class GenresInitial extends GenresState {}

final class GenresLoading extends GenresState {}

final class GenresSuccess extends GenresState {
  final List<GenreModel> genres;

  GenresSuccess(this.genres);
}

final class GenresError extends GenresState {
  final String message;

  GenresError(this.message);
}
