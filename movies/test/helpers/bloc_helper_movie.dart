import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/presentation/bloc/movie_bloc.dart';

class MovieStateFake extends Fake implements MoviesState {}

class MovieEventFake extends Fake implements MovieEvent {}

class MockGetNowPlayingMoviesBloc extends MockBloc<MovieEvent, MoviesState>
    implements GetNowPlayingMoviesBloc {}

class MockGetPopularMoviesBloc extends MockBloc<MovieEvent, MoviesState>
    implements GetPopularMoviesBloc {}

class MockGetTopRatedMoviesBloc extends MockBloc<MovieEvent, MoviesState>
    implements GetTopRatedMoviesBloc {}

class MockGetMovieDetailBloc extends MockBloc<MovieEvent, MoviesState>
    implements GetMovieDetailBloc {}

class MockGetMovieRecommendationsBloc extends MockBloc<MovieEvent, MoviesState>
    implements GetMovieRecommendationsBloc {}

class MockGetWatchlistMoviesBloc extends MockBloc<MovieEvent, MoviesState>
    implements GetWatchlistMoviesBloc {}
