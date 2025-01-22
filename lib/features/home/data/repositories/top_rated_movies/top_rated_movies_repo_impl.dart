import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

import '../../../../../core/data_sources/networking/api_service.dart';
import '../../../../../core/errors/api_failure.dart';
import '../../../../../core/utils/constants.dart';
import 'top_rated_movies_repo.dart';

class TopRatedMoviesRepoImpl extends TopRatedMoviesRepo {
  final ApiService _apiService;

  TopRatedMoviesRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopMovies() async {
    try {
      final response = await _apiService.get(
        endpoint: "$kBaseUrl/movie/top_rated",
        queryParameters: {
          "api_key": kApiKey,
          "language": "ar",
          "page": "1",
        },
      );

      final List<MovieModel> movies = (response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return Right(movies);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
