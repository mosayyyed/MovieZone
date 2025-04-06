import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/errors/firebase_failure.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/data/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  UserRepoImpl(this._firestore, this._auth);

  @override
  Future<Either<Failure, UserModel?>> getUser() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return Left(FirebaseFailure("لم يتم تسجيل الدخول"));
      }

      var doc = await _firestore.collection('users').doc(currentUser.uid).get();

      if (!doc.exists) {
        return Right(null);
      }

      var userData = doc.data();
      if (userData == null) {
        return Right(null);
      }

      var user = UserModel.fromMap(userData);
      return Right(user);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> updateUser(UserModel user) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) {
        return Left(FirebaseFailure("لم يتم تسجيل الدخول"));
      }

      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .update(user.toMap());
      return Right(user);
    } catch (error) {
      return Left(FirebaseFailure.fromFirebaseException(error));
    }
  }
}
