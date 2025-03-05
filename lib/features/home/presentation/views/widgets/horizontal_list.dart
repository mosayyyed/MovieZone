import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/models/genre_model.dart';
import '../../controller/genres/genres_cubit.dart';
import 'movie_card.dart';

class HorizontalList extends StatelessWidget {
  final List<MovieModel> movieList;
  final bool isLoading;
  final bool isCounterVisible;

  const HorizontalList({
    super.key,
    required this.movieList,
    required this.isLoading,
    this.isCounterVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();

    return isLoading
        ? _buildSkeletonLoader()
        : _buildMovieList(genresCubit.genres);
  }

  Widget _buildMovieList(List<GenreModel> genres) {
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
            genres: genres,
            isCounterVisible: isCounterVisible,
          );
        },
      ),
    );
  }

  Widget _buildSkeletonLoader() {
    return SizedBox(
      height: 270,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 100,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 50,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(kBorderRadius),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
