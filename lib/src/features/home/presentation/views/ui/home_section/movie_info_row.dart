import 'package:flutter/material.dart';
import 'package:movie_app/src/core/utils/get_genres_names.dart';
import 'package:movie_app/src/features/home/data/models/genre_model.dart';

class MovieInfoRow extends StatelessWidget {
  final double voteAverage;
  final List<int> genreIds;
  final List<GenreModel> genres;
  final bool isExpanded;

  const MovieInfoRow(
      {super.key,
      required this.voteAverage,
      required this.genreIds,
      required this.genres,
      this.isExpanded = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rate_rounded,
            color: Theme.of(context).colorScheme.primary, size: 18),
        const SizedBox(width: 4),
        Text(
          voteAverage.toStringAsFixed(1),
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(width: 4),
        Text("|",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
        const SizedBox(width: 4),
        isExpanded
            ? Expanded(
                child: Text(
                  getGenreNames(genreIds, genres),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.onSurface),
                ),
              )
            : Text(
                getGenreNames(genreIds, genres),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
      ],
    );
  }
}
