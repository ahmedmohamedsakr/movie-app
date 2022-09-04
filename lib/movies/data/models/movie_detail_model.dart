import 'package:movies_app/movies/data/models/genres_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailModel extends MovieDetail {
  MovieDetailModel({
    required super.backdropPath,
    required super.id,
    required super.genres,
    required super.title,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.runtime,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      genres: List.from(
        json['genres'].map(
          (x) => GenresModel.fromJson(x),
        ),
      ),
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      runtime: json['runtime'],
    );
  }
}
