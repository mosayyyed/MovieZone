import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/src/core/themes/app_assets.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/core/ui/arrow_back_with_title_app_bar.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_cubit.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_state.dart';
import 'package:movie_app/src/features/bookmark/presentation/ui/bookmark_card.dart';
import 'package:movie_app/src/features/home/data/models/genre_model.dart';
import 'package:movie_app/src/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BookmarkCubit>().loadBookmarks();
    context.read<GenresCubit>().fetchGenres();

    return Scaffold(
      appBar: ArrowBackWithTitleAppBar(
        title: S.of(context).myBookmarks,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: BlocBuilder<BookmarkCubit, BookmarkState>(
          builder: (context, state) {
            if (state is BookmarkLoading) {
              return Skeletonizer(
                enabled: true,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: state.fakeBookmarks.length,
                  itemBuilder: (context, index) {
                    return BookmarkCard(
                      bookmark: state.fakeBookmarks[index],
                      genres: state.fakeBookmarks[index].genreIds
                          .map((e) => GenreModel(id: e, name: 'Genre $e'))
                          .toList()
                          .take(3)
                          .toList(),
                    );
                  },
                ),
              );
            }

            if (state is BookmarkError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.error_outline,
                        size: 48, color: Theme.of(context).colorScheme.error),
                    const SizedBox(height: 16),
                    Text(state.message,
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<BookmarkCubit>().loadBookmarks();
                      },
                      child: Text(S.of(context).tryAgain),
                    ),
                  ],
                ),
              );
            }

            if (state is BookmarkLoaded) {
              if (state.bookmarks.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppAssets.icons.bookmark,
                        width: 64,
                        height: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).noBookmarkedMovies,
                        style: Styles.textStyle18.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        S.of(context).addMoviesToBookmarks,
                        textAlign: TextAlign.center,
                        style: Styles.textStyle14.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return BlocBuilder<GenresCubit, GenresState>(
                builder: (context, genresState) {
                  final genres = genresState is GenresSuccess
                      ? genresState.genres
                      : <GenreModel>[];

                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: state.bookmarks.length,
                    itemBuilder: (context, index) {
                      final bookmark = state.bookmarks[index];
                      return BookmarkCard(
                        bookmark: bookmark,
                        genres: genres
                            .where((g) => bookmark.genreIds.contains(g.id))
                            .toList()
                            .take(3)
                            .toList(),
                      );
                    },
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
