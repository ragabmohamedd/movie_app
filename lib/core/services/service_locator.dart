import 'package:get_it/get_it.dart' show GetIt;
import 'package:moviesapp/movie/data/dataSourse/movie_remote_Data_sourse.dart';
import 'package:moviesapp/movie/data/repositry/movies_repositry.dart';
import 'package:moviesapp/movie/domain/repositry/base_movies_repositry.dart';
import 'package:moviesapp/movie/domain/usecase/get_Recommendation_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_movie_details_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_now_playing_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_popular_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_top_rated_usecase.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///useCase
    sl.registerLazySingleton(
      () => (GetNowPlayingUsecase(baseMoviesRepositry: sl())),
    );

    sl.registerLazySingleton(
      () => (GetPopularMoviesUseCase(baseMoviesRepositry: sl())),
    );

    sl.registerLazySingleton(
      () => (GetTopRatedMoviesUseCase(baseMoviesRepositry: sl())),
    );

    sl.registerLazySingleton(() => (GetRecommendationUsecase(sl())));

    sl.registerLazySingleton(() => (GetMovieDetailsUsecase(sl())));

    ///Repository
    sl.registerLazySingleton<BaseMoviesRepositry>(
      () => (MoviesRepositry(baseMvieRemoteDataSourse: sl())),
    );

    ///Data Source
    sl.registerLazySingleton<BaseMvieRemoteDataSourse>(
      () => (MovieRemoteDataSourse()),
    );
  }
}
