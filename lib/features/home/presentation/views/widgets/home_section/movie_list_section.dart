import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../data/models/movie_model.dart';
import '../horizontal_list.dart';
import '../section_header.dart';

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
          SectionHeader(title: title, onSeeAll: () {}),
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
