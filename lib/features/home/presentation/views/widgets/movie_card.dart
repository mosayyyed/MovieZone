import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/getGenresNames.dart';
import '../../../data/models/genre_model.dart';
import '../../../data/models/movie_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => GoRouter.of(context).push(
        AppRoutes.kMovieDetailsRoute.replaceFirst(":id", movie.id.toString()),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMovieImage(movie.posterPath, index),
            const SizedBox(height: 8),
            SizedBox(
              width: 150,
              child: Text(
                movie.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 150,
              child: MovieInfoRow(
                voteAverage: movie.voteAverage,
                genreIds: movie.genreIds,
                genres: genres,
              ),
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
}

class MovieInfoRow extends StatelessWidget {
  final double voteAverage;
  final List<int> genreIds;
  final List<GenreModel> genres;

  const MovieInfoRow({
    super.key,
    required this.voteAverage,
    required this.genreIds,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.star_rate_rounded,
            color: AppColors.kPrimaryColor, size: 18),
        const SizedBox(width: 4),
        Text(
          voteAverage.toStringAsFixed(1),
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 4),
        const Text("|", style: TextStyle(color: Colors.white70)),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            getGenreNames(genreIds, genres),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
