import 'package:movies_app/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  RecommendationsModel({required super.id, required super.backdropPath});

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) =>
      RecommendationsModel(
        id:json['id'],
        backdropPath:json['backdrop_path']??'/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg',
      );
}
