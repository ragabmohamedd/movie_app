// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moviesapp/core/utils/enums.dart';
import 'package:moviesapp/movie/domain/entities/Recommendation.dart';
import 'package:moviesapp/movie/domain/entities/movies_details.dart';
import 'package:moviesapp/movie/domain/usecase/get_Recommendation_usecase.dart';
import 'package:moviesapp/movie/domain/usecase/get_movie_details_usecase.dart';

part 'moviesdetails_event.dart';
part 'moviesdetails_state.dart';

class MoviesdetailsBloc extends Bloc<MoviesdetailsEvent, MoviesdetailsState> {
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationUsecase getRecommendationUsecase;
  MoviesdetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUsecase)
    : super(const MoviesdetailsState()) {
    on<GetMoviesdetailsEvent>(_getMoviesDetails);
    on<GetmoviesRecommendationEvent>(_getMoviesRecomendation);
  }

  FutureOr<void> _getMoviesDetails(
    GetMoviesdetailsEvent event,
    Emitter<MoviesdetailsState> emit,
  ) async {
    emit(state.copywith(moviesDetailsState: RequestState.loading));

    final result = await getMovieDetailsUsecase(
      MovieDetailsParameters(id: event.id),
    );

    result.fold(
      (l) {
        emit(
          state.copywith(
            moviesDetailsState: RequestState.error,
            movieDetailsmassage: l.massage,
          ),
        );
      },
      (r) {
        emit(
          state.copywith(
            moviesDetails: r,
            moviesDetailsState: RequestState.loaded,
          ),
        );
      },
    );
  }

  FutureOr<void> _getMoviesRecomendation(
    GetmoviesRecommendationEvent event,
    Emitter<MoviesdetailsState> emit,
  ) async {
    final result = await getRecommendationUsecase(
      Recommendationparameters(id: event.id),
    );

    result.fold(
      (l) => emit(
        state.copywith(
          moviesRecomendationState: RequestState.error,
          moviesRecomendationMassage: l.massage,
        ),
      ),
      (r) => emit(
        state.copywith(
          moviesRecomendation: r,
          moviesRecomendationState: RequestState.loaded,
        ),
      ),
    );
  }
}
