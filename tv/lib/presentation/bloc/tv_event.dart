part of 'tv_bloc.dart';

abstract class TVEvent extends Equatable {
  const TVEvent();

  @override
  List<Object> get props => [];
}

class OnPopularTV extends TVEvent {}

class OnOnTheAirTV extends TVEvent {}

class OnTopRatedTV extends TVEvent {}

class OnTVDetail extends TVEvent {
  final int id;
  const OnTVDetail(this.id);

  @override
  List<Object> get props => [id];
}

class OnTVRecommendations extends TVEvent {
  final int id;
  const OnTVRecommendations(this.id);

  @override
  List<Object> get props => [id];
}

class OnWatchlistTV extends TVEvent {}

class OnWatchlistTVStatus extends TVEvent {
  final int id;
  const OnWatchlistTVStatus(this.id);

  @override
  List<Object> get props => [id];
}

class OnSaveWatchlistTV extends TVEvent {
  final TVDetail movieDetail;
  const OnSaveWatchlistTV(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class OnRemoveWatchlistTV extends TVEvent {
  final TVDetail movieDetail;
  const OnRemoveWatchlistTV(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}
