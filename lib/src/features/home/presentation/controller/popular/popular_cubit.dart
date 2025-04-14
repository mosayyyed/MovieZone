import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/data/repositories/movie_repo/movie_repo.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final MovieRepo popularMoviesRepo;
  final List<MovieModel> popularMovies = [];

  PopularCubit(this.popularMoviesRepo) : super(PopularInitial());

  Future<List<MovieModel>> fetchPopularMovies() async {
    emit(PopularLoading(List.generate(10, (index) => MovieModel.fake())));
    final response = await popularMoviesRepo.fetchPopularMovies();
    response.fold(
      (failure) {
        emit(PopularError(failure.message));
      },
      (movies) {
        popularMovies.clear();
        popularMovies.addAll(movies);
        emit(PopularSuccess(movies));
      },
    );
    return popularMovies;
  }
}
