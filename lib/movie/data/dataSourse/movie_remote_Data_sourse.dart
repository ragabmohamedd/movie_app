// ignore_for_file: non_constant_identifier_names, file_names

import 'package:dio/dio.dart';
import 'package:moviesapp/core/network/api_constance.dart';
import 'package:moviesapp/core/network/err_massage_model.dart';
import 'package:moviesapp/core/error/Exceptions.dart';
import 'package:moviesapp/movie/data/model/movies_details_model.dart';
import 'package:moviesapp/movie/data/model/movies_model.dart';
import 'package:moviesapp/movie/data/model/recommendation_model.dart';
import 'package:moviesapp/movie/domain/entities/Recommendation.dart';
import 'package:moviesapp/movie/domain/entities/movies_details.dart';
import 'package:moviesapp/movie/domain/usecase/get_Recommendation_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_movie_details_usecase.dart';

abstract class BaseMvieRemoteDataSourse {
  Future<List<MoviesModel>> GetPopularMovies();

  Future<List<MoviesModel>> GetNowPlayingMovies();
  Future<List<MoviesModel>> GetTopRatedMovies();
  Future<MoviesDetails> GetMovieDetails(MovieDetailsParameters parameters);
  Future<List<Recommendation>> GetRecommendation(
    Recommendationparameters parameters,
  );
}

class MovieRemoteDataSourse extends BaseMvieRemoteDataSourse {
  @override
  Future<List<MoviesModel>> GetNowPlayingMovies() async {
    final response = await Dio().get(ApiConstnace.getNowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MoviesModel>.from(
        (response.data['results'] as List).map((e) => MoviesModel.fromjson(e)),
      );
    } else {
      throw serverException(
        errMassageModele: ErrMassageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> GetPopularMovies() async {
    final Response = await Dio().get(ApiConstnace.popularMoviesPath);

    if (Response.statusCode == 200) {
      return List<MoviesModel>.from(
        (Response.data['results'] as List).map((e) => MoviesModel.fromjson(e)),
      );
    } else {
      throw serverException(
        errMassageModele: ErrMassageModel.fromjson(Response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> GetTopRatedMovies() async {
    final Response = await Dio().get(ApiConstnace.topRatedMoviesPath);

    if (Response.statusCode == 200) {
      return List<MoviesModel>.from(
        (Response.data['results'] as List).map((e) => MoviesModel.fromjson(e)),
      );
    } else {
      throw serverException(
        errMassageModele: ErrMassageModel.fromjson(Response.data),
      );
    }
  }

  @override
  Future<MoviesDetails> GetMovieDetails(
    MovieDetailsParameters parameters,
  ) async {
    try {
      final Response = await Dio().get(
        ApiConstnace.moviesDetailsPath(parameters.id),
      );

      if (Response.statusCode == 200) {
        return MoviesDetailsModel.fromjson((Response.data));
      } else {
        throw serverException(
          errMassageModele: ErrMassageModel.fromjson(Response.data),
        );
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Recommendation>> GetRecommendation(
    Recommendationparameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstnace.moviesRecommendationPath(parameters.id),
    );

    if (response.statusCode == 200) {
      return List<Recommendation>.from(
        (response.data['results'] as List).map(
          (e) => RecommendationModel.fromjson(e),
        ),
      );
    } else {
      throw serverException(
        errMassageModele: ErrMassageModel.fromjson(response.data),
      );
    }
  }
}
