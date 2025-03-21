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
    Future.microtask(() => _precacheInitialImages());

    PaintingBinding.instance.imageCache.maximumSize = 500;
    PaintingBinding.instance.imageCache.maximumSizeBytes = 1024 * 1024 * 50;
  }

  void _precacheInitialImages() {
    for (int i = 0; i < widget.movies.length && i < 3; i++) {
      _precacheImage(widget.movies[i].backdropPath);
    }
  }

  void _precacheImage(String imageUrl) {
    if (imageUrl.isNotEmpty) {
      final provider = CachedNetworkImageProvider(imageUrl);
      precacheImage(provider, context);
    }
  }

  void _precacheNextImage(int index) {
    if (index + 1 < widget.movies.length) {
      _precacheImage(widget.movies[index + 1].backdropPath);
    }
  }

  @override
  void didUpdateWidget(covariant TrendingMoviesPageViewBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.movies != widget.movies) {
      _precacheInitialImages();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return Center(
        child: Text(
          "لا توجد أفلام",
          style: TextStyle(
              fontSize: 18, color: Theme.of(context).colorScheme.onSurface),
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification) {
          final index = widget.controller.page?.round() ?? 0;
          _precacheNextImage(index);
        }
        return false;
      },
      child: PageView.builder(
        controller: widget.controller,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.movies.length,
        onPageChanged: (index) {
          widget.onPageChanged(index);
          _precacheNextImage(index);
        },
        itemBuilder: (context, index) {
          final movie = widget.movies[index];
          return CachedNetworkImage(
            useOldImageOnUrlChange: true,
            fadeInDuration: Duration.zero,
            imageUrl: movie.backdropPath,
            fit: BoxFit.cover,
            errorWidget: (_, __, ___) => const Center(
              child: Icon(
                Icons.error,
                color: Colors.white,
                size: 40,
              ),
            ),
          );
        },
      ),
    );
  }
}
