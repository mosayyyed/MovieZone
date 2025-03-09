import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/fake_loading_data.dart';
import '../../../data/models/movie_model.dart';
import '../../../data/repositories/movie_repo/movie_repo.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  final MovieRepo movieRepo;
  final List<MovieModel> upcomingMovies = [];

  UpcomingCubit(this.movieRepo) : super(UpcomingInitial());

  Future<List<MovieModel>> fetchUpcomingMovies() async {
    emit(UpcomingLoading(fakeMoviesLoadingData()));
    final response = await movieRepo.fetchUpcomingMovies();
    response.fold(
      (failure) {
        emit(UpcomingError(failure.message));
      },
      (movies) {
        upcomingMovies.clear();
        upcomingMovies.addAll(movies);
        emit(UpcomingSuccess(movies));
      },
    );
    return upcomingMovies;
  }
}
