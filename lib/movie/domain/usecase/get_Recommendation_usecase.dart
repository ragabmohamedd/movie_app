import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/error/failure.dart';
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/entities/Recommendation.dart';
import 'package:moviesapp/movie/domain/repositry/base_movies_repositry.dart';

class GetRecommendationUsecase
    extends BaseUsecase<List<Recommendation>, Recommendationparameters> {
  final BaseMoviesRepositry baseMoviesRepositry;

  GetRecommendationUsecase(this.baseMoviesRepositry);
  @override
  Future<Either<Failure, List<Recommendation>>> call(
    Recommendationparameters parameters,
  ) async {
    return await baseMoviesRepositry.GetRecommendation(parameters);
  }
}

class Recommendationparameters extends Equatable {
  final int id;

  const Recommendationparameters({required this.id});

  @override
  List<Object> get props => [id];
}
