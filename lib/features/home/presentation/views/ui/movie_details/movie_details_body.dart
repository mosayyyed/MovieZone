import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/controller/movie_details/movie_details_cubit.dart';
import 'package:movie_app/features/home/presentation/views/ui/movie_details/movie_details_scroll_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoading) {
            return Skeletonizer(
                enabled: true,
                child: MovieDetailsScrollView(
                  movieDetailsModel: state.fakeMovieDetailsModel,
                ));
          } else if (state is MovieDetailsSuccess) {
            return MovieDetailsScrollView(
              movieDetailsModel: state.movieDetailsModel,
            );
          } else if (state is MovieDetailsError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Icon(Icons.error));
        },
      ),
    );
  }
}
