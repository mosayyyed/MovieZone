import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/themes/app_colors.dart';
import '../../../../data/models/movie_model.dart';
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
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "الرائجة اليوم".toUpperCase(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.kPrimaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            movie.originalTitle ?? '',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          BannerActionButtons(),
          const SizedBox(height: 16),
          SmoothPageIndicator(
            controller: pageController,
            count: totalMovies,
            effect: ExpandingDotsEffect(
              dotColor: Colors.white.withOpacity(0.5),
              activeDotColor: AppColors.kPrimaryColor,
              dotHeight: 8,
              dotWidth: 8,
              spacing: 8,
            ),
          ),
        ],
      ),
    );
  }
}
