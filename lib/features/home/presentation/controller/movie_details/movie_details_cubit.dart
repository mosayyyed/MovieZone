import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';

import '../../../../../core/utils/fake_loading_data.dart';
import '../../../data/repositories/movie_details_repo/movie_details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  late final MovieDetailsModel movieDetailsModel;
  final MovieDetailsRepo movieDetailsRepo;

  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());

  Future<void> fetchMovieDetails(int id) async {
    emit(MovieDetailsLoading(fakeMovieDetailsLoadingData()));
    final response = await movieDetailsRepo.fetchMovieDetails(id: id);
    response.fold(
      (failure) => emit(MovieDetailsError(failure.message)),
      (movie) {
        movieDetailsModel = movie;
        emit(MovieDetailsSuccess(movie));
      },
    );
  }
}
