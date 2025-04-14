import 'package:bloc/bloc.dart';

import '../../../../home/data/models/movie_model.dart';
import '../../../data/repositories/search_repo/search_movies_repo.dart';

part 'search_state.dart';

class SearchMoiveCubit extends Cubit<MovieSearchState> {
  final SearchMoviesRepo searchMovieRepo;
  final List<MovieModel> searchMovies = [];

  SearchMoiveCubit(this.searchMovieRepo) : super(MovieSearchInitial());

  Future<void> fetchMoviesByQuery(String q) async {
    emit(MovieSearchLoading());
    final response = await searchMovieRepo.fetchSearchMovies(q: q);
    response.fold(
      (failure) => emit(MovieSearchError(failure.message)),
      (cast) {
        searchMovies.clear();
        searchMovies.addAll(cast);
        emit(MovieSearchSuccess(searchMovies));
      },
    );
  }
}
