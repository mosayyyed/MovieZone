import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/core/ui/arrow_back_with_title_app_bar.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_cubit.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_state.dart';
import 'package:movie_app/src/features/bookmark/presentation/ui/bookmarks_error.dart';
import 'package:movie_app/src/features/bookmark/presentation/ui/bookmarks_list.dart';
import 'package:movie_app/src/features/bookmark/presentation/ui/bookmarks_loading.dart';
import 'package:movie_app/src/features/bookmark/presentation/ui/empty_bookmarks.dart';
import 'package:movie_app/src/features/home/data/models/genre_model.dart';
import 'package:movie_app/src/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ArrowBackWithTitleAppBar(
        title: S.of(context).myBookmarks,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.w),
        child: MultiBlocListener(
          listeners: [
            BlocListener<BookmarkCubit, BookmarkState>(
              listener: (context, state) {
                if (state is BookmarkError) {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.error(
                      message: state.message,
                    ),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<BookmarkCubit, BookmarkState>(
            builder: (context, state) {
              if (state is BookmarkLoading) {
                return BookmarksLoading(fakeBookmarks: state.fakeBookmarks);
              }

              if (state is BookmarkError) {
                return BookmarksError(message: state.message);
              }

              if (state is BookmarkLoaded && state.bookmarks.isEmpty) {
                return const EmptyBookmarks();
              }

              if (state is BookmarkLoaded) {
                return BlocBuilder<GenresCubit, GenresState>(
                  builder: (context, genresState) {
                    final List<GenreModel> genres =
                        genresState is GenresSuccess ? genresState.genres : [];

                    return BookmarksList(
                      state: state,
                      genres: genres,
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
