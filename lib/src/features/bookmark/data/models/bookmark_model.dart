class BookmarkModel {
  final String movieId;
  final String title;
  final String posterPath;
  final String releaseDate;

  BookmarkModel({
    required this.movieId,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      movieId: json['movieId'] as String,
      title: json['title'] as String,
      posterPath: json['posterPath'] as String,
      releaseDate: json['releaseDate'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'title': title,
      'posterPath': posterPath,
      'releaseDate': releaseDate,
    };
  }
}
