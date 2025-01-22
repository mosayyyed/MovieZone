import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../models/movie_model.dart';

abstract class TopMovieRepo {
  Future<Either<Failure, List<MovieModel>>> fetchTopMovies();
}
