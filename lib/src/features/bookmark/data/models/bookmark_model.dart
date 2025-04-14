class BookmarkModel {
  final String movieId;
  final String title;
  final String posterPath;
  final List<int> genreIds;
  final double voteAverage;

  BookmarkModel({
    required this.movieId,
    required this.title,
    required this.posterPath,
    required this.genreIds,
    required this.voteAverage,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      movieId: json['movieId'] as String,
      title: json['title'] as String,
      posterPath: json['posterPath'] as String,
      genreIds: (json['genreIds'] as List).map((e) => e as int).toList(),
      voteAverage: (json['voteAverage'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'title': title,
      'posterPath': posterPath,
      'genreIds': genreIds,
      'voteAverage': voteAverage,
    };
  }
}
