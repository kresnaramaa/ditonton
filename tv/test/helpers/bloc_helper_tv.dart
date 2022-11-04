import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tv/presentation/bloc/tv_bloc.dart';

class TVStateFake extends Fake implements TVState {}

class TVEventFake extends Fake implements TVEvent {}

class MockGetOnTheAirTVBloc extends MockBloc<TVEvent, TVState>
    implements GetOnTheAirTVBloc {}

class MockGetPopularTVBloc extends MockBloc<TVEvent, TVState>
    implements GetPopularTVBloc {}

class MockGetTopRatedTVBloc extends MockBloc<TVEvent, TVState>
    implements GetTopRatedTVBloc {}

class MockGetTVDetailBloc extends MockBloc<TVEvent, TVState>
    implements GetTVDetailBloc {}

class MockGetTVRecommendationsBloc extends MockBloc<TVEvent, TVState>
    implements GetTVRecommendationsBloc {}

class MockGetWatchlistTVBloc extends MockBloc<TVEvent, TVState>
    implements GetWatchlistTVBloc {}
