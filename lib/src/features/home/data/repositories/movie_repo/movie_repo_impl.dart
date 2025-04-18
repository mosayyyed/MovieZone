import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/errors/failures.dart';
import 'package:movie_app/src/features/home/data/models/genre_model.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/generated/l10n.dart';

import '../../../../../core/data_sources/remote/api_service/api_service.dart';
import '../../../../../core/errors/api_failure.dart';
import '../../../../../core/utils/app_constants.dart';
import 'movie_repo.dart';

class MovieRepoImpl extends MovieRepo {
  final ApiService _apiService;

  MovieRepoImpl(this._apiService);

  @override
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies() async {
    try {
      final response = await _apiService.get(
        endpoint: "/movie/popular",
        queryParameters: {
          "api_key": AppConstants.api.apiKey,
          "language": S.current.languageCode,
          "page": "1",
          "adult": "false"
        },
      );
      final List<MovieModel> movies = (response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return Right(movies);
    } catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies() async {
    try {
      final response = await _apiService.get(
        endpoint: "/movie/top_rated",
        queryParameters: {
          "api_key": AppConstants.api.apiKey,
          "language": S.current.languageCode,
          "page": "1",
          "adult": "false"
        },
      );

      final List<MovieModel> movies = (response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return Right(movies);
    } catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMoviesByDay() async {
    try {
      final response = await _apiService.get(
        endpoint: "/trending/movie/day",
        queryParameters: {
          "api_key": AppConstants.api.apiKey,
          "language": S.current.languageCode,
          "page": "1",
          "adult": "false"
        },
      );

      final List<MovieModel> movies = (response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return Right(movies);
    } catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMoviesByWeek() async {
    try {
      final response = await _apiService.get(
        endpoint: "/trending/movie/day",
        queryParameters: {
          "api_key": AppConstants.api.apiKey,
          "language": S.current.languageCode,
          "page": "1",
          "adult": "false"
        },
      );

      final List<MovieModel> movies = (response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

      return Right(movies);
    } catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> fetchUpcomingMovies() async {
    try {
      final response = await _apiService.get(
        endpoint: "/movie/upcoming",
        queryParameters: {
          "api_key": AppConstants.api.apiKey,
          "language": S.current.languageCode,
          "page": "1",
          "adult": "false"
        },
      );

      final List<MovieModel> movies = (response.data['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();

      return Right(movies);
    } catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<GenreModel>>> fetchGenres() async {
    try {
      final response = await _apiService.get(
        endpoint: "/genre/movie/list",
        queryParameters: {
          "api_key": AppConstants.api.apiKey,
          "language": S.current.languageCode,
        },
      );

      final List<GenreModel> genres = (response.data['genres'] as List)
          .map((genre) => GenreModel.fromJson(genre))
          .toList();
      return Right(genres);
    } catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
