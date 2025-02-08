import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';

import '../../../data/models/movie_videos_model.dart';
import '../../../data/repositories/movie_details_repo/movie_details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepo movieDetailsRepo;

  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(int id) async {
    emit(MovieDetailsLoading());
    final response = await movieDetailsRepo.fetchMovieDetails(id: id);
    response.fold(
      (failure) => emit(MovieDetailsError(failure.message)),
      (movie) => emit(MovieDetailsSuccess(movie)),
    );
  }

  Future<void> fetchMovieVideos(int id) async {
    emit(MovieDetailsLoading());
    final response = await movieDetailsRepo.fetchMovieDetails(id: id);
    response.fold(
      (failure) => emit(MovieDetailsError(failure.message)),
      (movie) => emit(MovieDetailsSuccess(movie)),
    );
  }
}
