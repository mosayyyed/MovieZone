import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../controller/genres/genres_cubit.dart';
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
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movieList.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movieList[index],
            index: index,
            genres: genresCubit.genres,
            isCounterVisible: isCounterVisible,
          );
        },
      ),
    );
  }
}
