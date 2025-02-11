import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/controller/popular/popular_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/trending/trending_cubit.dart';

import '../../../../../core/component/widgets/custom_refresh_indicator.dart';
import '../../controller/top_rated/top_rated_cubit.dart';
import '../../controller/upcoming/upcoming_cubit.dart';
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
    final upcomingCubit = context.read<UpcomingCubit>();

    return CustomRefreshIndicator(
      onRefresh: () async {
        trendingCubit.fetchTrendingMoviesByDay();
        trendingCubit.fetchTrendingMoviesByWeek();
        topRatedCubit.fetchTopRatedMovies();
        popularCubit.fetchPopularMovies();
        upcomingCubit.fetchUpcomingMovies();
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          TrendingMoviesBannerSliverAppBar(
            trendingMovies: trendingCubit.trendingMoviesByDay,
          ),
          _buildSection(
            title: "الأعلى تقييمًا",
            cubit: topRatedCubit,
            stateBuilder: (context, state) => HorizontalList(
              isLoading: state is TopRatedLoading,
              isCounterVisible: true,
              movieList: topRatedCubit.topRatedMovies,
            ),
          ),
          _buildSection(
            title: "أشهر المقاطع",
            cubit: popularCubit,
            stateBuilder: (context, state) => ContinueWatching(
              state: state is PopularLoading,
              trendingMovieModel: popularCubit.popularMovies,
            ),
          ),
          _buildSection(
            title: "الرائج هذا الأسبوع",
            cubit: trendingCubit,
            stateBuilder: (context, state) => HorizontalList(
              isLoading: state is TrendingLoading,
              movieList: trendingCubit.trendingMoviesByWeek,
            ),
          ),
          _buildSection(
            title: "القادمة",
            cubit: topRatedCubit,
            stateBuilder: (context, state) => HorizontalList(
              isLoading: state is UpcomingLoading,
              movieList: upcomingCubit.upcomingMovies,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required Cubit cubit,
    required BlocWidgetBuilder stateBuilder,
  }) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(title: title, onSeeAll: () {}),
          BlocBuilder(
            bloc: cubit,
            builder: stateBuilder,
          ),
        ],
      ),
    );
  }
}
