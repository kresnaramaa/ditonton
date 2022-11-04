import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movie.dart';
import 'package:movies/domain/usecases/get_popular_movie.dart';
import 'package:movies/domain/usecases/get_top_rated_movie.dart';
import 'package:movies/domain/usecases/get_watchlist_movie.dart';
import 'package:movies/domain/usecases/get_watchlist_status_movie.dart';
import 'package:movies/domain/usecases/remove_watchlist_movie.dart';
import 'package:movies/domain/usecases/save_watchlist_movie.dart';

part 'movie_state.dart';
part 'movie_event.dart';

class GetNowPlayingMoviesBloc extends Bloc<MovieEvent, MoviesState> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  GetNowPlayingMoviesBloc(this._getNowPlayingMovies) : super(MoviesLoading()) {
    on<OnNowPlayingMovies>((event, emit) async {
      emit(MoviesLoading());
      final result = await _getNowPlayingMovies.execute();

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
  }
}

class GetPopularMoviesBloc extends Bloc<MovieEvent, MoviesState> {
  final GetPopularMovies _getPopularMovies;

  GetPopularMoviesBloc(this._getPopularMovies) : super(MoviesLoading()) {
    on<OnPopularMovies>((event, emit) async {
      emit(MoviesLoading());
      final result = await _getPopularMovies.execute();

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
  }
}

class GetTopRatedMoviesBloc extends Bloc<MovieEvent, MoviesState> {
  final GetTopRatedMovies _getTopRatedMovies;

  GetTopRatedMoviesBloc(this._getTopRatedMovies) : super(MoviesLoading()) {
    on<OnTopRatedMovies>((event, emit) async {
      emit(MoviesLoading());
      final result = await _getTopRatedMovies.execute();

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
  }
}

class GetMovieDetailBloc extends Bloc<MovieEvent, MoviesState> {
  final GetMovieDetail _getMovieDetail;

  GetMovieDetailBloc(this._getMovieDetail) : super(MoviesLoading()) {
    on<OnMovieDetail>((event, emit) async {
      final id = event.id;

      emit(MoviesLoading());
      final result = await _getMovieDetail.execute(id);

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MovieDetailHasData(data)),
      );
    });
  }
}

class GetMovieRecommendationsBloc extends Bloc<MovieEvent, MoviesState> {
  final GetMovieRecommendations _getMovieRecommendations;

  GetMovieRecommendationsBloc(this._getMovieRecommendations)
      : super(MoviesLoading()) {
    on<OnMovieRecommendations>((event, emit) async {
      final id = event.id;

      emit(MoviesLoading());
      final result = await _getMovieRecommendations.execute(id);

      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
  }
}

class GetWatchlistMoviesBloc extends Bloc<MovieEvent, MoviesState> {
  final GetWatchlistMovies _getWatchlistMovies;
  final GetWatchListStatusMovie _getWatchListStatusMovie;
  final SaveWatchlistMovie _saveWatchlistMovie;
  final RemoveWatchlistMovie _removeWatchlistMovie;

  static const watchlistAddSuccessMessage = 'Added to Watchlist Movie';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist Movie';

  GetWatchlistMoviesBloc(
    this._getWatchlistMovies,
    this._getWatchListStatusMovie,
    this._saveWatchlistMovie,
    this._removeWatchlistMovie,
  ) : super(MoviesLoading()) {
    on<OnWatchlistMovies>((event, emit) async {
      emit(MoviesLoading());

      final result = await _getWatchlistMovies.execute();
      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MoviesHasData(data)),
      );
    });
    on<OnWatchlistMovieStatus>((event, emit) async {
      final id = event.id;
      emit(MoviesLoading());

      final result = await _getWatchListStatusMovie.execute(id);
      emit(MovieWatchlistStatus(result));
    });
    on<OnSaveWatchlistMovie>((event, emit) async {
      final movie = event.movieDetail;
      emit(MoviesLoading());

      final result = await _saveWatchlistMovie.execute(movie);
      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MovieWatchlistMessage(data)),
      );
    });
    on<OnRemoveWatchlistMovie>((event, emit) async {
      final movie = event.movieDetail;
      emit(MoviesLoading());

      final result = await _removeWatchlistMovie.execute(movie);
      result.fold(
        (failure) => emit(MoviesError(failure.message)),
        (data) => emit(MovieWatchlistMessage(data)),
      );
    });
  }
}
