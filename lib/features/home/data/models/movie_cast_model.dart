import 'package:movie_app/core/utils/app_constants.dart';

class MovieCastModel {
  final int id;
  final String name;
  final String character;
  final String profilePath;

  MovieCastModel({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  factory MovieCastModel.fromJson(Map<String, dynamic> json) {
    return MovieCastModel(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
      character: json['character'] ?? 'Unknown',
      profilePath: json['profile_path'] != null
          ? '$kFullImageUrl${json['profile_path']}'
          : '',
    );
  }
  factory MovieCastModel.fake() {
    return MovieCastModel(
      id: 45,
      name: "fake fake",
      character: "fake fake",
      profilePath: '$kFullImageUrl/djLVFETFTvPyVUdrd7aLVy',
    );
  }
}
