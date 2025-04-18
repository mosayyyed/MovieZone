import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';

import '../../../controller/genres/genres_cubit.dart';
import 'movie_card.dart';

class HorizontalList extends StatelessWidget {
  final List<MovieModel> movieList;
  final bool isCounterVisible;

  const HorizontalList({
    super.key,
    required this.movieList,
    this.isCounterVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();
    return SizedBox(
      height: 275.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movieList.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          return SizedBox(
              width: 148.w,
              child: MovieCard(
                movie: movieList[index],
                index: index,
                genres: genresCubit.genres,
                isCounterVisible: isCounterVisible,
              ));
        },
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
      ),
    );
  }
}
