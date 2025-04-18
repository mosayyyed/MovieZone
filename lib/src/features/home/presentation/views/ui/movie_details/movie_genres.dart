import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../data/models/movie_details_model.dart';

class MovieGenres extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieGenres({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.sp,
      runSpacing: 8.sp,
      children: movie.genres.map((genre) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Text(
            genre.name,
            style: Styles.textStyle12.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }
}
