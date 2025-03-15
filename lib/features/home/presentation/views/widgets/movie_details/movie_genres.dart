import 'package:flutter/material.dart';

import '../../../../../../core/themes/app_styles.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../data/models/movie_details_model.dart';

class MovieGenres extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieGenres({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: movie.genres.map((genre) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withAlpha(150),
            borderRadius: BorderRadius.circular(kBorderRadius),
          ),
          child: Text(
            genre.name,
            style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w600),
          ),
        );
      }).toList(),
    );
  }
}
