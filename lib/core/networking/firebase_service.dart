// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../../features/auth/data/models/user_model.dart';
//
// class FirebaseService {
//   final FirebaseAuth _firebaseAuthInstance;
//   final FirebaseFirestore _firebaseFirestoreInstance;
//
//   FirebaseService(this._firebaseAuthInstance, this._firebaseFirestoreInstance);
//
//   User? getCurrentUser() {
//     return _firebaseAuthInstance.currentUser;
//   }
//
//   Future<User?> signUp(String email, String password) async {
//     UserCredential userCredential =
//         await _firebaseAuthInstance.createUserWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return userCredential.user;
//   }
//
//   Future<User?> signIn(String email, String password) async {
//     UserCredential userCredential =
//         await _firebaseAuthInstance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return userCredential.user;
//   }
//
//   Future<void> signOut() async {
//     await _firebaseAuthInstance.signOut();
//   }
//
//   Future<void> sendEmailVerification() async {
//     User? user = _firebaseAuthInstance.currentUser;
//     if (user != null && !user.emailVerified) {
//       await user.sendEmailVerification();
//     }
//   }
//
//   Future<void> forgetPassword(String email) async {
//     await _firebaseAuthInstance.sendPasswordResetEmail(email: email);
//   }
//
//   Future<void> createUser(UserModel userModel) async {
//     await _firebaseFirestoreInstance
//         .collection('users')
//         .doc(userModel.token)
//         .set(userModel.toMap());
//   }
//
//   Future<void> createChat(
//       String userId, String chatId, Map<String, dynamic> chatData) async {
//     await _firebaseFirestoreInstance
//         .collection('users')
//         .doc(userId)
//         .collection('chats')
//         .doc(chatId)
//         .set(chatData);
//   }
//
//   Future<List<Map<String, dynamic>>> getChats(String userId) async {
//     QuerySnapshot querySnapshot = await _firebaseFirestoreInstance
//         .collection('users')
//         .doc(userId)
//         .collection('chats')
//         .get();
//     return querySnapshot.docs
//         .map((doc) => doc.data() as Map<String, dynamic>)
//         .toList();
//   }
//
//   Stream<List<Map<String, dynamic>>> getMessages(String userId, String chatId) {
//     return _firebaseFirestoreInstance
//         .collection('users')
//         .doc(userId)
//         .collection('chats')
//         .doc(chatId)
//         .collection('messages')
//         .orderBy('timestamp', descending: true)
//         .snapshots()
//         .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
//   }
//
//   Future<void> sendMessage(
//       String userId, String chatId, Map<String, dynamic> messageData) async {
//     await _firebaseFirestoreInstance
//         .collection('users')
//         .doc(userId)
//         .collection('chats')
//         .doc(chatId)
//         .collection('messages')
//         .add(messageData);
//   }
// }
