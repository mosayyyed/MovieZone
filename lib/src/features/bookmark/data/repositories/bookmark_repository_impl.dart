import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/src/core/errors/firebase_failure.dart';
import 'package:movie_app/src/features/bookmark/domain/repositories/bookmark_repository.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  BookmarkRepositoryImpl(this._firestore, this._auth);

  String get _userId => _auth.currentUser?.uid ?? '';

  CollectionReference get _bookmarksCollection =>
      _firestore.collection('users').doc(_userId).collection('bookmarks');

  @override
  Future<List<BookmarkModel>> getBookmarks() async {
    try {
      final snapshot = await _bookmarksCollection.get();
      return snapshot.docs
          .map((doc) =>
              BookmarkModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  @override
  Future<void> addBookmark(BookmarkModel bookmark) async {
    try {
      await _bookmarksCollection.doc(bookmark.movieId).set(bookmark.toJson());
    } catch (e) {
      throw FirebaseFailure.fromFirebaseException(e);
    }
  }

  @override
  Future<void> removeBookmark(String movieId) async {
    try {
      await _bookmarksCollection.doc(movieId).delete();
    } catch (e) {
      throw Exception('Failed to remove bookmark: $e');
    }
  }

  @override
  Future<bool> isBookmarked(String movieId) async {
    try {
      final doc = await _bookmarksCollection.doc(movieId).get();
      return doc.exists;
    } catch (e) {
      throw Exception('Failed to check bookmark status: $e');
    }
  }
}
