import 'package:dartz/dartz.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

import '../../../../../core/errors/failures.dart';

abstract class TrendingMoviesRepo {
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMoviesByDay();
  Future<Either<Failure, List<MovieModel>>> fetchTrendingMoviesByWeek();
}
