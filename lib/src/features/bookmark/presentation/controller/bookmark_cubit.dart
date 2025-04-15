import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/src/core/errors/failures.dart';
import 'package:movie_app/src/features/bookmark/domain/repositories/bookmark_repository.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final BookmarkRepository _repository;

  BookmarkCubit(this._repository) : super(BookmarkInitial());

  Future<void> loadBookmarks() async {
    try {
      emit(BookmarkLoading(List.generate(10, (index) => BookmarkModel.fake())));

      final result = await _repository.getBookmarks();
      result.fold(
        (failure) => emit(BookmarkError(failure.message)),
        (bookmarks) => _groupBookmarksByTime(bookmarks),
      );
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  void _groupBookmarksByTime(List<BookmarkModel> bookmarks) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final thisWeek = today.subtract(Duration(days: today.weekday - 1));
    final thisMonth = DateTime(now.year, now.month, 1);
    final lastMonth = DateTime(now.year, now.month - 1, 1);

    final todayBookmarks = bookmarks
        .where((b) =>
            b.createdAt.year == today.year &&
            b.createdAt.month == today.month &&
            b.createdAt.day == today.day)
        .toList();

    final yesterdayBookmarks = bookmarks
        .where((b) =>
            b.createdAt.year == yesterday.year &&
            b.createdAt.month == yesterday.month &&
            b.createdAt.day == yesterday.day)
        .toList();

    final thisWeekBookmarks = bookmarks
        .where(
            (b) => b.createdAt.isAfter(thisWeek) && b.createdAt.isBefore(today))
        .toList();

    final thisMonthBookmarks = bookmarks
        .where((b) =>
            b.createdAt.isAfter(thisMonth) && b.createdAt.isBefore(thisWeek))
        .toList();

    final lastMonthBookmarks = bookmarks
        .where((b) =>
            b.createdAt.isAfter(lastMonth) && b.createdAt.isBefore(thisMonth))
        .toList();

    final olderBookmarks =
        bookmarks.where((b) => b.createdAt.isBefore(lastMonth)).toList();

    emit(BookmarkLoaded(
      bookmarks: bookmarks,
      todayBookmarks: todayBookmarks,
      yesterdayBookmarks: yesterdayBookmarks,
      thisWeekBookmarks: thisWeekBookmarks,
      thisMonthBookmarks: thisMonthBookmarks,
      lastMonthBookmarks: lastMonthBookmarks,
      olderBookmarks: olderBookmarks,
    ));
  }

  Future<void> addBookmark(BookmarkModel bookmark) async {
    try {
      final result = await _repository.addBookmark(bookmark);
      result.fold(
        (failure) => emit(BookmarkError(failure.message)),
        (_) => loadBookmarks(),
      );
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<void> removeBookmark(String movieId) async {
    try {
      final result = await _repository.removeBookmark(movieId);
      result.fold(
        (failure) => emit(BookmarkError(failure.message)),
        (_) => loadBookmarks(),
      );
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<Either<Failure, bool>> isBookmarked(String movieId) async {
    return await _repository.isBookmarked(movieId);
  }
}
