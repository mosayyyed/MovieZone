import 'package:movie_app/core/utils/constants.dart';

class MovieModel {
  final int id;
  final String title;
  final String originalTitle;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;

  MovieModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown Title',
      originalTitle: json['original_title'] ?? 'Unknown Original Title',
      posterPath: json['poster_path'] != null
          ? '$kFullImageUrl${json['poster_path']}'
          : '',
      backdropPath: json['backdrop_path'] != null
          ? '$kFullImageUrl${json['backdrop_path']}'
          : '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }

  factory MovieModel.fake() {
    return MovieModel(
      id: 1126166,
      title: "Flight Risk",
      originalTitle: "Flight Risk",
      backdropPath: "$kFullImageUrl/b3mdmjYTEL70j7nuXATUAD9qgu4.jpg",
      posterPath: "$kFullImageUrl/srmH9BNiZp43NMhWCZy2ZARfxpC.jpg",
      voteAverage: 8.6,
      voteCount: 396,
      genreIds: [18, 80],
    );
  }
}
