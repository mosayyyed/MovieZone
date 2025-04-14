import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/ui/arrow_back_with_title_app_bar.dart';
import 'package:movie_app/src/core/ui/my_single_child_scroll_view.dart';
import 'package:movie_app/src/core/ui/skeletonizer_placeholder_cached_network_image.dart';
import 'package:movie_app/src/core/utils/app_constants.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_cubit.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_state.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/home_section/movie_info_row.dart';
import 'package:movie_app/src/features/home/data/models/genre_model.dart';
import 'package:movie_app/src/features/home/presentation/controller/genres/genres_cubit.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<BookmarkCubit>().loadBookmarks();
    context.read<GenresCubit>().fetchGenres();

    return Scaffold(
      appBar: ArrowBackWithTitleAppBar(title: 'Bookmarks'),
      body: MySingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<BookmarkCubit, BookmarkState>(
              builder: (context, state) {
                if (state is BookmarkLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is BookmarkError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline,
                            size: 48,
                            color: Theme.of(context).colorScheme.error),
                        const SizedBox(height: 16),
                        Text(state.message,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center),
                      ],
                    ),
                  );
                }

                if (state is BookmarkLoaded) {
                  if (state.bookmarks.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bookmark_border,
                              size: 64,
                              color: Theme.of(context).colorScheme.secondary),
                          const SizedBox(height: 16),
                          Text('No bookmarked movies yet',
                              style: Theme.of(context).textTheme.titleLarge),
                          const SizedBox(height: 8),
                          Text(
                            'Add movies to your bookmarks to see them here',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                            textAlign: TextAlign.center,
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
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.bookmarks.length,
                        itemBuilder: (context, index) {
                          final bookmark = state.bookmarks[index];
                          return Dismissible(
                            key: Key(bookmark.movieId),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.error,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              child: const Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            onDismissed: (direction) {
                              context
                                  .read<BookmarkCubit>()
                                  .removeBookmark(bookmark.movieId);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16),
                                  onTap: () {
                                    // TODO: Navigate to movie details
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                '${AppConstants.api.imageUrl}${bookmark.posterPath}',
                                            width: 80,
                                            height: 120,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                SkeletonizerPlaceholderCachedNetworkImage(),
                                            errorWidget: (_, __, ___) =>
                                                Container(
                                              width: 80,
                                              height: 120,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .surfaceContainerHighest,
                                              child: Icon(
                                                Icons.movie,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 16),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                bookmark.title,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              MovieInfoRow(
                                                voteAverage:
                                                    bookmark.voteAverage,
                                                genreIds: bookmark.genreIds,
                                                genres: genres,
                                                isExpanded: true,
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.bookmark,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          onPressed: () {
                                            context
                                                .read<BookmarkCubit>()
                                                .removeBookmark(
                                                    bookmark.movieId);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
