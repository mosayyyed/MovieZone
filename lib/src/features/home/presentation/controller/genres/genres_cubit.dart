import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/home/data/models/genre_model.dart';
import 'package:movie_app/src/features/home/data/repositories/movie_repo/movie_repo.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final MovieRepo movieRepo;
  final List<GenreModel> genres = [];

  GenresCubit(this.movieRepo) : super(GenresInitial()) {
    if (genres.isEmpty) {
      fetchGenres();
    }
  }

  Future<void> fetchGenres() async {
    try {
      emit(GenresLoading());
      final response = await movieRepo.fetchGenres();
      response.fold(
        (failure) => emit(GenresError(failure.message)),
        (genresList) {
          genres.clear();
          genres.addAll(genresList);
          emit(GenresSuccess(genres));
        },
      );
    } catch (e) {
      emit(GenresError(e.toString()));
    }
  }
}
