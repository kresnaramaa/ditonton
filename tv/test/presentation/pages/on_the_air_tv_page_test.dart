import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tv/presentation/bloc/tv_bloc.dart';
import 'package:tv/presentation/pages/on_the_air_tv_page.dart';
import 'package:tv/presentation/widgets/tv_card_list.dart';

import '../../helpers/bloc_helper_tv.dart';
import '../../dummy_data/dummy_objects_tv.dart';

void main() {
  late MockGetOnTheAirTVBloc mockGetOnTheAirTVBloc;

  setUpAll(() {
    mockGetOnTheAirTVBloc = MockGetOnTheAirTVBloc();
    registerFallbackValue(TVEventFake());
    registerFallbackValue(TVStateFake());
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetOnTheAirTVBloc>(create: (_) => mockGetOnTheAirTVBloc),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets('Page should display center progress bar when loading',
      (WidgetTester tester) async {
    when(() => mockGetOnTheAirTVBloc.state).thenReturn(TVLoading());

    final progressBarFinder = find.byType(CircularProgressIndicator);
    final centerFinder = find.byType(Center);

    await tester.pumpWidget(_makeTestableWidget(const OnTheAirTVPage()));

    expect(centerFinder, findsOneWidget);
    expect(progressBarFinder, findsOneWidget);
  });

  testWidgets('Page should display ListView when data is loaded',
      (WidgetTester tester) async {
    when(() => mockGetOnTheAirTVBloc.state).thenReturn(TVHasData(testTvList));

    final listViewFinder = find.byType(ListView);

    await tester.pumpWidget(_makeTestableWidget(const OnTheAirTVPage()));

    expect(listViewFinder, findsOneWidget);
  });

  testWidgets('Page should display TVCard when data is loaded',
      (WidgetTester tester) async {
    when(() => mockGetOnTheAirTVBloc.state).thenReturn(TVHasData(testTvList));

    final tvCardFinder = find.byType(TVCard);

    await tester.pumpWidget(_makeTestableWidget(const OnTheAirTVPage()));

    expect(tvCardFinder, findsOneWidget);
  });
}
