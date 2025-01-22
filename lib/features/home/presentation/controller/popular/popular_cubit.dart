import 'package:bloc/bloc.dart';
import 'package:movie_app/features/home/data/repositories/popular_movies/popular_movies_repo.dart';

import '../../../data/models/movie_model.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final PopularMoviesRepo popularMoviesRepo;
  final List<MovieModel> popularMovies = [];

  PopularCubit(this.popularMoviesRepo) : super(PopularInitial());

  Future<List<MovieModel>> fetchPopularMovies() async {
    emit(PopularLoading());
    final response = await popularMoviesRepo.fetchPopularMovies();
    response.fold(
      (failure) {
        emit(PopularError(failure.message));
      },
      (movies) {
        popularMovies.clear();
        popularMovies.addAll(movies);
        emit(PopularSuccess(popularMovies));
      },
    );
    return popularMovies;
  }
}
