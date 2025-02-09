class MovieVideosModel {
  final String name;
  final String key;
  final String type;
  final bool official;

  MovieVideosModel({
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
}
