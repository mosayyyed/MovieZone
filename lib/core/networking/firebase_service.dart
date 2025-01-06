import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuthInstance;

  FirebaseService(this._firebaseAuthInstance);

  User? getCurrentUser() {
    return _firebaseAuthInstance.currentUser;
  }

  Future<User?> signUp(String email, String password) async {
    UserCredential userCredential =
        await _firebaseAuthInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<User?> signIn(String email, String password) async {
    UserCredential userCredential =
        await _firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _firebaseAuthInstance.signOut();
  }

  Future<void> sendEmailVerification() async {
    User? user = _firebaseAuthInstance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<void> forgetPassword(String email) async {
    await _firebaseAuthInstance.sendPasswordResetEmail(email: email);
  }
}
