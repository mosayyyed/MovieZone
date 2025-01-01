// import 'package:firebase_core/firebase_core.dart';
//
// abstract class Failure {
//   final String message;
//
//   const Failure(this.message);
// }
//
// class ServerFailure extends Failure {
//   const ServerFailure(super.message);
//
//   factory ServerFailure.fromFirebaseException(dynamic e) {
//     String errorMessage = _getErrorMessage(e);
//     return ServerFailure(errorMessage);
//   }
//
//   static String _getErrorMessage(dynamic e) {
//     if (e is FirebaseException) {
//       switch (e.code) {
//         case 'network-request-failed':
//           return 'Network error: Please check your internet connection.';
//         case 'permission-denied':
//           return 'Permission denied: You do not have access to this resource.';
//         case 'not-found':
//           return 'Resource not found: The requested document does not exist.';
//         case 'unavailable':
//           return 'Service unavailable: Please try again later.';
//         case 'aborted':
//           return 'Request aborted: The operation was canceled.';
//         case 'already-exists':
//           return 'Conflict: The resource you are trying to create already exists.';
//         case 'internal':
//           return 'Internal server error: Something went wrong on our end.';
//         case 'unauthenticated':
//           return 'Unauthenticated: You need to log in to access this resource.';
//         case 'invalid-argument':
//           return 'Invalid argument: One or more parameters are incorrect.';
//         case 'out-of-range':
//           return 'Out of range: The value is outside the acceptable range.';
//         case 'operation-not-allowed':
//           return 'Operation not allowed: This operation is not permitted.';
//         default:
//           return e.message ?? 'An unknown error occurred.';
//       }
//     } else {
//       return e.toString();
//     }
//   }
// }
