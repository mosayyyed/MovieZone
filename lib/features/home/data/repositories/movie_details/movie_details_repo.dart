import 'package:dartz/dartz.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';

import '../../../../../core/errors/failures.dart';

abstract class MovieDetailsRepo {
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(
      {required int id});
  Future<Either<Failure, MovieDetailsModel>> fetchMovieVideos(
      {required int id});
  Future<Either<Failure, MovieDetailsModel>> fetchMovieImages(
      {required int id});
  Future<Either<Failure, MovieDetailsModel>> fetchMovieCredits(
      {required int id});
}
