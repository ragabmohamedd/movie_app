class ApiConstnace {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'api_key=c79e12f1fb6e51b7ada61e9dc603dd59';

  static const String nowPlayingendPoint = 'movie/now_playing';
  static const String popularendPoint = 'movie/popular';
  static const String topRatedendPoint = 'movie/top_rated';
  static String moviesDetailsendPoint = 'movie/';

  static const String getNowPlayingMoviesPath =
      '$baseUrl/$nowPlayingendPoint?$apiKey';

  static const String popularMoviesPath = '$baseUrl/$popularendPoint?$apiKey';

  static const String topRatedMoviesPath = '$baseUrl/$topRatedendPoint?$apiKey';

  static String moviesDetailsPath(int movieid) =>
      '$baseUrl/$moviesDetailsendPoint$movieid?$apiKey';

  static String moviesRecommendationPath(int movieid) =>
      '$baseUrl/$moviesDetailsendPoint$movieid/recommendations?$apiKey';

  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imgUrl(String path) => '$baseImageUrl$path';
}
