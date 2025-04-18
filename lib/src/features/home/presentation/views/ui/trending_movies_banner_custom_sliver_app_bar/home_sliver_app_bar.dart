import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/routing/routes.dart';
import 'package:movie_app/src/core/themes/app_styles.dart';
import 'package:movie_app/src/core/utils/app_constants.dart';
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
      title: Text(
        S.of(context).home,
        style: Styles.boldTextStyle20.copyWith(
          fontSize: 20.sp,
        ),
      ),
      titleSpacing: 0,
      actions: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).push(
                AppRoutes.kExploreRoute,
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
              width: 24.sp,
            )),
        IconButton(
          onPressed: () => GoRouter.of(context).push(AppRoutes.kBookmarkRoute,
              extra: context.read<GenresCubit>()),
          icon: SvgPicture.asset(
            AppAssets.icons.bookmarkFilled,
            colorFilter: ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
            width: 24.sp,
          ),
        ),
      ],
      leading: GestureDetector(
        onTap: () => GoRouter.of(context).push(AppRoutes.kProfileRoute),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.w,
            vertical: 6.h,
          ),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            backgroundImage: AssetImage(AppConstants.avatarPlaceholder),
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
