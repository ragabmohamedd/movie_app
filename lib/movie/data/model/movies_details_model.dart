import 'package:moviesapp/movie/data/model/generes_model.dart';
import 'package:moviesapp/movie/domain/entities/movies_details.dart';

class MoviesDetailsModel extends MoviesDetails {
  MoviesDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseData,
    required super.runtime,
    required super.name,
    required super.voteAverge,
  });

  factory MoviesDetailsModel.fromjson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
        backdropPath: json['backdrop_path'] ?? '',
        genres: List<GeneresModel>.from(
          json['genres'].map((x) => GeneresModel.fromjson(x)),
        ),
        id: json['id'],
        overview: json['overview'] ?? '',
        releaseData: json['release_date'] ?? '',
        runtime: json['runtime'] ?? 0,
        name: json['title'] ?? json['name'] ?? '',
        voteAverge: json['vote_average']?.toDouble() ?? 0.0,
      );
}
