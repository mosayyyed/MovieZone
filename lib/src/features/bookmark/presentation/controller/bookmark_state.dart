import 'package:equatable/equatable.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';

sealed class BookmarkState extends Equatable {}

final class BookmarkInitial extends BookmarkState {
  @override
  List<Object?> get props => [];
}

final class BookmarkLoading extends BookmarkState {
  final List<BookmarkModel> fakeBookmarks;

  BookmarkLoading(this.fakeBookmarks);

  @override
  List<Object?> get props => [fakeBookmarks];
}

final class BookmarkLoaded extends BookmarkState {
  final List<BookmarkModel> bookmarks;
  final List<BookmarkModel> todayBookmarks;
  final List<BookmarkModel> yesterdayBookmarks;
  final List<BookmarkModel> thisWeekBookmarks;
  final List<BookmarkModel> thisMonthBookmarks;
  final List<BookmarkModel> lastMonthBookmarks;
  final List<BookmarkModel> olderBookmarks;

  BookmarkLoaded({
    required this.bookmarks,
    required this.todayBookmarks,
    required this.yesterdayBookmarks,
    required this.thisWeekBookmarks,
    required this.thisMonthBookmarks,
    required this.lastMonthBookmarks,
    required this.olderBookmarks,
  });

  @override
  List<Object?> get props => [
        bookmarks,
        todayBookmarks,
        yesterdayBookmarks,
        thisWeekBookmarks,
        thisMonthBookmarks,
        lastMonthBookmarks,
        olderBookmarks,
      ];
}

final class BookmarkError extends BookmarkState {
  final String message;

  BookmarkError(this.message);

  @override
  List<Object?> get props => [message];
}
