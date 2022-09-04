import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_cubit.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_cubit.dart';

final sl=GetIt.instance;

class ServicesLocator{
  void init(){
    // sl.registerFactory(() => MoviesCubit());
    // sl.registerFactory(() => MoviesDetailsCubit());
    ///UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(baseMoviesRepository: sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(baseMoviesRepository:sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUsecase(baseMoviesRepository:sl()));
    sl.registerLazySingleton(() => GetMovieRecommendationsUsecase(baseMoviesRepository:sl()));
    ///MoviesRepository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(baseMoviesRemoteDataSource: sl()));
    ///MoviesRemoteDataSource
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource());
  }

}