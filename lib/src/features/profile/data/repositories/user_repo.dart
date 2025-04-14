import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/errors/failures.dart';
import 'package:movie_app/src/features/profile/data/models/user_model.dart';

abstract class UserRepo {
  Future<Either<Failure, UserModel?>> getUser();
  Future<Either<Failure, UserModel?>> updateUser(UserModel user);
}
