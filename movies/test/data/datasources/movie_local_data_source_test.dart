import 'package:core/common/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/data/datasources/movie_local_data_source.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper_movie.mocks.dart';

void main() {
  late MovieLocalDataSourceImpl dataSource;
  late MockDatabaseHelperMovie mockDatabaseHelperMovie;

  setUp(() {
    mockDatabaseHelperMovie = MockDatabaseHelperMovie();
    dataSource =
        MovieLocalDataSourceImpl(databaseHelper: mockDatabaseHelperMovie);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelperMovie.insertWatchlistMovie(testMovieTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlistMovie(testMovieTable);
      // assert
      expect(result, 'Added to Watchlist Movie');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperMovie.insertWatchlistMovie(testMovieTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlistMovie(testMovieTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelperMovie.removeWatchlistMovie(testMovieTable))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlistMovie(testMovieTable);
      // assert
      expect(result, 'Removed from Watchlist Movie');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelperMovie.removeWatchlistMovie(testMovieTable))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlistMovie(testMovieTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Movie Detail By Id', () {
    const tId = 1;

    test('should return Movie Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelperMovie.getMovieById(tId))
          .thenAnswer((_) async => testMovieMap);
      // act
      final result = await dataSource.getMovieById(tId);
      // assert
      expect(result, testMovieTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelperMovie.getMovieById(tId))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSource.getMovieById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist movies', () {
    test('should return list of MovieTable from database', () async {
      // arrange
      when(mockDatabaseHelperMovie.getWatchlistMovies())
          .thenAnswer((_) async => [testMovieMap]);
      // act
      final result = await dataSource.getWatchlistMovies();
      // assert
      expect(result, [testMovieTable]);
    });
  });
}
