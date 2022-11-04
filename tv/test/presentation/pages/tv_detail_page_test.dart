import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv/presentation/bloc/tv_bloc.dart';
import 'package:tv/presentation/pages/tv_detail_page.dart';

import '../../dummy_data/dummy_objects_tv.dart';
import '../../helpers/bloc_helper_tv.dart';

void main() {
  late MockGetTVDetailBloc mockGetTVDetailBloc;
  late MockGetTVRecommendationsBloc mockGetTVRecommendationsBloc;
  late MockGetWatchlistTVBloc mockGetWatchlistTVBloc;

  setUpAll(() {
    mockGetTVDetailBloc = MockGetTVDetailBloc();
    mockGetTVRecommendationsBloc = MockGetTVRecommendationsBloc();
    mockGetWatchlistTVBloc = MockGetWatchlistTVBloc();
    registerFallbackValue(TVEventFake());
    registerFallbackValue(TVStateFake());
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetTVDetailBloc>(create: (_) => mockGetTVDetailBloc),
        BlocProvider<GetTVRecommendationsBloc>(
            create: (_) => mockGetTVRecommendationsBloc),
        BlocProvider<GetWatchlistTVBloc>(create: (_) => mockGetWatchlistTVBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when tv not added to watchlist',
      (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state)
        .thenReturn(const TVDetailHasData(testTvDetail));
    when(() => mockGetTVRecommendationsBloc.state)
        .thenReturn(TVHasData(testTvList));
    when(() => mockGetWatchlistTVBloc.state)
        .thenReturn(const TVWatchlistStatus(false));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when tv is added to wathclist',
      (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state)
        .thenReturn(const TVDetailHasData(testTvDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(TVEmpty());
    when(() => mockGetWatchlistTVBloc.state)
        .thenReturn(const TVWatchlistStatus(true));
    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state)
        .thenReturn(const TVDetailHasData(testTvDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(TVEmpty());
    when(() => mockGetWatchlistTVBloc.state)
        .thenReturn(const TVWatchlistStatus(false));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(GetWatchlistTVBloc.watchlistAddSuccessMessage),
        findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when removed from watchlist',
      (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state)
        .thenReturn(const TVDetailHasData(testTvDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(TVEmpty());
    when(() => mockGetWatchlistTVBloc.state)
        .thenReturn(const TVWatchlistStatus(true));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text(GetWatchlistTVBloc.watchlistRemoveSuccessMessage),
        findsOneWidget);
  });

  testWidgets('loading progress bar', (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state).thenReturn(TVLoading());
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(TVLoading());
    when(() => mockGetWatchlistTVBloc.state)
        .thenReturn(const TVWatchlistStatus(false));

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(circularProgressIndicator, findsOneWidget);
  });

  testWidgets('recomendation tv loading progress bar',
      (WidgetTester tester) async {
    when(() => mockGetTVDetailBloc.state)
        .thenReturn(const TVDetailHasData(testTvDetail));
    when(() => mockGetTVRecommendationsBloc.state).thenReturn(TVLoading());
    when(() => mockGetWatchlistTVBloc.state)
        .thenReturn(const TVWatchlistStatus(false));

    final circularProgressIndicator = find.byType(CircularProgressIndicator);

    await tester.pumpWidget(_makeTestableWidget(const TVDetailPage(id: 1)));

    expect(circularProgressIndicator, findsWidgets);
  });
}
