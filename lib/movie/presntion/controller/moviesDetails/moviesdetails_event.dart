part of 'moviesdetails_bloc.dart';

sealed class MoviesdetailsEvent extends Equatable {
  const MoviesdetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesdetailsEvent extends MoviesdetailsEvent {
  final int id;

  const GetMoviesdetailsEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetmoviesRecommendationEvent extends MoviesdetailsEvent {
  final int id;

  const GetmoviesRecommendationEvent({required this.id});
  @override
  List<Object> get props => [id];
}
