import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../core/themes/app_values.dart';
import '../../../../data/models/movie_details_model.dart';

class MovieSectionTitle extends StatelessWidget {
  final String title;
  final MovieDetailsModel? movie;

  const MovieSectionTitle({super.key, required this.title, this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          const Spacer(),
          if (movie != null)
            Row(
              children: [
                Text(
                  movie?.voteAverage.toStringAsFixed(1) ?? '',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(width: AppSize.s4.w),
                RatingBar.builder(
                  itemSize: 20.sp,
                  initialRating: (movie?.voteAverage ?? 0) / 2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                  itemBuilder: (context, _) => Icon(
                    Icons.star_rounded,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onRatingUpdate: (double value) {},
                ),
              ],
            ),
        ],
      ),
    );
  }
}
