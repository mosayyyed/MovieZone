import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';

import '../../../../../core/data_sources/networking/api_service.dart';
import '../../../../../core/errors/api_failure.dart';
import '../../../../../core/utils/constants.dart';
import 'movie_details_repo.dart';

class MovieDetailsRepoImpl extends MovieDetailsRepo {
  final ApiService _apiService;

  MovieDetailsRepoImpl({required ApiService apiService})
      : _apiService = apiService;

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(
      {required int id}) async {
    try {
      final response = await _apiService.get(
        endpoint: "$kBaseUrl/movie/$id",
        queryParameters: {
          "api_key": kApiKey,
          "language": "ar",
          "page": "1",
        },
      );
      return Right(response.data);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchMovieVideos(
      {required int id}) async {
    try {
      final response = await _apiService.get(
        endpoint: "$kBaseUrl/movie/$id/videos",
        queryParameters: {
          "api_key": kApiKey,
          "language": "ar",
          "page": "1",
        },
      );
      return Right(response.data);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchMovieImages(
      {required int id}) async {
    try {
      final response = await _apiService.get(
        endpoint: "$kBaseUrl/movie/$id/images",
        queryParameters: {
          "api_key": kApiKey,
          "language": "ar",
          "page": "1",
        },
      );
      return Right(response.data);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchMovieCredits(
      {required int id}) async {
    try {
      final response = await _apiService.get(
        endpoint: "$kBaseUrl/movie/$id/credits",
        queryParameters: {
          "api_key": kApiKey,
          "language": "ar",
          "page": "1",
        },
      );
      return Right(response.data);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
