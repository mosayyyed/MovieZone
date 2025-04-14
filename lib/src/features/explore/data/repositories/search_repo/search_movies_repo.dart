import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../home/data/models/movie_model.dart';

abstract class SearchMoviesRepo {
  Future<Either<Failure, List<MovieModel>>> fetchSearchMovies(
      {required String q});
}
