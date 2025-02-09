import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/movie_details_model.dart';
import '../../models/movie_videos_model.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(
      {required int id});

  Future<Either<Failure, List<MovieVideosModel>>> fetchMovieVideos(
      {required int id});
}
