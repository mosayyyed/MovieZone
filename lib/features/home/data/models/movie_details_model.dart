import 'package:movie_app/core/utils/constants.dart';
import 'package:movie_app/features/home/data/models/ProductionCompaniesModel.dart';

import 'genre_model.dart';

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

  factory MovieDetailsModel.fake() {
    return MovieDetailsModel(
        id: 1126166,
        title: "Flight Risk",
        originalTitle: "Flight Risk",
        backdropPath: "$kFullImageUrl/b3mdmjYTEL70j7nuXATUAD9qgu4.jpg",
        posterPath: "$kFullImageUrl/srmH9BNiZp43NMhWCZy2ZARfxpC.jpg",
        voteAverage: 8.6,
        voteCount: 396,
        budget: 354,
        genres: [
          {"id": 14, "name": "فانتازيا"},
          {"id": 18, "name": "دراما"},
          {"id": 80, "name": "جريمة"}
        ].map((x) => GenreModel.fromJson(x)).toList(),
        overview:
            "حكاية خارقة للطبيعة على ذمة الإعدام في سجن جنوبي ، حيث يمتلك العملاق اللطيف جون كوفي القوة الغامضة لعلاج أمراض الناس. عندما يتعرف حارس المبنى الرئيسي ، بول إدجكومب ، على هدية كوفي المعجزة ، يحاول يائسًا المساعدة في تجنب إعدام الرجل المدان.",
        tagLine: "المعجزات تحدث.",
        revenue: 23000000,
        popularity: 8.5,
        releaseDate: "2025-01-28T15:15:02.000Z",
        productionCompanies: [
          {"iso_3166_1": "US", "name": "United States of America"}
        ].map((x) => ProductionCompaniesModel.fromJson(x)).toList());
  }
}
