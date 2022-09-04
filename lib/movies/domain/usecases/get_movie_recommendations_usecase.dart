import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieRecommendationsUsecase {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieRecommendationsUsecase({required this.baseMoviesRepository});

  Future<Either<Failure, List<Recommendations>>> execute({required int movieId}) async {
    return await baseMoviesRepository.getRecommendations(movieId);
  }
}
