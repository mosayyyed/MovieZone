import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/themes/app_values.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/views/ui/home_section/video_card.dart';

import '../../../controller/MovieVideos/movie_videos_cubit.dart';

class ContinueWatchingList extends StatelessWidget {
  final List<MovieModel> movies;

  const ContinueWatchingList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    final List<double> progress =
        movies.map((movie) => movie.voteAverage / 10).toList();

    final movieVideosCubit = context.watch<MovieVideosCubit>();

    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movies.length,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        itemBuilder: (context, index) {
          return VideoCard(
              movies: movies,
              movieVideosCubit: movieVideosCubit,
              progress: progress,
              index: index);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}
