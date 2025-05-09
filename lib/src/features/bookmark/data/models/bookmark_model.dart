import 'package:equatable/equatable.dart';

class BookmarkModel extends Equatable {
  final String movieId;
  final String title;
  final String posterPath;
  final List<int> genreIds;
  final double voteAverage;
  final DateTime createdAt;

  const BookmarkModel({
    required this.movieId,
    required this.title,
    required this.posterPath,
    required this.genreIds,
    required this.voteAverage,
    required this.createdAt,
  });

  factory BookmarkModel.fromJson(Map<String, dynamic> json) {
    return BookmarkModel(
      movieId: json['movieId'] as String,
      title: json['title'] as String,
      posterPath: json['posterPath'] as String,
      genreIds: (json['genreIds'] as List).map((e) => e as int).toList(),
      voteAverage: (json['voteAverage'] ?? 0).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'movieId': movieId,
      'title': title,
      'posterPath': posterPath,
      'genreIds': genreIds,
      'voteAverage': voteAverage,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory BookmarkModel.fake() {
    return BookmarkModel(
      movieId: '1',
      title: 'Title',
      posterPath: '/zfbjgQE1uSd9wiPTX4VzsLi0rGG.jpg',
      genreIds: [1, 2, 3],
      voteAverage: 5.0,
      createdAt: DateTime.now(),
    );
  }

  @override
  List<Object?> get props =>
      [movieId, title, posterPath, genreIds, voteAverage, createdAt];
}
