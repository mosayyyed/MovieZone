import 'package:flutter/material.dart';
import 'package:movie_app/src/features/home/presentation/views/ui/movie_details/movie_details_body.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return MovieDetailsBody();
  }
}
