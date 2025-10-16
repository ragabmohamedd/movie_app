import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/movie/domain/entities/Recommendation.dart';
import 'package:moviesapp/movie/domain/entities/movie.dart';
import 'package:moviesapp/movie/domain/entities/movies_details.dart';
import 'package:moviesapp/movie/domain/usecase/get_Recommendation_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_movie_details_usecase.dart';

abstract class BaseMoviesRepositry {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure, List<Movie>>> getPopularMovies();

  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MoviesDetails>> getMovieDetails(
    MovieDetailsParameters parameters,
  );

  Future<Either<Failure, List<Recommendation>>> GetRecommendation(
    Recommendationparameters parameters,
  );
}
