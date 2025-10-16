import 'package:dartz/dartz.dart';
import 'package:moviesapp/core/error/failure.dart' show Failure;
import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/movie/domain/entities/movie.dart';
import 'package:moviesapp/movie/domain/repositry/base_movies_repositry.dart';

class GetPopularMoviesUseCase extends BaseUsecase<List<Movie>, Noparametars> {
  final BaseMoviesRepositry baseMoviesRepositry;

  GetPopularMoviesUseCase({required this.baseMoviesRepositry});
  @override
  Future<Either<Failure, List<Movie>>> call(Noparametars) async {
    return await baseMoviesRepositry.getPopularMovies();
  }
}
