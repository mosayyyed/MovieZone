import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/themes/app_colors.dart';

class HorizontalList extends StatelessWidget {
  final List<MovieModel> movieList;
  final bool isLoading;
  final bool isCounterVisible;

  const HorizontalList({
    super.key,
    required this.movieList,
    required this.isLoading,
    this.isCounterVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildSkeletonLoader();
    }

    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movieList.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return _buildMovieCard(context, movie, index);
        },
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, MovieModel movie, int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kMovieDetailsRoute
            .replaceFirst(":id", movie.id.toString()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMovieImage(movie.posterPath, index),
            const SizedBox(height: 8),
            Text(
              movie.title,
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.star_rate_rounded,
                    color: Colors.yellow, size: 20),
                const SizedBox(width: 4),
                Text(
                  movie.voteAverage.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(width: 4),
                const Text("|", style: TextStyle(color: Colors.white70)),
                const SizedBox(width: 4),
                Text(
                  movie.id.toString(),
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieImage(String? posterPath, int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: posterPath!,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, size: 50),
            fit: BoxFit.cover,
            width: 150,
            height: 200,
          ),
        ),
        if (isCounterVisible)
          Positioned(
            left: 0,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildSkeletonLoader() {
    return Skeletonizer(
      enabled: isLoading,
      child: SizedBox(
        height: 270,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 200,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 100,
                    height: 15,
                    color: Colors.grey[800],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 50,
                    height: 15,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
