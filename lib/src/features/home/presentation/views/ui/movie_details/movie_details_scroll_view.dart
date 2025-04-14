import 'package:flutter/material.dart';
import 'package:movie_app/src/features/home/data/models/movie_details_model.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/movie_details/movie_details_content.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/movie_details/movie_details_sliver_app_bar.dart';

class MovieDetailsScrollView extends StatelessWidget {
  final MovieDetailsModel movieDetailsModel;

  const MovieDetailsScrollView({super.key, required this.movieDetailsModel});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        MovieDetailsSliverAppBar(movie: movieDetailsModel),
        SliverList(
          delegate: SliverChildListDelegate(
            [MovieDetailsContent(movie: movieDetailsModel)],
          ),
        ),
      ],
    );
  }
}
