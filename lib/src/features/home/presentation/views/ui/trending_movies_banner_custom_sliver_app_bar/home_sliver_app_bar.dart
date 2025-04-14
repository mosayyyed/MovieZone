import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/routing/routes.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/features/home/presentation/controller/MovieVideos/movie_videos_cubit.dart';
import 'package:movie_app/src/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/src/features/home/presentation/controller/trending/trending_cubit.dart';
import 'package:movie_app/generated/l10n.dart';

import '../../../../../../core/themes/app_assets.dart';
import 'featured_movies_banner.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.50,
      pinned: true,
      stretch: true,
      title: Text(S.of(context).home),
      titleSpacing: 0,
      actions: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(
                AppRoutes.kSearchRoute,
                extra: {
                  'trendingCubit': context.read<TrendingCubit>(),
                  'genresCubit': context.read<GenresCubit>(),
                  'movieVideosCubit': context.read<MovieVideosCubit>(),
                },
              );
            },
            icon: SvgPicture.asset(
              AppAssets.icons.search,
              colorFilter: ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            )),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.icons.bookmark,
            colorFilter: ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
      leading: GestureDetector(
        onTap: () => GoRouter.of(context).push(AppRoutes.kProfileRoute),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s6,
            vertical: AppSize.s6,
          ),
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
        background: FeaturedMoviesBanner(
          trendingMovies: context.read<TrendingCubit>().trendingMoviesByDay,
        ),
      ),
    );
  }
}
