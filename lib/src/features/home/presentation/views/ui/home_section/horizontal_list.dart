import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
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
      height: 275,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movieList.length,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movieList[index],
            index: index,
            genres: genresCubit.genres,
            isCounterVisible: isCounterVisible,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: AppSize.s8),
      ),
    );
  }
}
