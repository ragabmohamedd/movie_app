// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movie/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowplayingmassage;

  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularmassage;

  final List<Movie> topratedMovies;
  final RequestState topratedState;
  final String topratedmassage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowplayingmassage = '',
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularmassage = '',
    this.topratedMovies = const [],
    this.topratedState = RequestState.loading,
    this.topratedmassage = '',
  });

  MoviesState copywith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowplayingmassage,

    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularmassage,

    final List<Movie>? topratedMovies,
    final RequestState? topratedState,
    final String? topratedmassage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowplayingmassage: nowplayingmassage ?? this.nowplayingmassage,

      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularmassage: popularmassage ?? this.popularmassage,

      topratedMovies: topratedMovies ?? this.topratedMovies,
      topratedState: topratedState ?? this.topratedState,
      topratedmassage: topratedmassage ?? this.topratedmassage,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowplayingmassage,
    popularMovies,
    popularState,
    popularmassage,
    topratedMovies,
    topratedState,
    topratedmassage,
  ];
}
