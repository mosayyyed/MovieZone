import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie_model.dart';
import '../../../data/repositories/top_rated_movies/top_rated_movies_repo.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final TopRatedMoviesRepo topRatedMoviesRepo;
  final List<MovieModel> topRatedMovies = [];

  TopRatedCubit(this.topRatedMoviesRepo) : super(TopRatedInitial());

  Future<List<MovieModel>> fetchTopRatedMovies() async {
    emit(TopRatedLoading());
    final response = await topRatedMoviesRepo.fetchTopMovies();
    response.fold(
      (failure) {
        emit(TopRatedError(failure.message));
      },
      (movies) {
        topRatedMovies.clear();
        topRatedMovies.addAll(movies);
        emit(TopRatedSuccess(topRatedMovies));
      },
    );
    return topRatedMovies;
  }
}
