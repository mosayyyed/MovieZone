import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_cubit.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_state.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';

import '../../../../../../core/themes/app_assets.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../../../../../core/utils/show_video_diolog.dart';
import '../../../controller/MovieVideos/movie_videos_cubit.dart';

class BannerActionButtons extends StatelessWidget {
  final MovieModel movie;
  const BannerActionButtons({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final movieVideosCubit = context.watch<MovieVideosCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<BookmarkCubit, BookmarkState>(
          builder: (context, state) {
            final isBookmarked = state is BookmarkLoaded &&
                state.bookmarks.any((b) => b.movieId == movie.id.toString());
            return IconButton(
              onPressed: () {
                if (isBookmarked) {
                  context
                      .read<BookmarkCubit>()
                      .removeBookmark(movie.id.toString());
                } else {
                  context.read<BookmarkCubit>().addBookmark(
                        BookmarkModel(
                          movieId: movie.id.toString(),
                          title: movie.title,
                          genreIds: movie.genreIds,
                          posterPath: movie.posterPath
                              .replaceAll(AppConstants.api.imageUrl, ''),
                          voteAverage: movie.voteAverage,
                          createdAt: DateTime.now(),
                        ),
                      );
                }
              },
              icon: SvgPicture.asset(
                isBookmarked
                    ? AppAssets.icons.bookmarkRemove
                    : AppAssets.icons.bookmarkAdd,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onSurfaceVariant,
                  BlendMode.srcIn,
                ),
                width: 20,
              ),
            );
          },
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () async {
            await movieVideosCubit.fetchMovieVideos(movie.id);

            if (movieVideosCubit.state is MovieVideosSuccess &&
                movieVideosCubit.videosList.isNotEmpty) {
              final officialTrailer = movieVideosCubit.videosList
                      .where((video) =>
                          video.type == 'Trailer' && video.official == true)
                      .firstOrNull ??
                  movieVideosCubit.videosList.first;

              showVideoDialog(
                context,
                videoKey: officialTrailer.key,
                videoName: officialTrailer.name,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          icon: BlocBuilder<MovieVideosCubit, MovieVideosState>(
            builder: (context, state) {
              if (state is MovieVideosLoading) {
                return SizedBox(
                  width: 20,
                  height: 20,
                  child: CupertinoActivityIndicator(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                );
              }
              return SvgPicture.asset(
                AppAssets.icons.playArrow,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
                width: 20,
              );
            },
          ),
          label: Text(
            S.of(context).startWatching,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.icons.moreHorizontalCircle,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurfaceVariant,
              BlendMode.srcIn,
            ),
            width: 20,
          ),
        ),
      ],
    );
  }
}
