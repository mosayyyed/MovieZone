import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/ui/blurred_play_button.dart';
import 'package:movie_app/src/core/ui/progress_bar_with_percentage.dart';
import 'package:movie_app/src/core/ui/skeletonizer_placeholder_cached_network_image.dart';
import 'package:movie_app/src/core/utils/show_video_diolog.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/data/models/movie_videos_model.dart';
import 'package:movie_app/src/features/home/presentation/controller/MovieVideos/movie_videos_cubit.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    super.key,
    required this.movies,
    required this.movieVideosCubit,
    required this.progress,
    required this.index,
  });

  final List<MovieModel> movies;
  final MovieVideosCubit movieVideosCubit;
  final List<double> progress;
  final int index;

  @override
  Widget build(BuildContext context) {
    final movie = movies[index];

    return GestureDetector(
      onTap: () => _onTap(context, movie.id),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.sp),
        child: Stack(
          children: [
            _MovieImage(imageUrl: movie.backdropPath),
            Container(
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(100),
                borderRadius: BorderRadius.circular(16.sp),
              ),
            ),
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _MovieCardTitle(title: movie.title),
                    ProgressBarWithPercentage(progress: progress[index]),
                  ],
                ),
              ),
            ),
            const Positioned.fill(
              child: Center(child: BlurredPlayButton()),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTap(BuildContext context, int movieId) async {
    await movieVideosCubit.fetchMovieVideos(movieId);
    if (movieVideosCubit.state is MovieVideosSuccess) {
      final videos =
          (movieVideosCubit.state as MovieVideosSuccess).movieVideosList;
      if (videos.isNotEmpty) {
        final trailer = _getOfficialTrailer(videos);
        showVideoDialog(context,
            videoKey: trailer.key, videoName: trailer.name);
      }
    }
  }

  MovieVideosModel _getOfficialTrailer(List<MovieVideosModel> videos) {
    return videos.firstWhere(
      (video) => video.type == 'Trailer' && video.official,
      orElse: () => videos.first,
    );
  }
}

class _MovieImage extends StatelessWidget {
  const _MovieImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fadeInCurve: Curves.linear,
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          SkeletonizerPlaceholderCachedNetworkImage(),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: 50.sp,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      fit: BoxFit.cover,
      width: 200.w,
      height: 150.h,
    );
  }
}

class _MovieCardTitle extends StatelessWidget {
  const _MovieCardTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(offset: Offset(0, 1), blurRadius: 4, color: Colors.black45),
          ],
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
