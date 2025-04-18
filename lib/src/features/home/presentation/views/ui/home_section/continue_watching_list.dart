import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/home_section/video_card.dart';

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
      height: 150.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movies.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          return VideoCard(
              movies: movies,
              movieVideosCubit: movieVideosCubit,
              progress: progress,
              index: index);
        },
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
      ),
    );
  }
}
