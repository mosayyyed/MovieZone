import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/views/widgets/movie_details/productiion_companies_section.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../core/themes/app_colors.dart';
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieTitleRow(movie: movie),
          const SizedBox(height: 4),
          if (movie.tagLine.isNotEmpty)
            Text(
              movie.tagLine,
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
            ),
          const SizedBox(height: 8),
          MovieGenres(movie: movie),
          const SizedBox(height: 8),
          MovieSectionTitle(title: "الوصف", movie: movie),
          movie.overview.isNotEmpty
              ? ReadMoreText(
                  movie.overview,
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  colorClickableText: AppColors.kPrimaryColor,
                  style: Styles.textStyle16.copyWith(fontSize: 16),
                  lessStyle: Styles.textStyle16.copyWith(
                    color: AppColors.kPrimaryColor.withAlpha(200),
                    fontWeight: FontWeight.bold,
                  ),
                  trimCollapsedText: 'المزيد',
                  trimExpandedText: ' أقل',
                  moreStyle: Styles.textStyle16.copyWith(
                    fontSize: 16,
                    color: AppColors.kPrimaryColor.withAlpha(200),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.justify,
                )
              : SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "لا يوجد وصف",
                      style: Styles.textStyle16.copyWith(fontSize: 16),
                    ),
                  ),
                ),
          const SizedBox(height: 8),
          MovieSectionTitle(title: "تريلرات"),
          MovieVideosSection(),
          const SizedBox(height: 8),
          MovieSectionTitle(title: "طاقم العمل"),
          MovieCastList(),
          const SizedBox(height: 8),
          ProductionCompaniesSection(movie: movie),
        ],
      ),
    );
  }
}
