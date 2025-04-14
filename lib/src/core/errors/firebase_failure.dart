import 'package:firebase_core/firebase_core.dart';

import '../../../generated/l10n.dart';
import 'failures.dart';

class FirebaseFailure extends Failure {
  const FirebaseFailure(super.message);

  factory FirebaseFailure.fromFirebaseException(dynamic e) {
    String errorMessage = _getErrorMessage(e);
    return FirebaseFailure(errorMessage);
  }

  static String _getErrorMessage(dynamic e) {
    if (e is FirebaseException) {
      switch (e.code) {
        case 'network-request-failed':
          return S.current.networkRequestFailed;
        case 'wrong-password':
          return S.current.wrongPassword;
        case 'invalid-credential':
          return S.current.invalidCredential;
        case 'invalid-email':
          return S.current.invalidEmail;
        case 'user-disabled':
          return S.current.userDisabled;
        case 'user-not-found':
          return S.current.userNotFound;
        case 'email-already-in-use':
          return S.current.emailAlreadyInUse;
        case 'operation-not-allowed':
          return S.current.operationNotAllowed;
        case 'weak-password':
          return S.current.weakPassword;
        case 'too-many-requests':
          return S.current.tooManyRequests;
        default:
          return e.message ?? S.current.unknownError;
      }
    } else {
      return e.toString();
    }
  }
}
