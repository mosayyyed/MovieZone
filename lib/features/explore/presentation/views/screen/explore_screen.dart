import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/build_input_decoration.dart';
import 'package:movie_app/features/explore/presentation/controller/cast/search_cubit.dart';
import 'package:movie_app/features/home/data/models/movie_model.dart';
import 'package:movie_app/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/trending/trending_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/movie_card.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/skip_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();
    final trendingCubit = context.watch<TrendingCubit>();
    final searchMoiveCubit = context.watch<SearchMoiveCubit>();
    Timer? debounce;
    void onSearchChanged(String query) {
      if (debounce?.isActive ?? false) debounce!.cancel();
      debounce = Timer(const Duration(milliseconds: 500), () {
        searchMoiveCubit.fetchMoviesByQuery(query);
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 100),
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
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  onChanged: onSearchChanged,
                  decoration: buildInputDecoration(
                    context: context,
                    labelText: "ابحث عن فيلم",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<SearchMoiveCubit, MovieSearchState>(
                builder: (context, state) {
                  if (state is MovieSearchLoading) {
                    return Skeletonizer(
                      enabled: true,
                      child: MoviesGridView(
                          movies:
                              List.generate(10, (index) => MovieModel.fake()),
                          genresCubit: genresCubit),
                    );
                  } else if (state is MovieSearchSuccess) {
                    if (state.movies.isEmpty) {
                      return Center(
                        child: Text(
                          "لا يوجد نتائج",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                      );
                    }
                    return MoviesGridView(
                        movies: state.movies, genresCubit: genresCubit);
                  } else if (state is MovieSearchError) {
                    return Center(
                      child: Text(
                        "Error: ${state.message}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return MoviesGridView(
                      movies: trendingCubit.trendingMoviesByDay,
                      genresCubit: genresCubit);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
        childAspectRatio: 0.6,
        mainAxisExtent: 270,
      ),
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
