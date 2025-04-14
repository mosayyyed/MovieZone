import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/genre_model.dart';
import '../../../data/repositories/movie_repo/movie_repo.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final MovieRepo movieRepo;

  final List<GenreModel> genres = [];
  GenresCubit(this.movieRepo) : super(GenresInitial());

  void fetchGenres() async {
    emit(GenresLoading());
    final response = await movieRepo.fetchGenres();
    response.fold(
      (failure) => emit(GenresError(failure.message)),
      (genres) {
        this.genres.clear();
        this.genres.addAll(genres);
        emit(GenresSuccess(genres));
      },
    );
  }
}
