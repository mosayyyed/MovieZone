import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/home_section/movie_info_row.dart';
import 'package:movie_app/generated/l10n.dart';

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
  final LoopPageController pageController;
  final int totalMovies;

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();
    return Positioned(
      bottom: 20.h,
      left: 24.w,
      right: 24.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle(context),
          SizedBox(height: 8.h),
          _buildMovieTitle(context),
          SizedBox(height: 4.h),
          _buildMovieInfo(context, genresCubit),
          SizedBox(height: 16.h),
          BannerActionButtons(
            movie: movie,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(S.current.trendingToday.toUpperCase(),
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
}
