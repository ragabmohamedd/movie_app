// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/entities/movies_details.dart';
import 'package:moviesapp/movie/domain/repositry/base_movies_repositry.dart';

class GetMovieDetailsUsecase
    extends BaseUsecase<MoviesDetails, MovieDetailsParameters> {
  final BaseMoviesRepositry baseMoviesRepositry;

  GetMovieDetailsUsecase(this.baseMoviesRepositry);
  @override
  Future<Either<Failure, MoviesDetails>> call(
    MovieDetailsParameters parameters,
  ) async {
    return await baseMoviesRepositry.getMovieDetails(
      MovieDetailsParameters(id: parameters.id),
    );
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({required this.id});

  @override
  List<Object> get props => [id];
}
