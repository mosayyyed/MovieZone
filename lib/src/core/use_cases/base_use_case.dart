import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/src/core/errors/failures.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<Either<Failure, T>> execute([Parameters params]);
}

class NoParameters extends Equatable {
  @override
  List<Object?> get props => [];
}
