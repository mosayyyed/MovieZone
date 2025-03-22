import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/themes/app_assets.dart';
import '../../../../../../core/utils/showVideoDiolog.dart';
import '../../../controller/MovieVideos/movie_videos_cubit.dart';

class BannerActionButtons extends StatelessWidget {
  final int movieId;
  const BannerActionButtons({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final movieVideosCubit = context.watch<MovieVideosCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.icons.bookmarkAdd,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurfaceVariant,
              BlendMode.srcIn,
            ),
            width: 20,
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () async {
            await movieVideosCubit.fetchMovieVideos(movieId);

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
            "بدء المشاهدة",
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
