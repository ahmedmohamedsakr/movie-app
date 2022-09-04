part of 'movies_cubit.dart';

abstract class MoviesState {}

class MoviesInitialState extends MoviesState {}

///NowPlaying Movies States.
class NowPlayingMoviesLoadingState extends MoviesState{}
class NowPlayingMoviesSuccessState extends MoviesState{}
class NowPlayingMoviesErrorState extends MoviesState{
  final String error;
  NowPlayingMoviesErrorState(this.error);
}
///Popular Movies States.
class PopularMoviesLoadingState extends MoviesState{}
class PopularMoviesSuccessState extends MoviesState{}
class PopularMoviesErrorState extends MoviesState{
  final String error;
  PopularMoviesErrorState(this.error);
}

///TopRated Movies States.
class TopRatedMoviesLoadingState extends MoviesState{}
class TopRatedMoviesSuccessState extends MoviesState{}
class TopRatedMoviesErrorState extends MoviesState{
  final String error;
  TopRatedMoviesErrorState(this.error);
}
