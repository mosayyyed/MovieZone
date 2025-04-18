import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/routing/routes.dart';
import 'package:movie_app/src/core/ui/skeletonizer_placeholder_cached_network_image.dart';
import 'package:movie_app/src/features/home/data/models/genre_model.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/presentation/controller/MovieVideos/movie_videos_cubit.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/home_section/movie_info_row.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final int index;
  final List<GenreModel> genres;
  final bool isCounterVisible;

  const MovieCard({
    super.key,
    required this.movie,
    required this.index,
    required this.genres,
    this.isCounterVisible = false,
  });

  void _navigateToDetails(BuildContext context) {
    GoRouter.of(context).push(
      AppRoutes.kMovieDetailsRoute.replaceFirst(":id", movie.id.toString()),
      extra: context.read<MovieVideosCubit>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMovieImage(movie.posterPath, index, context),
          SizedBox(height: 8.h),
          Text(
            movie.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          MovieInfoRow(
            voteAverage: movie.voteAverage,
            genreIds: movie.genreIds,
            genres: genres,
            isExpanded: true,
          ),
        ],
      ),
    );
  }

  Widget _buildMovieImage(String? posterPath, int index, BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: posterPath ?? "",
              fadeInDuration: const Duration(milliseconds: 100),
              placeholder: (context, url) =>
                  SkeletonizerPlaceholderCachedNetworkImage(),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, size: 50.sp),
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          if (isCounterVisible)
            Positioned(
              left: 0,
              child: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12.r),
                    topLeft: Radius.circular(12.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
