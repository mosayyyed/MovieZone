import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/controller/popular/popular_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/trending/trending_cubit.dart';

import '../../../../../core/component/widgets/custom_refresh_indicator.dart';
import '../../controller/top_rated/top_rated_cubit.dart';
import '../widgets/continue_watching.dart';
import '../widgets/horizontal_list.dart';
import '../widgets/section_header.dart';
import '../widgets/trending_movies_banner_custom_sliver_app_bar/trending_movies_banner_sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingCubit = context.read<TrendingCubit>();
    final topRatedCubit = context.read<TopRatedCubit>();
    final popularCubit = context.read<PopularCubit>();

    return CustomRefreshIndicator(
      onRefresh: () async {
        trendingCubit.fetchTrendingMoviesByDay();
        trendingCubit.fetchTrendingMoviesByWeek();
        topRatedCubit.fetchTopRatedMovies();
        popularCubit.fetchPopularMovies();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          TrendingMoviesBannerSliverAppBar(
            trendingMovies: trendingCubit.trendingMoviesByDay,
          ),
          SectionHeader(title: "الأعلى تقييمًا", onSeeAll: () {}),
          BlocBuilder<TopRatedCubit, TopRatedState>(
            builder: (context, state) {
              return HorizontalList(
                isLoading: state is TopRatedLoading,
                movieList: topRatedCubit.topRatedMovies,
              );
            },
          ),
          SectionHeader(title: "الأكثر شهرة", onSeeAll: () {}),
          BlocBuilder<PopularCubit, PopularState>(
            builder: (context, state) {
              return ContinueWatching(
                  state: state is PopularLoading,
                  trendingMovieModel: popularCubit.popularMovies);
            },
          ),
          SectionHeader(title: "رائج هذا الأسبوع", onSeeAll: () {}),
          BlocBuilder<TrendingCubit, TrendingState>(
            builder: (context, state) {
              return HorizontalList(
                isLoading: state is TrendingLoading,
                movieList: trendingCubit.trendingMoviesByWeek,
              );
            },
          ),
        ],
      ),
    );
  }
}
