import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
}
