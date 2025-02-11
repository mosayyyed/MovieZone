import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../controller/movie_details/movie_details_cubit.dart';
import '../widgets/movie_details/movie_details_content.dart';
import '../widgets/movie_details/movie_details_sliver_app_bar.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return const SkeletonScreen();
          } else if (state is MovieDetailsError) {
            return const Center(child: Text("حدث خطأ في تحميل البيانات"));
          } else if (state is MovieDetailsSuccess) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                MovieDetailsSliverAppBar(movie: state.movieDetailsModel),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [MovieDetailsContent(movie: state.movieDetailsModel)],
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class SkeletonScreen extends StatelessWidget {
  const SkeletonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      containersColor: Colors.black12,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}
