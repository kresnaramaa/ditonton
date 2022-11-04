import 'package:about/about_page.dart';
import 'package:core/common/constants.dart';
import 'package:core/common/routes.dart';
import 'package:core/common/utils.dart';
import 'package:core/presentation/pages/watchlist_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movies.dart';
import 'package:provider/provider.dart';
import 'package:movie/injection.dart' as di;
import 'package:search/presentation/bloc/search_movie_bloc.dart';
import 'package:search/presentation/bloc/search_tv_bloc.dart';
import 'package:search/presentation/pages/search_page.dart';
import 'package:search/presentation/pages/search_tv_page.dart';
import 'package:tv/tv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<SearchMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchTVBloc>(),
        ),
        BlocProvider(create: (_) => di.locator<GetNowPlayingMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetPopularMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetTopRatedMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetMovieDetailBloc>()),
        BlocProvider(create: (_) => di.locator<GetMovieRecommendationsBloc>()),
        BlocProvider(create: (_) => di.locator<GetWatchlistMoviesBloc>()),
        BlocProvider(create: (_) => di.locator<GetOnTheAirTVBloc>()),
        BlocProvider(create: (_) => di.locator<GetPopularTVBloc>()),
        BlocProvider(create: (_) => di.locator<GetTopRatedTVBloc>()),
        BlocProvider(create: (_) => di.locator<GetTVDetailBloc>()),
        BlocProvider(create: (_) => di.locator<GetTVRecommendationsBloc>()),
        BlocProvider(create: (_) => di.locator<GetWatchlistTVBloc>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomeMoviePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HOME_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => HomeMoviePage());
            case HOME_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => HomeTVPage());
            case POPULAR_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case POPULAR_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => PopularTVPage());
            case ON_THE_AIR_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => OnTheAirTVPage());
            case NOW_PLAYING_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => NowPlayingPage());
            case TOP_RATED_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case TOP_RATED_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => TopRatedTVPage());
            case DETAIL_MOVIE_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case DETAIL_TV_ROUTE:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TVDetailPage(id: id),
                settings: settings,
              );

            case SEARCH_MOVIE_ROUTE:
              return CupertinoPageRoute(builder: (_) => SearchMoviePage());
            case SEARCH_TV_ROUTE:
              return CupertinoPageRoute(builder: (_) => SearchTvPage());
            case WATCHLIST_ROUTE:
              return MaterialPageRoute(builder: (_) => WatchlistPage());

            case ABOUT_ROUTE:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
