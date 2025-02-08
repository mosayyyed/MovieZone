import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/home/data/models/movie_details_model.dart';

import '../../../../../core/data_sources/networking/api_service.dart';
import '../../../../../core/utils/constants.dart';
import '../../models/movie_videos_model.dart';
import 'movie_details_repo.dart';

class MovieDetailsRepoImpl extends MovieDetailsRepo {
  final ApiService _apiService;

  MovieDetailsRepoImpl(this._apiService);

  @override
  Future<Either<Failure, MovieDetailsModel>> fetchMovieDetails(
      {required int id}) async {
    var response = await _apiService.get(
      endpoint: "/movie/$id",
      queryParameters: {
        "api_key": kApiKey,
        "language": "ar",
      },
    );
    final movieDetails = MovieDetailsModel.fromJson(response.data);

    return Right(movieDetails);
  }

  @override
  Future<Either<Failure, MovieVideosModel>> fetchMovieVideos(
      {required int id}) async {
    var response = await _apiService.get(
      endpoint: "/movie/$id/videos",
      queryParameters: {
        "api_key": kApiKey,
      },
    );
    final movieVideos = MovieVideosModel.fromJson(response.data);
    return Right(movieVideos);
  }
}
