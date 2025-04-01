import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/errors/failures.dart';
import 'package:movie_app/core/errors/firebase_failure.dart';
import 'package:movie_app/features/profile/data/models/user_model.dart';
import 'package:movie_app/features/profile/data/repositories/user_repo.dart';

class UserRepoImpl implements UserRepo {
  final FirebaseFirestore _firestore;

  UserRepoImpl(this._firestore);

  @override
  Future<Either<Failure, UserModel?>> getUser({required String userId}) async {
    try {
      var doc = await _firestore.collection('users').doc(userId).get();

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
}
