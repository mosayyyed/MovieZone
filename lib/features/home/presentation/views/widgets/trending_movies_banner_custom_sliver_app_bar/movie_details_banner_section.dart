import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/models/movie_model.dart';
import '../../../controller/genres/genres_cubit.dart';
import '../movie_card.dart';
import 'banner_action_buttons.dart';

class MovieDetailsBannerSection extends StatelessWidget {
  const MovieDetailsBannerSection({
    super.key,
    required this.movie,
    required this.pageController,
    required this.totalMovies,
  });

  final MovieModel movie;
  final PageController pageController;
  final int totalMovies;

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(context),
          const SizedBox(height: 8),
          _buildMovieTitle(context),
          const SizedBox(height: 4),
          _buildMovieInfo(context, genresCubit),
          const SizedBox(height: 16),
          BannerActionButtons(
            movieId: movie.id,
          ),
          const SizedBox(height: 16),
          _buildPageIndicator(context),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      "الرائجة اليوم".toUpperCase(),
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildMovieTitle(BuildContext context) {
    return Text(
      movie.title,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  Widget _buildMovieInfo(BuildContext context, GenresCubit genresCubit) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: MovieInfoRow(
        genreIds: movie.genreIds,
        voteAverage: movie.voteAverage,
        genres: genresCubit.genres,
      ),
    );
  }

  Widget _buildPageIndicator(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: totalMovies,
      effect: ExpandingDotsEffect(
        dotColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
        activeDotColor: Theme.of(context).colorScheme.primary,
        dotHeight: 8,
        dotWidth: 8,
        spacing: 8,
      ),
    );
  }
}
