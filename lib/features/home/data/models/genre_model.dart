import 'package:equatable/equatable.dart';

class GenreModel extends Equatable {
  final int id;
  final String name;

  const GenreModel({required this.id, required this.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'No Name',
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
