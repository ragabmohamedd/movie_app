part of 'moviesdetails_bloc.dart';

class MoviesdetailsState extends Equatable {
  const MoviesdetailsState({
    this.moviesDetails,
    this.moviesDetailsState = RequestState.loading,
    this.movieDetailsmassage = '',

    this.moviesRecomendation = const [],
    this.moviesRecomendationState = RequestState.loading,
    this.moviesRecomendationMassage = '',
  });

  final MoviesDetails? moviesDetails;
  final RequestState moviesDetailsState;
  final String movieDetailsmassage;

  final List<Recommendation> moviesRecomendation;
  final RequestState moviesRecomendationState;
  final String moviesRecomendationMassage;

  MoviesdetailsState copywith({
    MoviesDetails? moviesDetails,
    RequestState? moviesDetailsState,
    String? movieDetailsmassage,

    List<Recommendation>? moviesRecomendation,
    RequestState? moviesRecomendationState,
    String? moviesRecomendationMassage,
  }) {
    return MoviesdetailsState(
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      movieDetailsmassage: movieDetailsmassage ?? this.movieDetailsmassage,

      moviesRecomendation: moviesRecomendation ?? this.moviesRecomendation,
      moviesRecomendationState:
          moviesRecomendationState ?? this.moviesRecomendationState,

      moviesRecomendationMassage:
          moviesRecomendationMassage ?? this.moviesRecomendationMassage,
    );
  }

  @override
  List<Object?> get props => [
    moviesDetails,
    moviesDetailsState,
    movieDetailsmassage,
    moviesRecomendation,
    moviesRecomendationState,
    moviesRecomendationMassage,
  ];
}
