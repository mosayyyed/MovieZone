import 'package:bloc/bloc.dart';

import '../../../../../core/utils/fake_loading_data.dart';
import '../../../data/models/movie_cast_model.dart';
import '../../../data/repositories/movie_details_repo/movie_details_repo.dart';

part 'cast_state.dart';

class MovieCastCubit extends Cubit<MovieCastState> {
  final MovieDetailsRepo movieDetailsRepo;
  final List<MovieCastModel> castList = [];

  MovieCastCubit(this.movieDetailsRepo) : super(MovieCastInitial());

  Future<void> fetchMovieCast(int id) async {
    emit(MovieCastLoading(fakeCastLoadingData()));
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
