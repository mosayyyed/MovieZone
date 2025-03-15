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
            color: Theme.of(context).colorScheme.onSurface,
            width: 20,
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () async {
            await movieVideosCubit.fetchMovieVideos(movieId);

            if (movieVideosCubit.videosList.isNotEmpty) {
              final officialTrailer = movieVideosCubit.videosList.firstWhere(
                (video) => video.type == 'Trailer' && video.official == true,
                orElse: () => movieVideosCubit.videosList.first,
              );

              showVideoDialog(
                context,
                videoKey: officialTrailer.key,
                videoName: officialTrailer.name,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.onSurface,
          ),
          icon: SvgPicture.asset(
            AppAssets.icons.playArrow,
            color: Theme.of(context).colorScheme.surface,
            width: 20,
          ),
          label: Text(
            "بدء المشاهدة",
            style: TextStyle(color: Theme.of(context).colorScheme.surface),
          ),
        ),
        const SizedBox(width: 16),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.icons.moreHorizontalCircle,
            color: Theme.of(context).colorScheme.onSurface,
            width: 20,
          ),
        ),
      ],
    );
  }
}
