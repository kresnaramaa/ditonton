part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class OnNowPlayingMovies extends MovieEvent {}

class OnPopularMovies extends MovieEvent {}

class OnTopRatedMovies extends MovieEvent {}

class OnMovieDetail extends MovieEvent {
  final int id;
  const OnMovieDetail(this.id);

  @override
  List<Object> get props => [id];
}

class OnMovieRecommendations extends MovieEvent {
  final int id;
  const OnMovieRecommendations(this.id);

  @override
  List<Object> get props => [id];
}

class OnWatchlistMovies extends MovieEvent {}

class OnWatchlistMovieStatus extends MovieEvent {
  final int id;
  const OnWatchlistMovieStatus(this.id);

  @override
  List<Object> get props => [id];
}

class OnSaveWatchlistMovie extends MovieEvent {
  final MovieDetail movieDetail;
  const OnSaveWatchlistMovie(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnRemoveWatchlistMovie extends MovieEvent {
  final MovieDetail movieDetail;
  const OnRemoveWatchlistMovie(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}
