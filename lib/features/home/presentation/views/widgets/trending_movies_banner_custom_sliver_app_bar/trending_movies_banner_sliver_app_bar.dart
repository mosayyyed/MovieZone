import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/trending/trending_cubit.dart';

import '../../../../../../core/themes/app_assets.dart';
import '../../../../../../core/themes/app_styles.dart';
import '../../../../data/models/movie_model.dart';
import 'trending_movies_banner.dart';

class TrendingMoviesBannerSliverAppBar extends StatelessWidget {
  final List<MovieModel> trendingMovies;
  const TrendingMoviesBannerSliverAppBar(
      {super.key, required this.trendingMovies});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.50,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      scrolledUnderElevation: 0,
      pinned: true,
      stretch: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Text(
        "الرئيسية",
        style: Styles.textStyle22.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(
              AppRoutes.kSearchRoute,
              extra: {
                'trendingCubit': context.read<TrendingCubit>(),
                'genresCubit': context.read<GenresCubit>(),
              },
            );
          },
          icon: SvgPicture.asset(
            AppAssets.icons.search,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.icons.bookmark,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
      leading: GestureDetector(
        onTap: () => GoRouter.of(context).push(AppRoutes.kProfileRoute),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            backgroundImage: AssetImage("assets/avatar.png"),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        stretchModes: [
          StretchMode.zoomBackground,
        ],
        background: TrendingMoviesBanner(
          trendingMovies: context.read<TrendingCubit>().trendingMoviesByDay,
        ),
      ),
    );
  }
}
