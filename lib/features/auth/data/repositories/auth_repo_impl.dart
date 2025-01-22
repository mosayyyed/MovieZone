import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/data_sources/networking/firebase_service.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/firebase_failure.dart';
import '../models/user_model.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseService _firebaseService;

  AuthRepoImpl(this._firebaseService);

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var response = await _firebaseService.signIn(email, password);
      return Right(response);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }

  @override
  Future<Either<Failure, User?>> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var response = await _firebaseService.signUp(email, password);
      return Right(response);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword(String email) async {
    try {
      await _firebaseService.forgetPassword(email);
      return const Right(unit);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _firebaseService.signOut();
      return const Right(unit);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyEmail() async {
    try {
      await _firebaseService.sendEmailVerification();
      return const Right(unit);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      final response = _firebaseService.getCurrentUser();
      return Right(response);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }

  @override
  Future<Either<Failure, Unit>> createUser(
      {required UserModel userModel}) async {
    try {
      await _firebaseService.createUser(userModel);
      return const Right(unit);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> getUser({required String token}) async {
    try {
      var response = await _firebaseService.getUser(token);
      return Right(response);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }

  @override
  Future<Either<Failure, bool>> isEmailVerified() async {
    try {
      final isVerified = await _firebaseService.isEmailVerified();
      return Right(isVerified);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }
}
