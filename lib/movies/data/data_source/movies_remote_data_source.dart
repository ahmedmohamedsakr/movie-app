import 'package:dio/dio.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/movies/data/models/movies_model.dart';
import 'package:movies_app/movies/data/models/recommendations_model.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetailModel> getMovieDetails({required int id});

  Future<List<RecommendationsModel>> getRecommendations({required int id});
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map(
          (e) {
            return MoviesModel.fromJson(e);
          },
        ),
      );
    } else {
      //todo error: String is not a subtype of Map<String,dynamic>
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
      //todo: try this.
      // throw Exception(response.data['status_message']);
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['results'] as List)
          .map((e) => MoviesModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetails({required int id}) async {
    final response = await Dio().get(AppConstance.movieDetailPath(id: id));
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(
      {required int id}) async {
    final response = await Dio().get(AppConstance.recommendationsPath(id: id));
    if (response.statusCode == 200) {
      return  List<RecommendationsModel>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationsModel.fromJson(e),
        ),
      );
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
