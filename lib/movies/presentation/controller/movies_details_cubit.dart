import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_recommendations_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_details_state.dart';

class MoviesDetailsCubit extends Cubit<MoviesDetailsState>{
  MoviesDetailsCubit():super(MovieDetailsInitState());

  static MoviesDetailsCubit get(context)=>BlocProvider.of(context);
  MovieDetail? movieDetails;

  Future<void> getMovieDetails({required int movieId}) async{
    emit(MovieDetailsLoadingState());
    final result = await sl<GetMovieDetailsUsecase>().execute(movieId: movieId);
    result.fold(
          (l) {
        emit(MovieDetailsErrorState(l.message));
      },
          (list) {
        movieDetails = list; //liskove substitution
        emit(MovieDetailsSuccessState());
      },
    );
  }

  List<Recommendations> movieRecommendations = [];

  Future<void> getMovieRecommendations({required int movieId}) async {
    emit(MovieRecommendationLoadingState());
    final result =
    await sl<GetMovieRecommendationsUsecase>().execute(movieId: movieId);
    result.fold(
          (l) {
        emit(MovieRecommendationErrorState(l.message));
      },
          (list) {
        movieRecommendations = list;
        emit(MovieRecommendationSuccessState());
      },
    );
  }

}//cubit class.