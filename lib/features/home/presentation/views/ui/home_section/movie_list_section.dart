import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/home/presentation/controller/MovieVideos/movie_videos_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../data/models/movie_model.dart';
import 'horizontal_list.dart';
import 'section_header.dart';

class MovieListSection extends StatelessWidget {
  final String title;
  final List<MovieModel> movieList;
  final bool isLoading;
  final bool isCounterVisible;

  const MovieListSection({
    super.key,
    required this.title,
    required this.movieList,
    required this.isLoading,
    this.isCounterVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
              title: title,
              onSeeAll: () {
                GoRouter.of(context).push(
                  AppRoutes.kSeeAllRoute,
                  extra: {
                    'genresCubit': context.read<GenresCubit>(),
                    'movies': movieList,
                    'movieVideosCubit': context.read<MovieVideosCubit>(),
                    'title': title,
                  },
                );
              }),
          isLoading
              ? Skeletonizer(
                  enabled: true,
                  ignoreContainers: true,
                  child: HorizontalList(
                    isCounterVisible: false,
                    movieList: List.generate(10, (index) => MovieModel.fake()),
                  ),
                )
              : HorizontalList(
                  movieList: movieList,
                  isCounterVisible: isCounterVisible,
                ),
        ],
      ),
    );
  }
}
