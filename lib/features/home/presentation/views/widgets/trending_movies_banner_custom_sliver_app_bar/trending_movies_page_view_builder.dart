import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/movie_model.dart';

class TrendingMoviesPageViewBuilder extends StatefulWidget {
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
  State<TrendingMoviesPageViewBuilder> createState() =>
      _TrendingMoviesPageViewBuilderState();
}

class _TrendingMoviesPageViewBuilderState
    extends State<TrendingMoviesPageViewBuilder> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _precacheAllImages();
    });
  }

  void _precacheAllImages() {
    for (var movie in widget.movies) {
      precacheImage(CachedNetworkImageProvider(movie.backdropPath), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.controller,
      itemCount: widget.movies.length,
      onPageChanged: widget.onPageChanged,
      itemBuilder: (context, index) {
        final movie = widget.movies[index];
        return CachedNetworkImage(
          useOldImageOnUrlChange: true,
          imageUrl: movie.backdropPath,
          errorWidget: (_, __, ___) => const Icon(Icons.error, size: 50),
          fit: BoxFit.cover,
        );
      },
    );
  }
}
