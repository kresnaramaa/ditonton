import 'package:core/data/models/ssl/ssl_pinning.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/movies.dart';
import 'package:search/domain/usecases/search_movies.dart';
import 'package:search/domain/usecases/search_tv.dart';
import 'package:search/presentation/bloc/search_movie_bloc.dart';
import 'package:search/presentation/bloc/search_tv_bloc.dart';
import 'package:tv/tv.dart';
import 'package:http/io_client.dart';

final locator = GetIt.instance;
Future<void> init() async {
  IOClient ioClient = await SSLPinning.ioClient;
  // bloc
  locator.registerFactory(
    () => SearchMovieBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => SearchTVBloc(
      locator(),
    ),
  );

  locator.registerFactory(
    () => GetNowPlayingMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetPopularMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetTopRatedMoviesBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetMovieDetailBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetMovieRecommendationsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetWatchlistMoviesBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => GetOnTheAirTVBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetPopularTVBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetTopRatedTVBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetTVDetailBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetTVRecommendationsBloc(
      locator(),
    ),
  );
  locator.registerFactory(
    () => GetWatchlistTVBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusMovie(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistMovie(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  locator.registerLazySingleton(() => GetPopularTV(locator()));
  locator.registerLazySingleton(() => GetTopRatedTV(locator()));
  locator.registerLazySingleton(() => GetTVDetail(locator()));
  locator.registerLazySingleton(() => GetTVRecommendations(locator()));
  locator.registerLazySingleton(() => SearchTV(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTV(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTV(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTV(locator()));
  locator.registerLazySingleton(() => GetWatchlistTV(locator()));
  locator.registerLazySingleton(() => GetOnTheAirTV(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TVRepository>(
    () => TVRepositoryImpl(
      remoteDataSourceTv: locator(),
      localDataSourceTv: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TvRemoteDataSource>(
      () => TvRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TvLocalDataSource>(
      () => TvLocalDataSourceImpl(databaseHelperTv: locator()));

  // helper
  locator
      .registerLazySingleton<DatabaseHelperMovie>(() => DatabaseHelperMovie());
  locator.registerLazySingleton<DatabaseHelperTv>(() => DatabaseHelperTv());

  // external
  locator.registerLazySingleton(() => ioClient);
}
