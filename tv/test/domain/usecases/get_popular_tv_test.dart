import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/domain/entities/tv.dart';
import 'package:tv/domain/usecases/get_popular_tv.dart';

import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late GetPopularTV usecase;
  late MockTVRepository mockTvRpository;

  setUp(() {
    mockTvRpository = MockTVRepository();
    usecase = GetPopularTV(mockTvRpository);
  });

  final tTv = <TV>[];

  group('GetPopularTv Tests', () {
    group('execute', () {
      test(
          'should get list of tvs from the repository when execute function is called',
          () async {
        // arrange
        when(mockTvRpository.getPopularTv())
            .thenAnswer((_) async => Right(tTv));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTv));
      });
    });
  });
}
