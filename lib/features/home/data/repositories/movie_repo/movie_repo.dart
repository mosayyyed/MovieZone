import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/movie_details_model.dart';
import '../../models/movie_model.dart';

abstract class MovieRepo {
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
  Future<Either<Failure, List<MovieModel>>> fetchTopRatedMovies();
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMoviesByDay();
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMoviesByWeek();
  Future<Either<Failure, List<MovieModel>>> fetchUpcomingMovies();
}
