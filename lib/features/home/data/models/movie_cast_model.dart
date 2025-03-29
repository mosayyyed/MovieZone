import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/app_constants.dart';

class MovieCastModel extends Equatable {
  final int id;
  final String name;
  final String character;
  final String profilePath;

  const MovieCastModel({
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
          ? '${AppConstants.api.imageUrl}${json['profile_path']}'
          : '',
    );
  }
  factory MovieCastModel.fake() {
    return MovieCastModel(
      id: 45,
      name: "fake fake",
      character: "fake fake",
      profilePath: '${AppConstants.api.imageUrl}/djLVFETFTvPyVUdrd7aLVy',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        character,
        profilePath,
      ];
}
