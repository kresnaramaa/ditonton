import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv/domain/entities/tv.dart';
import 'package:tv/domain/entities/tv_detail.dart';

import 'package:tv/domain/usecases/get_popular_tv.dart';
import 'package:tv/domain/usecases/get_top_rated_tv.dart';
import 'package:tv/domain/usecases/get_on_the_air_tv.dart';
import 'package:tv/domain/usecases/get_tv_detail.dart';
import 'package:tv/domain/usecases/get_tv_recommendations.dart';
import 'package:tv/domain/usecases/get_watchlist_status_tv.dart';
import 'package:tv/domain/usecases/get_watchlist_tv.dart';
import 'package:tv/domain/usecases/remove_watchlist_tv.dart';
import 'package:tv/domain/usecases/save_watchlist_tv.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class GetOnTheAirTVBloc extends Bloc<TVEvent, TVState> {
  final GetOnTheAirTV _getOnTheAirTV;

  GetOnTheAirTVBloc(this._getOnTheAirTV) : super(TVLoading()) {
    on<OnOnTheAirTV>((event, emit) async {
      emit(TVLoading());
      final result = await _getOnTheAirTV.execute();

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetPopularTVBloc extends Bloc<TVEvent, TVState> {
  final GetPopularTV _getPopularTV;

  GetPopularTVBloc(this._getPopularTV) : super(TVLoading()) {
    on<OnPopularTV>((event, emit) async {
      emit(TVLoading());
      final result = await _getPopularTV.execute();

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetTopRatedTVBloc extends Bloc<TVEvent, TVState> {
  final GetTopRatedTV _getTopRatedTV;

  GetTopRatedTVBloc(this._getTopRatedTV) : super(TVLoading()) {
    on<OnTopRatedTV>((event, emit) async {
      emit(TVLoading());
      final result = await _getTopRatedTV.execute();

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetTVDetailBloc extends Bloc<TVEvent, TVState> {
  final GetTVDetail _getTVDetail;

  GetTVDetailBloc(this._getTVDetail) : super(TVLoading()) {
    on<OnTVDetail>((event, emit) async {
      final id = event.id;

      emit(TVLoading());
      final result = await _getTVDetail.execute(id);

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVDetailHasData(data)),
      );
    });
  }
}

class GetTVRecommendationsBloc extends Bloc<TVEvent, TVState> {
  final GetTVRecommendations _getTVRecommendations;

  GetTVRecommendationsBloc(this._getTVRecommendations) : super(TVLoading()) {
    on<OnTVRecommendations>((event, emit) async {
      final id = event.id;

      emit(TVLoading());
      final result = await _getTVRecommendations.execute(id);

      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
  }
}

class GetWatchlistTVBloc extends Bloc<TVEvent, TVState> {
  final GetWatchlistTV _getTVWatchlistTv;
  final GetWatchListStatusTV _getTVWatchListStatusTv;
  final SaveWatchlistTV _saveTVWatchlistTv;
  final RemoveWatchlistTV _removeTVWatchlistTv;

  static const watchlistAddSuccessMessage = 'Added to Watchlist Tv';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist Tv';

  GetWatchlistTVBloc(
    this._getTVWatchlistTv,
    this._getTVWatchListStatusTv,
    this._saveTVWatchlistTv,
    this._removeTVWatchlistTv,
  ) : super(TVLoading()) {
    on<OnWatchlistTV>((event, emit) async {
      emit(TVLoading());

      final result = await _getTVWatchlistTv.execute();
      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVHasData(data)),
      );
    });
    on<OnWatchlistTVStatus>((event, emit) async {
      final id = event.id;
      emit(TVLoading());

      final result = await _getTVWatchListStatusTv.execute(id);
      emit(TVWatchlistStatus(result));
    });
    on<OnSaveWatchlistTV>((event, emit) async {
      final movie = event.movieDetail;
      emit(TVLoading());

      final result = await _saveTVWatchlistTv.execute(movie);
      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVWatchlistMessage(data)),
      );
    });
    on<OnRemoveWatchlistTV>((event, emit) async {
      final movie = event.movieDetail;
      emit(TVLoading());

      final result = await _removeTVWatchlistTv.execute(movie);
      result.fold(
        (failure) => emit(TVError(failure.message)),
        (data) => emit(TVWatchlistMessage(data)),
      );
    });
  }
}
