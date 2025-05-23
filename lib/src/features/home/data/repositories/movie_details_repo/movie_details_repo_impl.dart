import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/errors/failures.dart';
import 'package:movie_app/src/features/home/data/models/movie_cast_model.dart';
import 'package:movie_app/src/features/home/data/models/movie_details_model.dart';

import '../../../../../core/data_sources/remote/api_service/api_service.dart';
import '../../../../../core/errors/api_failure.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../models/movie_videos_model.dart';
import 'movie_details_repo.dart';
import 'package:movie_app/generated/l10n.dart';

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
          "api_key": AppConstants.api.apiKey,
          "language": S.current.languageCode,
        },
      );
      final movieDetails = MovieDetailsModel.fromJson(response.data);
      return Right(movieDetails);
    } catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MovieVideosModel>>> fetchMovieVideos(
      {required int id}) async {
    try {
      var response = await _apiService.get(
        endpoint: "/movie/$id/videos",
        queryParameters: {
          "api_key": AppConstants.api.apiKey,
        },
      );
      final videos = (response.data['results'] as List)
          .map((video) => MovieVideosModel.fromJson(video))
          .toList();
      return Right(videos);
    } catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MovieCastModel>>> fetchMovieCast(
      {required int id}) async {
    try {
      var response = await _apiService.get(
        endpoint: "/movie/$id/credits",
        queryParameters: {
          "api_key": AppConstants.api.apiKey,
        },
      );

      final cast = (response.data['cast'] as List)
          .map((cast) => MovieCastModel.fromJson(cast))
          .toList();

      return Right(cast);
    } catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
