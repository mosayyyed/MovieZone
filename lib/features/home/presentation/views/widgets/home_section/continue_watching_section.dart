import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/routing/routes.dart';
import 'package:movie_app/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../data/models/movie_model.dart';
import '../continue_watching.dart';
import '../section_header.dart';

class ContinueWatchingSection extends StatelessWidget {
  final String title;
  final List<MovieModel> movieList;
  final bool isLoading;

  const ContinueWatchingSection({
    super.key,
    required this.title,
    required this.movieList,
    required this.isLoading,
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
                  },
                );
              }),
          isLoading
              ? Skeletonizer(
                  enabled: true,
                  ignoreContainers: true,
                  child: ContinueWatching(
                    trendingMovieModel:
                        List.generate(5, (index) => MovieModel.fake()),
                  ),
                )
              : ContinueWatching(trendingMovieModel: movieList),
        ],
      ),
    );
  }
}
