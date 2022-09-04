import 'package:movies_app/movies/domain/entities/genres.dart';

class MovieDetail {
  final String backdropPath;
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int runtime;
  final List<Genres> genres;

  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.genres,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.runtime,
  });

  List<Object> get props => [
        backdropPath,
        id,
        title,
        overview,
        releaseDate,
        voteAverage,
        runtime,
        genres,
      ];
}


