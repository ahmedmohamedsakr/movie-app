import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUsecase {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUsecase({required this.baseMoviesRepository});

  Future<Either<Failure, List<Movies>>> execute() async {
    return await baseMoviesRepository.getNowPlaying();
  }
}
