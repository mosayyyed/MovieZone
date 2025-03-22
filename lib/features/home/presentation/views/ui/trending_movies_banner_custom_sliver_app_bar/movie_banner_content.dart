import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/themes/app_values.dart';
import 'package:movie_app/features/home/presentation/views/ui/home_section/movie_info_row.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../data/models/movie_model.dart';
import '../../../controller/genres/genres_cubit.dart';
import 'banner_action_buttons.dart';

class MovieBannerContent extends StatelessWidget {
  const MovieBannerContent({
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
      bottom: AppSize.s20,
      left: AppSize.s24,
      right: AppSize.s24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(context),
          const SizedBox(height: AppSize.s8),
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
    return Text("الرائجة اليوم".toUpperCase(),
        style: Styles.boldTextStyle16.copyWith(
          color: Theme.of(context).colorScheme.primary,
          shadows: [
            Shadow(
              color: Theme.of(context).colorScheme.primary,
              offset: const Offset(0, 1),
              blurRadius: 10,
            ),
          ],
        ));
  }

  Widget _buildMovieTitle(BuildContext context) {
    return Text(
      movie.title,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Styles.boldTextStyle32.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
        shadows: [
          Shadow(
            color: Theme.of(context).colorScheme.onSurface.withAlpha(100),
            offset: const Offset(0, 1),
            blurRadius: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildMovieInfo(BuildContext context, GenresCubit genresCubit) {
    return MovieInfoRow(
      genreIds: movie.genreIds,
      voteAverage: movie.voteAverage,
      genres: genresCubit.genres,
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
