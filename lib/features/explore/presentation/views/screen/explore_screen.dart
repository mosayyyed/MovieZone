import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/utils/build_input_decoration.dart';
import 'package:movie_app/features/explore/presentation/controller/cast/search_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/features/home/presentation/controller/trending/trending_cubit.dart';
import 'package:movie_app/features/home/presentation/views/widgets/movie_card.dart';
import 'package:movie_app/features/onboarding/presentation/widgets/skip_button.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();
    final trendingCubit = context.watch<TrendingCubit>();
    final searchMoiveCubit = context.watch<SearchMoiveCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SkipButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).colorScheme.onSurface,
              size: 22,
            ),
            hasBorderSide: true,
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Column(
          children: [
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 70,
                child: TextField(
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  onChanged: (value) {
                    searchMoiveCubit.fetchMoviesByQuery(value);
                  },
                  decoration: buildInputDecoration(
                    context: context,
                    labelText: "بحث",
                    hintText: "ابحث عن فيلم",
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: BlocBuilder<SearchMoiveCubit, MovieSearchState>(
                builder: (context, state) {
                  if (state is MovieSearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MovieSearchSuccess) {
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.6,
                        mainAxisExtent: 270,
                      ),
                      padding: EdgeInsets.zero,
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          index: index,
                          movie: state.movies[index],
                          genres: genresCubit.genres,
                        );
                      },
                    );
                  } else if (state is MovieSearchError) {
                    return Center(
                      child: Text(
                        "Error: ${state.message}",
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisExtent: 270,
                    ),
                    padding: EdgeInsets.zero,
                    itemCount: trendingCubit.trendingMoviesByWeek.length,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        index: index,
                        movie: trendingCubit.trendingMoviesByWeek[index],
                        genres: genresCubit.genres,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
