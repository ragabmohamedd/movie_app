import 'package:moviesapp/movie/domain/entities/Recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({super.backdrobpath, required super.id});

  factory RecommendationModel.fromjson(Map<String, dynamic> json) =>
      RecommendationModel(
        id: json['id'],
        backdrobpath:
            json['backdrop_path'] ?? '/jdHsptJbtalEuVhCV5i7kSC3g0x.jpg',
      );
}
