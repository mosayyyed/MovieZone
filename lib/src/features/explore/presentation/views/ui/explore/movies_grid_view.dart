import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/src/core/responsive_helper/device_utils.dart';
import 'package:movie_app/src/features/home/data/models/movie_model.dart';
import 'package:movie_app/src/features/home/presentation/controller/genres/genres_cubit.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/home_section/movie_card.dart';

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
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: DeviceUtils.valueDecider<double>(
              context,
              onMobile: 200.w,
              onTablet: 250.w,
              onDesktop: 280.w,
              onOther: 200.w,
            ) ??
            200.w,
        mainAxisSpacing: 8.h,
        crossAxisSpacing: 8.w,
        childAspectRatio: 0.545,
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
