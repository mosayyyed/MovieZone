import 'package:equatable/equatable.dart';

class MovieVideosModel extends Equatable {
  final String name;
  final String key;
  final String type;
  final bool official;

  const MovieVideosModel({
    required this.name,
    required this.key,
    required this.type,
    required this.official,
  });
  factory MovieVideosModel.fromJson(Map<String, dynamic> json) {
    return MovieVideosModel(
      name: json['name'] ?? '',
      key: json['key'] ?? '',
      type: json['type'] ?? '',
      official: json['official'] ?? false,
    );
  }

  factory MovieVideosModel.fake() {
    return MovieVideosModel(
      name: 'fake',
      key: 'fake',
      type: 'fake',
      official: false,
    );
  }

  @override
  List<Object?> get props => [
        name,
        key,
        type,
        official,
      ];
}
