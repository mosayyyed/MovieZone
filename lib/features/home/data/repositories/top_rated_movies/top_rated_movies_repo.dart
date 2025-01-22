import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/movie_model.dart';

abstract class TopRatedMoviesRepo {
  Future<Either<Failure, List<MovieModel>>> fetchTopMovies();
}
