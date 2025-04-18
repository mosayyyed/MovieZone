import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/generated/l10n.dart';
import 'package:movie_app/src/core/themes/app_values.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/movie_details/productiion_companies_section.dart';
import 'package:readmore/readmore.dart';

import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../data/models/movie_details_model.dart';
import 'movie_cast_list.dart';
import 'movie_genres.dart';
import 'movie_section_title.dart';
import 'movie_title_row.dart';
import 'movie_videos_section.dart';

class MovieDetailsContent extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieDetailsContent({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieTitleRow(movie: movie),
          SizedBox(height: AppSize.s4.h),
          if (movie.tagLine.isNotEmpty)
            Text(
              movie.tagLine,
              style: Styles.textStyle16.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          SizedBox(height: AppSize.s8.h),
          Skeleton.replace(
            replacement: const Icon(Icons.image),
            child: MovieGenres(movie: movie),
          ),
          SizedBox(height: AppSize.s8.h),
          MovieSectionTitle(title: S.current.description, movie: movie),
          movie.overview.isNotEmpty
              ? ReadMoreText(
                  movie.overview,
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  colorClickableText: Theme.of(context).colorScheme.primary,
                  style: Styles.textStyle16.copyWith(fontSize: 16.sp),
                  lessStyle: Styles.textStyle16.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                  trimCollapsedText: S.current.more,
                  trimExpandedText: S.current.less,
                  moreStyle: Styles.textStyle16.copyWith(
                    fontSize: 16.sp,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                )
              : SizedBox(
                  height: 150.h,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      S.current.noDescriptionAvailable,
                      style: Styles.textStyle16.copyWith(fontSize: 16.sp),
                    ),
                  ),
                ),
          SizedBox(height: AppSize.s8.h),
          MovieSectionTitle(title: S.current.trailers),
          MovieVideosSection(),
          SizedBox(height: AppSize.s8.h),
          MovieSectionTitle(title: S.current.cast),
          MovieCastList(),
          SizedBox(height: AppSize.s8.h),
          ProductionCompaniesSection(movie: movie),
        ],
      ),
    );
  }
}
