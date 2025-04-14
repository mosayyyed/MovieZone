import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';

abstract class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {
  final List<BookmarkModel> bookmarks;

  BookmarkLoaded(this.bookmarks);
}

class BookmarkError extends BookmarkState {
  final String message;

  BookmarkError(this.message);
}
