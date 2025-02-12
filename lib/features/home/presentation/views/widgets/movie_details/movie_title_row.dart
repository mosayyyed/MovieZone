import 'package:flutter/material.dart';
import '../../../../../../core/themes/app_styles.dart';
import '../../../../data/models/movie_details_model.dart';

class MovieTitleRow extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieTitleRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Styles.textStyle22
            .copyWith(fontWeight: FontWeight.bold, fontSize: 26),
        children: [
          TextSpan(
            text: movie.title,
            style: Styles.textStyle22.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              fontFamily: 'Cairo',
            ),
          ),
          TextSpan(
            text: ' (${DateTime.parse(movie.releaseDate).year.toString()})',
            style: Styles.textStyle22.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    );
  }
}
