import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUsecase {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUsecase({required this.baseMoviesRepository});

  Future<Either<Failure, MovieDetail>> execute({required int movieId}) async {
    return await baseMoviesRepository.getMovieDetails(movieId);
  }
}