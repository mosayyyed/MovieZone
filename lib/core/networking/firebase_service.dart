import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../features/auth/data/models/user_model.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuthInstance;
  final FirebaseFirestore _firebaseFirestoreInstance;

  FirebaseService(this._firebaseAuthInstance, this._firebaseFirestoreInstance);

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

  Future<void> createUser(UserModel userModel) async {
    await _firebaseFirestoreInstance
        .collection('users')
        .doc(userModel.token)
        .set(userModel.toMap());
  }

  Future<UserModel?> getUser(String token) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _firebaseFirestoreInstance.collection('users').doc(token).get();

    if (documentSnapshot.exists && documentSnapshot.data() != null) {
      return UserModel.fromMap(documentSnapshot.data()!);
    }

    return null;
  }

  Future<bool> isEmailVerified() async {
    User? user = _firebaseAuthInstance.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }
}
