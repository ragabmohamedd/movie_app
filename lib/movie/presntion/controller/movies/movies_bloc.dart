// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moviesapp/core/usecase/base_usecase.dart';
import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movie/domain/usecase/get_now_playing_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_popular_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_top_rated_usecase.dart';
import 'package:moviesapp/movie/presntion/controller/movies/movies_event.dart';
import 'package:moviesapp/movie/presntion/controller/movies/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingUsecase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlangUseCase);

    on<GetpoPularMoviesEvent>(_getPopularMoviesUseCase);

    on<GetTopRatedMoviesEvent>(_getTopRatedMoviesUseCase);
  }

  FutureOr<void> _getNowPlangUseCase(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingUsecase(Noparametars());

    result.fold(
      (l) {
        emit(
          state.copywith(
            nowPlayingState: RequestState.error,
            nowplayingmassage: l.massage,
          ),
        );
      },
      (r) {
        emit(
          state.copywith(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        );
      },
    );
  }

  FutureOr<void> _getPopularMoviesUseCase(
    GetpoPularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularMoviesUseCase(Noparametars());

    result.fold(
      (l) {
        emit(state.copywith(popularState: RequestState.error));
      },
      (r) {
        emit(
          state.copywith(popularMovies: r, popularState: RequestState.loaded),
        );
      },
    );
  }

  FutureOr<void> _getTopRatedMoviesUseCase(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUseCase(Noparametars());

    result.fold(
      (l) {
        emit(state.copywith(topratedState: RequestState.error));
      },
      (r) {
        emit(
          state.copywith(topratedMovies: r, topratedState: RequestState.loaded),
        );
      },
    );
  }
}
