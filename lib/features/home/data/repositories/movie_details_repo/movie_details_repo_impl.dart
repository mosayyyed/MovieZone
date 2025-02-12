import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/home/data/models/movie_cast_model.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';

import '../../../../../core/data_sources/networking/api_service.dart';
import '../../../../../core/errors/api_failure.dart';
import '../../../../../core/utils/constants.dart';
import '../../models/movie_videos_model.dart';
import 'movie_details_repo.dart';

class MovieDetailsRepoImpl extends MovieDetailsRepo {
  final ApiService _apiService;
  MovieDetailsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(
      {required int id}) async {
    try {
      var response = await _apiService.get(
        endpoint: "/movie/$id",
        queryParameters: {
          "api_key": kApiKey,
          "language": "ar",
        },
      );
      final movieDetails = MovieDetailsModel.fromJson(response.data);
      return Right(movieDetails);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieVideosModel>>> fetchMovieVideos(
      {required int id}) async {
    try {
      var response = await _apiService.get(
        endpoint: "/movie/$id/videos",
        queryParameters: {
          "api_key": kApiKey,
        },
      );
      final videos = (response.data['results'] as List)
          .map((video) => MovieVideosModel.fromJson(video))
          .toList();
      return Right(videos);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieCastModel>>> fetchMovieCast(
      {required int id}) async {
    try {
      var response = await _apiService.get(
        endpoint: "/movie/$id/credits",
        queryParameters: {
          "api_key": kApiKey,
        },
      );

      final cast = (response.data['cast'] as List)
          .map((cast) => MovieCastModel.fromJson(cast))
          .toList();

      return Right(cast);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
