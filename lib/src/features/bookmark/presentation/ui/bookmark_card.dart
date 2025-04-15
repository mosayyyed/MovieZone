import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/core/ui/skeletonizer_placeholder_cached_network_image.dart';
import 'package:movie_app/src/core/utils/app_constants.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_cubit.dart';
import 'package:movie_app/src/features/home/data/models/genre_model.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/home_section/movie_info_row.dart';

class BookmarkCard extends StatelessWidget {
  final BookmarkModel bookmark;
  final List<GenreModel> genres;

  const BookmarkCard({
    super.key,
    required this.bookmark,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(bookmark.movieId),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: EdgeInsets.symmetric(vertical: AppPadding.p2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
        alignment: Localizations.localeOf(context).languageCode == 'ar'
            ? Alignment.centerLeft
            : Alignment.centerRight,
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: AppSize.s24,
        ),
      ),
      onDismissed: (direction) {
        context.read<BookmarkCubit>().removeBookmark(bookmark.movieId);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppPadding.p2),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s8),
                    child: CachedNetworkImage(
                      imageUrl:
                          '${AppConstants.api.imageUrl}/${bookmark.posterPath}',
                      width: 70,
                      height: 100,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          SkeletonizerPlaceholderCachedNetworkImage(),
                      errorWidget: (_, __, ___) => Container(
                        width: 70,
                        height: 100,
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        child: Icon(
                          Icons.movie,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bookmark.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        MovieInfoRow(
                          voteAverage: bookmark.voteAverage,
                          genreIds: bookmark.genreIds,
                          genres: genres,
                          isExpanded: true,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.bookmark_remove_outlined,
                      size: 18,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    onPressed: () {
                      context
                          .read<BookmarkCubit>()
                          .removeBookmark(bookmark.movieId);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
