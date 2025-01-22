import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';

import '../../models/movie_model.dart';

abstract class PopularMoviesRepo {
  Future<Either<Failure, List<MovieModel>>> fetchPopularMovies();
}
