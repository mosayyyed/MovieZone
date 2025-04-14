import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';

abstract class BookmarkRepository {
  Future<List<BookmarkModel>> getBookmarks();
  Future<void> addBookmark(BookmarkModel bookmark);
  Future<void> removeBookmark(String movieId);
  Future<bool> isBookmarked(String movieId);
}
