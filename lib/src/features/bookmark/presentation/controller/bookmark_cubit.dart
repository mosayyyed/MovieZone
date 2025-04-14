import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/errors/failures.dart';
import 'package:movie_app/src/features/bookmark/domain/repositories/bookmark_repository.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final BookmarkRepository _repository;

  BookmarkCubit(this._repository) : super(BookmarkInitial());

  Future<void> loadBookmarks() async {
    try {
      emit(BookmarkLoading(
        List.generate(
          10,
          (index) => BookmarkModel.fake(),
        ),
      ));
      final bookmarks = await _repository.getBookmarks();
      bookmarks.fold(
        (failure) => emit(BookmarkError(failure.message)),
        (bookmarks) => emit(BookmarkLoaded(bookmarks)),
      );
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<void> addBookmark(BookmarkModel bookmark) async {
    try {
      await _repository.addBookmark(bookmark);
      await loadBookmarks();
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<void> removeBookmark(String movieId) async {
    try {
      await _repository.removeBookmark(movieId);
      await loadBookmarks();
    } catch (e) {
      emit(BookmarkError(e.toString()));
    }
  }

  Future<Either<Failure, bool>> isBookmarked(String movieId) async {
    return await _repository.isBookmarked(movieId);
  }
}
