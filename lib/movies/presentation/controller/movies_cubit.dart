import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitialState());

  static MoviesCubit get(context) => BlocProvider.of(context);

  List<Movies> nowPlayingMovies = [];
  List<Movies> popularMovies = [];
  List<Movies> topRatedMovies = [];

  void getNowPlayingMovies() async {
    ///Next commented codes are used before using Get_it
    // BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
    //     MoviesRemoteDataSource();
    // BaseMoviesRepository baseMoviesRepository = MoviesRepository(
    //     baseMoviesRemoteDataSource: baseMoviesRemoteDataSource);
    // final result = await GetNowPlayingMoviesUsecase(
    //   baseMoviesRepository: baseMoviesRepository,
    // )
    emit(NowPlayingMoviesLoadingState());
    sl<GetNowPlayingMoviesUsecase>().execute().then(
      (value) {
        value.fold(
          (l) {
            print(l.message);
            emit(NowPlayingMoviesErrorState(l.message));
          },
          (list) {
            nowPlayingMovies = list;
            emit(NowPlayingMoviesSuccessState());
          },
        );
      },
    );
  }

  void getPopularMovies() async {
    emit(PopularMoviesLoadingState());
    sl<GetPopularMoviesUsecase>().execute().then(
      (value) {
        value.fold(
          (l) {
            print(l.message);
            emit(PopularMoviesErrorState(l.message));
          },
          (list) {
            popularMovies = list;
            emit(PopularMoviesSuccessState());
          },
        );
      },
    );
  }

  void getTopRatedMovies() async {
    emit(TopRatedMoviesLoadingState());
    sl<GetTopRatedMoviesUsecase>().execute().then(
      (value) {
        value.fold(
          (l) {
            print(l.message);
            emit(TopRatedMoviesErrorState(l.message));
          },
          (list) {
            topRatedMovies = list;
            emit(TopRatedMoviesSuccessState());
          },
        );
      },
    );
  }


}
