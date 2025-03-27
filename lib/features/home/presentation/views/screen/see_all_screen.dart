import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/themes/app_values.dart';
import 'package:movie_app/features/explore/presentation/views/screen/explore_screen.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/skip_button.dart';

class SeeAllScreen extends StatelessWidget {
  final List<MovieModel> movies;
  final String title;
  const SeeAllScreen({super.key, required this.movies, required this.title});

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
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              SkipButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 22,
                ),
                hasBorderSide: true,
                onPressed: () => GoRouter.of(context).pop(),
              ),
              const SizedBox(width: AppSize.s8),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: AppSize.s20,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16, vertical: 4.0),
        child: MoviesGridView(genresCubit: genresCubit, movies: movies),
      ),
    );
  }
}
