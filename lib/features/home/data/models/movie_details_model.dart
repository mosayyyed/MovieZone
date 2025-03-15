import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/home/data/models/ProductionCompaniesModel.dart';

import 'genre_model.dart';
import 'movie_cast_model.dart';
import 'movie_videos_model.dart';

class MovieDetailsModel {
  final int id;
  final String title;
  final String originalTitle;
  final String tagLine;
  final List<GenreModel> genres;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final String releaseDate;
  final int budget;
  final int revenue;
  final List<ProductionCompaniesModel> productionCompanies;
  final List<MovieCastModel> cast;
  final List<MovieVideosModel> videos;

  MovieDetailsModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.tagLine,
    required this.genres,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.releaseDate,
    required this.productionCompanies,
    required this.budget,
    required this.revenue,
    this.cast = const [],
    this.videos = const [],
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'غير متوفر',
      originalTitle: json['original_title'] ?? 'غير متوفر',
      tagLine: json['tagline'] ?? '',
      genres: (json['genres'] as List?)
              ?.map((x) => GenreModel.fromJson(x))
              .toList() ??
          [],
      overview: json['overview'] ?? 'لا يوجد وصف متاح',
      posterPath: json['poster_path'] != null
          ? kFullImageUrl + json['poster_path']
          : '',
      backdropPath: json['backdrop_path'] != null
          ? kFullImageUrl + json['backdrop_path']
          : '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      popularity: (json['popularity'] ?? 0).toDouble(),
      releaseDate: json['release_date'] ?? 'غير متوفر',
      productionCompanies: (json['production_companies'] as List?)
              ?.map((x) => ProductionCompaniesModel.fromJson(x))
              .where((company) => company.logoPath.isNotEmpty)
              .toList() ??
          [],
      budget: json['budget'] ?? 0,
      revenue: json['revenue'] ?? 0,
    );
  }
  MovieDetailsModel copyWith({
    List<MovieCastModel>? cast,
    List<MovieVideosModel>? videos,
  }) {
    return MovieDetailsModel(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath,
      voteAverage: voteAverage,
      backdropPath: backdropPath,
      voteCount: voteCount,
      popularity: popularity,
      releaseDate: releaseDate,
      productionCompanies: productionCompanies,
      budget: budget,
      genres: genres,
      originalTitle: originalTitle,
      revenue: revenue,
      tagLine: tagLine,
      cast: cast ?? this.cast,
      videos: videos ?? this.videos,
    );
  }
}
