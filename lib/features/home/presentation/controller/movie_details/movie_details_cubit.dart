import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';
import 'package:movie_app/features/home/data/repositories/movie_details/movie_details_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  final MovieDetailsRepo movieDetailsRepo;

  MovieDetailsCubit(this.movieDetailsRepo) : super(MovieDetailsInitial());

  Future fetchMovieDetails({required int id}) async {
    emit(MovieDetailsLoading());
    final response = await movieDetailsRepo.fetchMovieDetails(id: id);
    response.fold(
      (failure) {
        emit(MovieDetailsError(failure.message));
      },
      (movie) {
        emit(MovieDetailsSuccess(movie));
      },
    );
  }
}
