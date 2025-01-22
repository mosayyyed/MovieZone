import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_styles.dart';
import '../../../../../core/utils/constants.dart';
import '../screen/movie_details_screen.dart';

class HorizontalList extends StatelessWidget {
  final List<MovieModel> movieList;
  final bool isLoading;

  const HorizontalList({
    super.key,
    required this.movieList,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildSkeletonLoader();
    }

    if (movieList.isEmpty) {
      return const Center(
        child: Text(
          "No movies available.",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: SizedBox(
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
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, MovieModel movie, int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsScreen(
              imageUrl: "$kFullImageUrl${movie.posterPath}",
              images: movieList.map((e) => e.posterPath).toList(),
            ),
          ),
        );
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
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
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
                  style: Styles.textStyle12.copyWith(color: Colors.white),
                ),
                const SizedBox(width: 4),
                const Text("|", style: TextStyle(color: Colors.white70)),
                const SizedBox(width: 4),
                Text(
                  movie.id.toString(),
                  style: Styles.textStyle12.copyWith(color: Colors.white70),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
            fadeInCurve: Curves.linear,
            imageUrl: posterPath != null
                ? "$kFullImageUrl$posterPath"
                : "assets/placeholder.png",
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, size: 50),
            fit: BoxFit.cover,
            width: 150,
            height: 200,
          ),
        ),
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
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkeletonLoader() {
    return SliverToBoxAdapter(
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
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
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
