import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/ui/skeletonizer_placeholder_cached_network_image.dart';
import 'package:movie_app/src/core/ui/gradient_overlay.dart';
import 'package:movie_app/src/features/bookmark/data/models/bookmark_model.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_cubit.dart';
import 'package:movie_app/src/features/bookmark/presentation/controller/bookmark_state.dart';
import 'package:movie_app/src/core/utils/app_constants.dart';

import '../../../../../../core/themes/app_assets.dart';
import '../../../../data/models/movie_details_model.dart';

class MovieDetailsSliverAppBar extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieDetailsSliverAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.3,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            Share.share(
              'Check out this movie: ${movie.title}\n${AppConstants.api.baseUrl}/movie/${movie.id}\n${AppConstants.api.imageUrl}/${movie.posterPath}',
            );
          },
          icon: SvgPicture.asset(
            AppAssets.icons.share,
            color: Colors.white,
            width: 24.sp,
          ),
        ),
        IconButton(
          onPressed: () {
            final state = context.read<BookmarkCubit>().state;
            if (state is BookmarkLoaded &&
                state.bookmarks.any((b) => b.movieId == movie.id.toString())) {
              context.read<BookmarkCubit>().removeBookmark(movie.id.toString());
            } else {
              context.read<BookmarkCubit>().addBookmark(
                    BookmarkModel(
                      movieId: movie.id.toString(),
                      title: movie.title,
                      genreIds: movie.genres.map((e) => e.id).toList(),
                      posterPath: movie.posterPath
                          .replaceAll(AppConstants.api.imageUrl, ''),
                      voteAverage: movie.voteAverage,
                      createdAt: DateTime.now(),
                    ),
                  );
            }
          },
          icon: BlocBuilder<BookmarkCubit, BookmarkState>(
            builder: (context, state) {
              final isBookmarked = state is BookmarkLoaded &&
                  state.bookmarks.any((b) => b.movieId == movie.id.toString());
              return SvgPicture.asset(
                isBookmarked
                    ? AppAssets.icons.bookmarkRemove
                    : AppAssets.icons.bookmarkAdd,
                color: Colors.white,
                width: 24.sp,
              );
            },
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () => GoRouter.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      pinned: true,
      stretch: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        collapseMode: CollapseMode.parallax,
        expandedTitleScale: 1.3,
        titlePadding: EdgeInsets.only(
          right: 16.sp,
          left: 16.sp,
          bottom: 16.sp,
        ),
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        background: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: movie.backdropPath,
                placeholder: (context, url) =>
                    SkeletonizerPlaceholderCachedNetworkImage(),
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Icon(
                  Icons.error,
                  size: 50.sp,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            GradientOverlay(),
          ],
        ),
      ),
    );
  }
}
