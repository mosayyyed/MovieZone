import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

import '../../../../../core/data_sources/remote/api_service/api_service.dart';
import '../../../../../core/errors/api_failure.dart';
import '../../../../../core/utils/app_constants.dart';
import 'search_movies_repo.dart';

class SearchMoviesRepoImpl extends SearchMoviesRepo {
  final ApiService _apiService;
  SearchMoviesRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchSearchMovies(
      {required String q}) async {
    try {
      final response = await _apiService.get(
        endpoint: "/search/movie",
        queryParameters: {
          "api_key": kApiKey,
          "query": q,
          "include_adult": "false",
          "language": "ar",
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
