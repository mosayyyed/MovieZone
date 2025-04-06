part of 'genres_cubit.dart';

sealed class GenresState extends Equatable {}

final class GenresInitial extends GenresState {
  @override
  List<Object?> get props => [];
}

final class GenresLoading extends GenresState {
  @override
  List<Object?> get props => [];
}

final class GenresSuccess extends GenresState {
  final List<GenreModel> genres;

  GenresSuccess(this.genres);

  @override
  List<Object?> get props => [genres];
}

final class GenresError extends GenresState {
  final String message;

  GenresError(this.message);

  @override
  List<Object?> get props => [message];
}
