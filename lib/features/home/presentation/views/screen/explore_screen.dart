import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/themes/app_assets.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../controller/genres/genres_cubit.dart';
import '../../controller/trending/trending_cubit.dart';
import '../widgets/movie_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genresCubit = context.watch<GenresCubit>();
    final trendingCubit = context.watch<TrendingCubit>();

    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
        left: 8.0,
        top: 4.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: 50,
              child: TextField(
                keyboardType: TextInputType.text,
                enableSuggestions: true,
                decoration: InputDecoration(
                  hintText: "بحث",
                  hintStyle: const TextStyle(color: Colors.white),
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppAssets.icons.search,
                        color: Colors.white,
                      ),
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
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.6,
                mainAxisExtent: 270,
              ),
              padding: EdgeInsets.all(0),
              itemCount: trendingCubit.trendingMoviesByWeek.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  index: index,
                  movie: trendingCubit.trendingMoviesByWeek[index],
                  genres: genresCubit.genres,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
