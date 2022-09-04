import 'package:movies_app/movies/domain/entities/genres.dart';

class GenresModel extends Genres {
  GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json['id'],
        name: json['name'],
      );
}
