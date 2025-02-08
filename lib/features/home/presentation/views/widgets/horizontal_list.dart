import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/getGenresNames.dart';
import '../../../data/models/genre_model.dart';

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
    final genresCubit = context.watch<GenresCubit>();
    return isLoading ? _buildSkeletonLoader() : _buildMovieList(genresCubit);
  }

  Widget _buildMovieList(GenresCubit genresCubit) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movieList.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return _buildMovieCard(context, movie, index, genresCubit);
        },
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, MovieModel movie, int index,
      GenresCubit genresCubit) {
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
                genres: genresCubit.genres,
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
        const Icon(Icons.star_rate_rounded, color: Colors.yellow, size: 18),
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
