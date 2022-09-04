class AppConstance{
  // https://api.themoviedb.org/3/movie/now_playing?api_key=c3435cfe40aeb079689227d82bf921d3
  static const String baseUrl='https://api.themoviedb.org/3';
  static const String appKey='c3435cfe40aeb079689227d82bf921d3';
  static const String nowPlayingMoviesPath='$baseUrl/movie/now_playing?api_key=$appKey';
  static const String popularMoviesPath='$baseUrl/movie/popular?api_key=$appKey';
  static const String topRatedMoviesPath='$baseUrl/movie/top_rated?api_key=$appKey';
  static const String baseImageUrl='https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path)=> '$baseImageUrl$path';
  static String movieDetailPath({required int id})=> '$baseUrl/movie/$id?api_key=$appKey';
  static String recommendationsPath({required int id})=> '$baseUrl/movie/$id/recommendations?api_key=$appKey';

}