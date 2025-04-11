import 'package:movie_app/features/home/data/models/genre_model.dart';

String getGenreNames(List<int> movieGenreIds, List<GenreModel> genres) {
  return movieGenreIds
      .map((id) => genres
          .firstWhere(
            (genre) => genre.id == id,
            orElse: () => GenreModel(id: 0, name: 'Unknown'),
          )
          .name)
      .join(', ');
}
