import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;
  MoviesRepository({required this.baseMoviesRemoteDataSource});

  @override
  Future<Either<Failure, List<Movies>>> getNowPlaying() async{
    final result=await baseMoviesRemoteDataSource.getNowPlayingMovies();
    try{
      return Right(result);
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async{
    final result=await baseMoviesRemoteDataSource.getPopularMovies();
    try{
      return Right(result);
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async{
    final result=await baseMoviesRemoteDataSource.getTopRatedMovies();
    try{
      return Right(result);
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(int movieId) async{
    final result=await baseMoviesRemoteDataSource.getMovieDetails(id: movieId);
    try{
      return Right(result);
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendations(int movieId) async{
    final result=await baseMoviesRemoteDataSource.getRecommendations(id: movieId);
    try{
      return Right(result);
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

}