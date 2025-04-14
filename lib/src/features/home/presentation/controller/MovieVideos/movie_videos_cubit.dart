import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movie_videos_model.dart';
import '../../../data/repositories/movie_details_repo/movie_details_repo.dart';

part 'movie_videos_state.dart';

class MovieVideosCubit extends Cubit<MovieVideosState> {
  final List<MovieVideosModel> videosList = [];
  final MovieDetailsRepo movieDetailsRepo;

  MovieVideosCubit(this.movieDetailsRepo) : super(MovieVideosInitial());

  Future<void> fetchMovieVideos(int id) async {
    emit(MovieVideosLoading(fakeVideos()));
    final response = await movieDetailsRepo.fetchMovieVideos(id: id);
    response.fold(
      (failure) => emit(MovieVideosError(failure.message)),
      (videos) {
        videosList.clear();
        videosList.addAll(videos);
        emit(MovieVideosSuccess(videos));
      },
    );
  }

  List<MovieVideosModel> fakeVideos() {
    return [
      MovieVideosModel(
        key: "key",
        name: "Video Name",
        official: false,
        type: "Trailer",
      ),
    ];
  }
}
