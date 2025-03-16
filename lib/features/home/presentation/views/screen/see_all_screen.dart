import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/features/explore/presentation/views/screen/explore_screen.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/skip_button.dart';

class SeeAllScreen extends StatelessWidget {
  final List<MovieModel> movies;
  const SeeAllScreen({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 100),
          child: SkipButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).colorScheme.onSurface,
              size: 22,
            ),
            hasBorderSide: true,
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
      ),
      body: MoviesGridView(genresCubit: genresCubit, movies: movies),
    );
  }
}
