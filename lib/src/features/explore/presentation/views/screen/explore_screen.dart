import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/core/utils/build_input_decoration.dart';
import 'package:movie_app/src/features/explore/presentation/controller/cast/search_cubit.dart';
import 'package:movie_app/src/features/explore/presentation/views/ui/explore/movies_grid_view.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/src/features/home/presentation/controller/trending/trending_cubit.dart';
import 'package:movie_app/src/features/onboarding/presentation/ui/skip_button.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  Timer? _debounce;

  void _onSearchChanged(String query, SearchMovieCubit searchMoiveCubit) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchMoiveCubit.fetchMoviesByQuery(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.read<GenresCubit>();
    final trendingCubit = context.read<TrendingCubit>();
    final searchMoiveCubit = context.read<SearchMovieCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 100.h),
          child: Row(
            children: [
              SkipButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).colorScheme.onSurface,
                  size: 22.sp,
                ),
                hasBorderSide: true,
                onPressed: () => GoRouter.of(context).pop(),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                  enableSuggestions: true,
                  onChanged: (query) =>
                      _onSearchChanged(query, searchMoiveCubit),
                  decoration: buildInputDecoration(
                    context: context,
                    labelText: S.of(context).searchForYourFavoriteMovies,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16.w,
          vertical: AppPadding.p4.h,
        ),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<SearchMovieCubit, MovieSearchState>(
                builder: (context, state) {
                  if (state is MovieSearchLoading) {
                    return Skeletonizer(
                      enabled: true,
                      child: MoviesGridView(
                        movies: List.generate(10, (index) => MovieModel.fake()),
                        genresCubit: genresCubit,
                      ),
                    );
                  } else if (state is MovieSearchSuccess) {
                    if (state.movies.isEmpty) {
                      return Center(
                        child: Text(
                          S.of(context).noDataAvailable,
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
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }
                  return MoviesGridView(
                    movies: trendingCubit.trendingMoviesByDay,
                    genresCubit: genresCubit,
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
