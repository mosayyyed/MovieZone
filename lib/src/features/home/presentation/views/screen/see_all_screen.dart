import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/core/ui/arrow_back_with_title_app_bar.dart';
import 'package:movie_app/src/features/explore/presentation/views/ui/explore/movies_grid_view.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/presentation/controller/genres/genres_cubit.dart';

class SeeAllScreen extends StatelessWidget {
  final List<MovieModel> movies;
  final String title;
  const SeeAllScreen({super.key, required this.movies, required this.title});

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();
    return Scaffold(
      appBar: ArrowBackWithTitleAppBar(title: title),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16, vertical: 4.0),
        child: MoviesGridView(genresCubit: genresCubit, movies: movies),
      ),
    );
  }
}
