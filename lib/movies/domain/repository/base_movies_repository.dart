import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlaying();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetails(int movieId);

  Future<Either<Failure, List<Recommendations>>> getRecommendations(int movieId);
}
