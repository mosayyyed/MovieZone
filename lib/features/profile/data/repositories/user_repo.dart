import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';

abstract class UserRepo {
  Future<Either<Failure, UserModel?>> getUser({required String userId});
}
