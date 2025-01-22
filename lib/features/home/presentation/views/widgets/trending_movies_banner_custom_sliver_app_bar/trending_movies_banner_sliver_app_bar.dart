import 'package:flutter/material.dart';

import '../../../../../../core/themes/app_colors.dart';
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
      backgroundColor: AppColors.kPrimaryColor,
      title: Text(
        "الرئيسية",
        style: Styles.textStyle22.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.download_rounded, color: Colors.white),
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: AppColors.kPrimaryColor,
          backgroundImage: AssetImage("assets/avatar.png"),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          stretchModes: [
            StretchMode.zoomBackground,
          ],
          background: TrendingMoviesBanner(
            trendingMovies: trendingMovies,
          )),
    );
  }
}
