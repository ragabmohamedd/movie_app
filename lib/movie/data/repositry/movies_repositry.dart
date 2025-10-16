import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/Exceptions.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/movie/data/dataSourse/movie_remote_Data_sourse.dart';
import 'package:moviesapp/movie/domain/entities/Recommendation.dart';
import 'package:moviesapp/movie/domain/entities/movie.dart';
import 'package:moviesapp/movie/domain/entities/movies_details.dart';
import 'package:moviesapp/movie/domain/repositry/base_movies_repositry.dart';
import 'package:moviesapp/movie/domain/usecase/get_Recommendation_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_movie_details_usecase.dart';

class MoviesRepositry extends BaseMoviesRepositry {
  final BaseMvieRemoteDataSourse baseMvieRemoteDataSourse;

  MoviesRepositry({required this.baseMvieRemoteDataSourse});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await baseMvieRemoteDataSourse.GetNowPlayingMovies();

      return right(result);
    } on serverException catch (failure) {
      return left(
        serverFailure(massage: failure.errMassageModele.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMvieRemoteDataSourse.GetPopularMovies();

    try {
      return right(result);
    } on serverException catch (failure) {
      return left(
        serverFailure(massage: failure.errMassageModele.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMvieRemoteDataSourse.GetTopRatedMovies();

    try {
      return right(result);
    } on serverException catch (failure) {
      return left(
        serverFailure(massage: failure.errMassageModele.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, MoviesDetails>> getMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    final result = await baseMvieRemoteDataSourse.GetMovieDetails(
      MovieDetailsParameters(id: parameters.id),
    );

    try {
      return right(result);
    } on serverException catch (failure) {
      return left(
        serverFailure(massage: failure.errMassageModele.statusMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> GetRecommendation(
    Recommendationparameters parameters,
  ) async {
    final result = await baseMvieRemoteDataSourse.GetRecommendation(parameters);

    try {
      return right(result);
    } on serverException catch (failure) {
      return left(
        serverFailure(massage: failure.errMassageModele.statusMessage),
      );
    }
  }
}
