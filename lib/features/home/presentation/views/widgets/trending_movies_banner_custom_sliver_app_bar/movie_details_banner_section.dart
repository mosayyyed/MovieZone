import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/themes/app_colors.dart';
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
          _buildTitle(),
          const SizedBox(height: 8),
          _buildMovieTitle(),
          const SizedBox(height: 4),
          _buildMovieInfo(context, genresCubit),
          const SizedBox(height: 16),
          BannerActionButtons(
            movieId: movie.id,
          ),
          const SizedBox(height: 16),
          _buildPageIndicator(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "الرائجة اليوم".toUpperCase(),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryColor,
      ),
    );
  }

  Widget _buildMovieTitle() {
    return Text(
      movie.title,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
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

  Widget _buildPageIndicator() {
    return SmoothPageIndicator(
      controller: pageController,
      count: totalMovies,
      effect: ExpandingDotsEffect(
        dotColor: Colors.white.withAlpha(100),
        activeDotColor: AppColors.kPrimaryColor,
        dotHeight: 8,
        dotWidth: 8,
        spacing: 8,
      ),
    );
  }
}
