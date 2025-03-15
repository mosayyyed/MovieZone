import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../data/models/movie_details_model.dart';

class MovieSectionTitle extends StatelessWidget {
  final String title;
  final MovieDetailsModel? movie;

  const MovieSectionTitle({super.key, required this.title, this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          if (movie != null)
            Row(
              children: [
                Text(
                  movie?.voteAverage.toStringAsFixed(1) ?? '',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 4),
                RatingBar.builder(
                  itemSize: 20,
                  initialRating: (movie?.voteAverage ?? 0) / 2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ignoreGestures: true,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
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
