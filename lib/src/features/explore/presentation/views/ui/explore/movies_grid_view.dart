import 'package:flutter/material.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/home_section/movie_card.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({
    super.key,
    required this.genresCubit,
    required this.movies,
  });

  final GenresCubit genresCubit;
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: 292),
      padding: EdgeInsets.zero,
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(
          index: index,
          movie: movies[index],
          genres: genresCubit.genres,
        );
      },
    );
  }
}
