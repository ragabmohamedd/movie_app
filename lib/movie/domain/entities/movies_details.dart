import 'package:equatable/equatable.dart';
import 'package:moviesapp/movie/domain/entities/genres.dart';

class MoviesDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final int id;
  final String overview;
  final String releaseData;
  final int runtime;
  final String name;
  final double voteAverge;

  const MoviesDetails({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.releaseData,
    required this.runtime,
    required this.name,
    required this.voteAverge,
  });

  @override
  List<Object> get props {
    return [
      backdropPath,
      id,
      overview,
      releaseData,
      runtime,
      name,
      voteAverge,
      genres,
    ];
  }
}
