import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/movie_model.dart';

class TrendingMoviesPageViewBuilder extends StatelessWidget {
  const TrendingMoviesPageViewBuilder({
    super.key,
    required this.movies,
    required this.controller,
    required this.onPageChanged,
  });

  final List<MovieModel> movies;
  final PageController controller;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: movies.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return CachedNetworkImage(
          imageUrl: movie.backdropPath!,
          errorWidget: (_, __, ___) => const Icon(Icons.error, size: 50),
          fit: BoxFit.cover,
        );
      },
    );
  }
}
