import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tv/domain/entities/tv.dart';
import 'package:tv/domain/usecases/get_on_the_air_tv.dart';

import '../../helpers/test_helper_tv.mocks.dart';

void main() {
  late GetOnTheAirTV usecase;
  late MockTVRepository mockTVRepository;

  setUp(() {
    mockTVRepository = MockTVRepository();
    usecase = GetOnTheAirTV(mockTVRepository);
  });

  final tTVs = <TV>[];

  test('should get list of tvs from the repository', () async {
    // arrange
    when(mockTVRepository.getOnTheAirTv()).thenAnswer((_) async => Right(tTVs));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTVs));
  });
}
