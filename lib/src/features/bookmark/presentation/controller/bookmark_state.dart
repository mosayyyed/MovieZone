import 'package:equatable/equatable.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';

abstract class BookmarkState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {
  final List<BookmarkModel> fakeBookmarks;

  BookmarkLoading(this.fakeBookmarks);

  @override
  List<Object?> get props => [fakeBookmarks];
}

class BookmarkLoaded extends BookmarkState {
  final List<BookmarkModel> bookmarks;

  BookmarkLoaded(this.bookmarks);

  @override
  List<Object?> get props => [bookmarks];
}

class BookmarkError extends BookmarkState {
  final String message;

  BookmarkError(this.message);

  @override
  List<Object?> get props => [message];
}
