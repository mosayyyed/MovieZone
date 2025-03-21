import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/fake_loading_data.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repositories/movie_repo/movie_repo.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final MovieRepo movieRepo;
  final List<MovieModel> topRatedMovies = [];

  TopRatedCubit(this.movieRepo) : super(TopRatedInitial());

  Future<List<MovieModel>> fetchTopRatedMovies() async {
    emit(TopRatedLoading(fakeMoviesLoadingData()));
    final response = await movieRepo.fetchTopRatedMovies();
    response.fold(
      (failure) {
        emit(TopRatedError(failure.message));
      },
      (movies) {
        topRatedMovies
          ..clear()
          ..addAll(movies);
        emit(TopRatedSuccess(topRatedMovies));
      },
    );
    return topRatedMovies;
  }
}
