import 'package:bloc_test/bloc_test.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/domain/usecases/get_on_the_air_tv.dart';
import 'package:tv/domain/usecases/get_popular_tv.dart';
import 'package:tv/domain/usecases/get_top_rated_tv.dart';
import 'package:tv/domain/usecases/get_tv_detail.dart';
import 'package:tv/domain/usecases/get_tv_recommendations.dart';
import 'package:tv/domain/usecases/get_watchlist_status_tv.dart';
import 'package:tv/domain/usecases/get_watchlist_tv.dart';
import 'package:tv/domain/usecases/remove_watchlist_tv.dart';
import 'package:tv/domain/usecases/save_watchlist_tv.dart';
import 'package:tv/presentation/bloc/tv_bloc.dart';

import '../../dummy_data/dummy_objects_tv.dart';
import 'tv_bloc_test.mocks.dart';

@GenerateMocks([
  GetOnTheAirTV,
  GetPopularTV,
  GetTopRatedTV,
  GetTVDetail,
  GetTVRecommendations,
  GetWatchlistTV,
  GetWatchListStatusTV,
  SaveWatchlistTV,
  RemoveWatchlistTV,
])
void main() {
  late GetOnTheAirTVBloc getOnTheAirTVBloc;
  late GetPopularTVBloc getPopularTVBloc;
  late GetTopRatedTVBloc getTopRatedTVBloc;
  late GetTVDetailBloc getTVDetailBloc;
  late GetTVRecommendationsBloc getTVRecommendationsBloc;
  late GetWatchlistTVBloc getWatchlistTVBloc;

  late MockGetOnTheAirTV mockGetOnTheAirTV;
  late MockGetPopularTV mockGetPopularTV;
  late MockGetTopRatedTV mockGetTopRatedTV;
  late MockGetTVDetail mockGetTVDetail;
  late MockGetTVRecommendations mockGetTVRecommendations;
  late MockGetWatchlistTV mockGetWatchlistTV;
  late MockGetWatchListStatusTV mockGetWatchListStatusTV;
  late MockSaveWatchlistTV mockSaveWatchlistTV;
  late MockRemoveWatchlistTV mockRemoveWatchlistTV;

  setUp(() {
    mockGetOnTheAirTV = MockGetOnTheAirTV();
    mockGetPopularTV = MockGetPopularTV();
    mockGetTopRatedTV = MockGetTopRatedTV();
    mockGetTVDetail = MockGetTVDetail();
    mockGetTVRecommendations = MockGetTVRecommendations();
    mockGetWatchlistTV = MockGetWatchlistTV();
    mockGetWatchListStatusTV = MockGetWatchListStatusTV();
    mockSaveWatchlistTV = MockSaveWatchlistTV();
    mockRemoveWatchlistTV = MockRemoveWatchlistTV();

    getOnTheAirTVBloc = GetOnTheAirTVBloc(mockGetOnTheAirTV);
    getPopularTVBloc = GetPopularTVBloc(mockGetPopularTV);
    getTopRatedTVBloc = GetTopRatedTVBloc(mockGetTopRatedTV);
    getTVDetailBloc = GetTVDetailBloc(mockGetTVDetail);
    getTVRecommendationsBloc =
        GetTVRecommendationsBloc(mockGetTVRecommendations);
    getWatchlistTVBloc = GetWatchlistTVBloc(
      mockGetWatchlistTV,
      mockGetWatchListStatusTV,
      mockSaveWatchlistTV,
      mockRemoveWatchlistTV,
    );
  });

  const tId = 1;
  const tSaveMessage = GetWatchlistTVBloc.watchlistAddSuccessMessage;
  const tRemoveMessage = GetWatchlistTVBloc.watchlistRemoveSuccessMessage;

  group('on the air tvs', () {
    test('initial state should be loading', () {
      expect(getOnTheAirTVBloc.state, TVLoading());
    });

    blocTest<GetOnTheAirTVBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetOnTheAirTV.execute())
            .thenAnswer((_) async => Right(testTvList));
        return getOnTheAirTVBloc;
      },
      act: (bloc) => bloc.add(OnOnTheAirTV()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        TVHasData(testTvList),
      ],
      verify: (bloc) {
        verify(mockGetOnTheAirTV.execute());
      },
    );

    blocTest<GetOnTheAirTVBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetOnTheAirTV.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return getOnTheAirTVBloc;
      },
      act: (bloc) => bloc.add(OnOnTheAirTV()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        const TVError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetOnTheAirTV.execute());
      },
    );
  });

  group('popular tvs', () {
    test('initial state should be loading', () {
      expect(getPopularTVBloc.state, TVLoading());
    });

    blocTest<GetPopularTVBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetPopularTV.execute())
            .thenAnswer((_) async => Right(testTvList));
        return getPopularTVBloc;
      },
      act: (bloc) => bloc.add(OnPopularTV()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        TVHasData(testTvList),
      ],
      verify: (bloc) {
        verify(mockGetPopularTV.execute());
      },
    );
    blocTest<GetPopularTVBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetPopularTV.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return getPopularTVBloc;
      },
      act: (bloc) => bloc.add(OnPopularTV()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        const TVError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetPopularTV.execute());
      },
    );
  });

  group('top rated tvs', () {
    test('initial state should be loading', () {
      expect(getTopRatedTVBloc.state, TVLoading());
    });

    blocTest<GetTopRatedTVBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTopRatedTV.execute())
            .thenAnswer((_) async => Right(testTvList));
        return getTopRatedTVBloc;
      },
      act: (bloc) => bloc.add(OnTopRatedTV()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        TVHasData(testTvList),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTV.execute());
      },
    );
    blocTest<GetTopRatedTVBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetTopRatedTV.execute()).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return getTopRatedTVBloc;
      },
      act: (bloc) => bloc.add(OnTopRatedTV()),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        const TVError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTopRatedTV.execute());
      },
    );
  });

  group('tv detail', () {
    test('initial state should be loading', () {
      expect(getTVDetailBloc.state, TVLoading());
    });

    blocTest<GetTVDetailBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTVDetail.execute(tId))
            .thenAnswer((_) async => const Right(testTvDetail));
        return getTVDetailBloc;
      },
      act: (bloc) => bloc.add(const OnTVDetail(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        const TVDetailHasData(testTvDetail),
      ],
      verify: (bloc) {
        verify(mockGetTVDetail.execute(tId));
      },
    );
    blocTest<GetTVDetailBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetTVDetail.execute(tId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return getTVDetailBloc;
      },
      act: (bloc) => bloc.add(const OnTVDetail(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        const TVError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTVDetail.execute(tId));
      },
    );
  });

  group('tv recommendations', () {
    test('initial state should be loading', () {
      expect(getTVRecommendationsBloc.state, TVLoading());
    });

    blocTest<GetTVRecommendationsBloc, TVState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockGetTVRecommendations.execute(tId))
            .thenAnswer((_) async => Right(testTvList));
        return getTVRecommendationsBloc;
      },
      act: (bloc) => bloc.add(const OnTVRecommendations(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        TVHasData(testTvList),
      ],
      verify: (bloc) {
        verify(mockGetTVRecommendations.execute(tId));
      },
    );
    blocTest<GetTVRecommendationsBloc, TVState>(
      'Should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetTVRecommendations.execute(tId)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return getTVRecommendationsBloc;
      },
      act: (bloc) => bloc.add(const OnTVRecommendations(tId)),
      wait: const Duration(milliseconds: 100),
      expect: () => [
        TVLoading(),
        const TVError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockGetTVRecommendations.execute(tId));
      },
    );
  });

  group('watchlist tvs', () {
    test('initial state should be loading', () {
      expect(getWatchlistTVBloc.state, TVLoading());
    });
    group('get watchlist tvs list', () {
      blocTest<GetWatchlistTVBloc, TVState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchlistTV.execute())
              .thenAnswer((_) async => Right(testTvList));
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(OnWatchlistTV()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          TVHasData(testTvList),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistTV.execute());
        },
      );
      blocTest<GetWatchlistTVBloc, TVState>(
        'Should emit [Loading, Error] when unsuccessful',
        build: () {
          when(mockGetWatchlistTV.execute()).thenAnswer(
              (_) async => const Left(DatabaseFailure('Database Failure')));
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(OnWatchlistTV()),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          const TVError('Database Failure'),
        ],
        verify: (bloc) {
          verify(mockGetWatchlistTV.execute());
        },
      );
    });

    group('get watchlist tvs status', () {
      blocTest<GetWatchlistTVBloc, TVState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockGetWatchListStatusTV.execute(tId))
              .thenAnswer((_) async => true);
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(const OnWatchlistTVStatus(tId)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          const TVWatchlistStatus(true),
        ],
        verify: (bloc) {
          verify(mockGetWatchListStatusTV.execute(tId));
        },
      );
    });

    group('save watchlist tv', () {
      blocTest<GetWatchlistTVBloc, TVState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockSaveWatchlistTV.execute(testTvDetail))
              .thenAnswer((_) async => const Right(tSaveMessage));
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(const OnSaveWatchlistTV(testTvDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          const TVWatchlistMessage(tSaveMessage),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistTV.execute(testTvDetail));
        },
      );
      blocTest<GetWatchlistTVBloc, TVState>(
        'Should emit [Loading, Error] when unsuccessful',
        build: () {
          when(mockSaveWatchlistTV.execute(testTvDetail)).thenAnswer(
              (_) async => const Left(DatabaseFailure('Database Failure')));
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(const OnSaveWatchlistTV(testTvDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          const TVError('Database Failure'),
        ],
        verify: (bloc) {
          verify(mockSaveWatchlistTV.execute(testTvDetail));
        },
      );
    });
    group('remove watchlist tv', () {
      blocTest<GetWatchlistTVBloc, TVState>(
        'Should emit [Loading, HasData] when data is gotten successfully',
        build: () {
          when(mockRemoveWatchlistTV.execute(testTvDetail))
              .thenAnswer((_) async => const Right(tRemoveMessage));
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(const OnRemoveWatchlistTV(testTvDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          const TVWatchlistMessage(tRemoveMessage),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistTV.execute(testTvDetail));
        },
      );
      blocTest<GetWatchlistTVBloc, TVState>(
        'Should emit [Loading, Error] when unsuccessful',
        build: () {
          when(mockRemoveWatchlistTV.execute(testTvDetail)).thenAnswer(
              (_) async => const Left(DatabaseFailure('Database Failure')));
          return getWatchlistTVBloc;
        },
        act: (bloc) => bloc.add(const OnRemoveWatchlistTV(testTvDetail)),
        wait: const Duration(milliseconds: 100),
        expect: () => [
          TVLoading(),
          const TVError('Database Failure'),
        ],
        verify: (bloc) {
          verify(mockRemoveWatchlistTV.execute(testTvDetail));
        },
      );
    });
  });
}
