import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/errors/failures.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, List<BookmarkModel>>> getBookmarks();
  Future<Either<Failure, void>> addBookmark(BookmarkModel bookmark);
  Future<Either<Failure, void>> removeBookmark(String movieId);
  Future<Either<Failure, bool>> isBookmarked(String movieId);
}
