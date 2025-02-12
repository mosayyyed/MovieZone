import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/themes/app_assets.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../home/presentation/controller/genres/genres_cubit.dart';
import '../../../../home/presentation/controller/trending/trending_cubit.dart';
import '../../../../home/presentation/views/widgets/movie_card.dart';
import '../../controller/cast/search_cubit.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();
    final trendingCubit = context.watch<TrendingCubit>();
    final searchMoiveCubit = context.watch<SearchMoiveCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        children: [
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 50,
              child: TextField(
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                onChanged: (value) {
                  searchMoiveCubit.fetchMoviesByQuery(value);
                },
                decoration: InputDecoration(
                  hintText: "بحث",
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AppAssets.icons.search,
                      color: Colors.white,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(kBorderRadius),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(8),
                  filled: true,
                  fillColor: AppColors.kFillColor,
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
                      crossAxisCount: 3,
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

                // Default display when there's no search query
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
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
    );
  }
}
