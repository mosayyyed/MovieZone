import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/controller/trending/trending_cubit.dart';

import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/app_styles.dart';
import '../widgets/continue_watching.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/section_header.dart';
import '../widgets/trending_movies_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingCubit = context.read<TrendingCubit>();

    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      color: AppColors.kPrimaryColor,
      strokeWidth: 4,
      displacement: 100,
      backgroundColor: AppColors.kSecondaryColor,
      onRefresh: () async {
        await trendingCubit.fetchTrendingMoviesByDay();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
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
                  trendingMovieModel: trendingCubit.trendingMovies,
                )),
          ),
          SectionHeader(title: "الأعلى تقييمًا", onSeeAll: () {}),
          HorizontalList(
            trendingMovieModel: trendingCubit.trendingMovies,
          ),
          SectionHeader(title: "الأكثر شهرة", onSeeAll: () {}),
          ContinueWatching(trendingMovieModel: trendingCubit.trendingMovies),
          SectionHeader(title: "رائج هذا الأسبوع", onSeeAll: () {}),
          HorizontalList(
            trendingMovieModel: trendingCubit.trendingMovies,
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          ),
        ],
      ),
    );
  }
}
