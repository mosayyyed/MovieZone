import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/features/home/presentation/controller/popular/popular_cubit.dart';
import 'package:movie_app/src/features/home/presentation/controller/trending/trending_cubit.dart';
import 'package:movie_app/src/features/home/presentation/controller/top_rated/top_rated_cubit.dart';
import 'package:movie_app/src/features/home/presentation/controller/upcoming/upcoming_cubit.dart';
import 'package:movie_app/generated/l10n.dart';

import '../../../../../core/ui/custom_refresh_indicator.dart';
import '../../../data/models/movie_model.dart';
import '../ui/home_section/continue_watching_section.dart';
import '../ui/home_section/movie_list_section.dart';
import '../ui/trending_movies_banner_custom_sliver_app_bar/home_sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      onRefresh: () async {
        context.read<TrendingCubit>().fetchTrendingMoviesByDay();
        context.read<TrendingCubit>().fetchTrendingMoviesByWeek();
        context.read<TopRatedCubit>().fetchTopRatedMovies();
        context.read<PopularCubit>().fetchPopularMovies();
        context.read<UpcomingCubit>().fetchUpcomingMovies();
      },
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            HomeSliverAppBar(),
            _buildMovieSection<TopRatedCubit, TopRatedState>(
              title: S.of(context).topRated,
              cubit: context.read<TopRatedCubit>(),
              isCounterVisible: true,
              selector: (state) =>
                  state is TopRatedSuccess ? state.topRatedMovies : [],
            ),
            _buildMovieSection<PopularCubit, PopularState>(
              title: S.of(context).popular,
              cubit: context.read<PopularCubit>(),
              selector: (state) =>
                  state is PopularSuccess ? state.popularMovies : [],
              isContinueWatching: true,
            ),
            _buildMovieSection<TrendingCubit, TrendingState>(
              title: S.of(context).trendingThisWeek,
              cubit: context.read<TrendingCubit>(),
              selector: (state) =>
                  state is TrendingSuccess ? state.trendingMovies : [],
            ),
            _buildMovieSection<UpcomingCubit, UpcomingState>(
              title: S.of(context).upcoming,
              cubit: context.read<UpcomingCubit>(),
              selector: (state) =>
                  state is UpcomingSuccess ? state.upcomingMovies : [],
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).padding.bottom + 16.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieSection<C extends Cubit<S>, S>({
    required String title,
    required C cubit,
    required List<MovieModel> Function(S state) selector,
    bool isContinueWatching = false,
    bool isCounterVisible = false,
  }) {
    return BlocSelector<C, S, List<MovieModel>>(
      bloc: cubit,
      selector: selector,
      builder: (context, movieList) {
        final isLoading = movieList.isEmpty;
        return isContinueWatching
            ? ContinueWatchingSection(
                title: title, movieList: movieList, isLoading: isLoading)
            : MovieListSection(
                title: title,
                movieList: movieList,
                isLoading: isLoading,
                isCounterVisible: isCounterVisible,
              );
      },
    );
  }
}
