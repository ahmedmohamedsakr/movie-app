abstract class MoviesDetailsState{}

class MovieDetailsInitState extends MoviesDetailsState{}

///Movie Details States.
class MovieDetailsLoadingState extends MoviesDetailsState{}
class MovieDetailsSuccessState extends MoviesDetailsState{}
class MovieDetailsErrorState extends MoviesDetailsState{
  final String error;
  MovieDetailsErrorState(this.error);
}
///Movie Recommendations States.
class MovieRecommendationLoadingState extends MoviesDetailsState{}
class MovieRecommendationSuccessState extends MoviesDetailsState{}
class MovieRecommendationErrorState extends MoviesDetailsState{
  final String error;
  MovieRecommendationErrorState(this.error);
}