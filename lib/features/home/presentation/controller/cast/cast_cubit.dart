import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_cast_model.dart';
import 'package:movie_app/features/home/data/repositories/movie_details_repo/movie_details_repo.dart';

part 'cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  final MovieDetailsRepo movieDetailsRepo;
  final List<MovieCastModel> castList = [];

  MovieCastCubit(this.movieDetailsRepo) : super(MovieCastInitial());

  Future<void> fetchMovieCast(int id) async {
    emit(MovieCastLoading(List.generate(
      10,
      (index) => MovieCastModel.fake(),
    )));
    final response = await movieDetailsRepo.fetchMovieCast(id: id);
    response.fold(
      (failure) => emit(MovieCastError(failure.message)),
      (cast) {
        castList.clear();
        castList.addAll(cast);
        emit(MovieCastSuccess(cast));
      },
    );
  }
}
