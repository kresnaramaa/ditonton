import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:search/domain/usecases/search_tv.dart';
import 'package:search/presentation/bloc/search_tv_bloc.dart';
import 'package:tv/domain/entities/tv.dart';

import 'search_tv_bloc_test.mocks.dart';

@GenerateMocks([SearchTV])
void main() {
  late SearchTVBloc searchTvBloc;
  late MockSearchTV mockSearchTV;

  setUp(() {
    mockSearchTV = MockSearchTV();
    searchTvBloc = SearchTVBloc(mockSearchTV);
  });

  group('search tv', () {
    test('initial state should be empty', () {
      expect(searchTvBloc.state, SearchTvEmpty());
    });

    final tTvModel = TV(
      backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
      genreIds: const [14, 28],
      id: 557,
      originalName: 'Dahmer – Monster: The Jeffrey Dahmer Story',
      overview:
          'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
      popularity: 60.441,
      posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
      name: 'Dahmer – Monster: The Jeffrey Dahmer Story',
      voteAverage: 7.2,
      voteCount: 13507,
    );
    final tTvList = <TV>[tTvModel];
    const tQuery = 'Dahmer';

    blocTest<SearchTVBloc, SearchTvState>(
      'Should emit [Loading, HasData] when data is gotten successfully',
      build: () {
        when(mockSearchTV.execute(tQuery))
            .thenAnswer((_) async => Right(tTvList));
        return searchTvBloc;
      },
      act: (bloc) => bloc.add(const OnQueryTvChanged(query: tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchTvLoading(),
        SearchTvHasData(tTvList),
      ],
      verify: (bloc) {
        verify(mockSearchTV.execute(tQuery));
      },
    );

    blocTest<SearchTVBloc, SearchTvState>(
      'Should emit [Loading, Error] when get search is unsuccessful',
      build: () {
        when(mockSearchTV.execute(tQuery)).thenAnswer(
            (_) async => const Left(ServerFailure('Server Failure')));
        return searchTvBloc;
      },
      act: (bloc) => bloc.add(const OnQueryTvChanged(query: tQuery)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        SearchTvLoading(),
        const SearchTvError('Server Failure'),
      ],
      verify: (bloc) {
        verify(mockSearchTV.execute(tQuery));
      },
    );
  });
}
