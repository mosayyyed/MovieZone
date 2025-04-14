import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/src/features/profile/data/models/user_model.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, Unit>> verifyEmail();

  Future<Either<Failure, Unit>> forgetPassword(String email);

  Future<Either<Failure, Unit>> signOut();

  Future<Either<Failure, User?>> getCurrentUser();

  Future<Either<Failure, Unit>> createUser({required UserModel userModel});

  Future<Either<Failure, UserModel?>> getUser({required String token});

  Future<Either<Failure, bool>> isEmailVerified();
}
