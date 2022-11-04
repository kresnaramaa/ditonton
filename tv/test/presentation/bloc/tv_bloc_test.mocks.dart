// Mocks generated by Mockito 5.3.2 from annotations
// in tv/test/presentation/bloc/tv_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:core/common/failure.dart' as _i6;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:tv/domain/entities/tv.dart' as _i7;
import 'package:tv/domain/entities/tv_detail.dart' as _i11;
import 'package:tv/domain/repositories/tv_repository.dart' as _i2;
import 'package:tv/domain/usecases/get_on_the_air_tv.dart' as _i4;
import 'package:tv/domain/usecases/get_popular_tv.dart' as _i8;
import 'package:tv/domain/usecases/get_top_rated_tv.dart' as _i9;
import 'package:tv/domain/usecases/get_tv_detail.dart' as _i10;
import 'package:tv/domain/usecases/get_tv_recommendations.dart' as _i12;
import 'package:tv/domain/usecases/get_watchlist_status_tv.dart' as _i14;
import 'package:tv/domain/usecases/get_watchlist_tv.dart' as _i13;
import 'package:tv/domain/usecases/remove_watchlist_tv.dart' as _i16;
import 'package:tv/domain/usecases/save_watchlist_tv.dart' as _i15;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeTVRepository_0 extends _i1.SmartFake implements _i2.TVRepository {
  _FakeTVRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetOnTheAirTV].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetOnTheAirTV extends _i1.Mock implements _i4.GetOnTheAirTV {
  MockGetOnTheAirTV() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_1<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>);
}

/// A class which mocks [GetPopularTV].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularTV extends _i1.Mock implements _i8.GetPopularTV {
  MockGetPopularTV() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_1<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>);
}

/// A class which mocks [GetTopRatedTV].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedTV extends _i1.Mock implements _i9.GetTopRatedTV {
  MockGetTopRatedTV() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_1<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>);
}

/// A class which mocks [GetTVDetail].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTVDetail extends _i1.Mock implements _i10.GetTVDetail {
  MockGetTVDetail() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i11.TVDetail>> execute(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, _i11.TVDetail>>.value(
            _FakeEither_1<_i6.Failure, _i11.TVDetail>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, _i11.TVDetail>>);
}

/// A class which mocks [GetTVRecommendations].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTVRecommendations extends _i1.Mock
    implements _i12.GetTVRecommendations {
  MockGetTVRecommendations() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>> execute(dynamic id) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_1<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #execute,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>);
}

/// A class which mocks [GetWatchlistTV].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTV extends _i1.Mock implements _i13.GetWatchlistTV {
  MockGetWatchlistTV() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>.value(
            _FakeEither_1<_i6.Failure, List<_i7.TV>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.TV>>>);
}

/// A class which mocks [GetWatchListStatusTV].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchListStatusTV extends _i1.Mock
    implements _i14.GetWatchListStatusTV {
  MockGetWatchListStatusTV() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i5.Future<bool> execute(int? id) => (super.noSuchMethod(
        Invocation.method(
          #execute,
          [id],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [SaveWatchlistTV].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveWatchlistTV extends _i1.Mock implements _i15.SaveWatchlistTV {
  MockSaveWatchlistTV() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i11.TVDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
            _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String>>);
}

/// A class which mocks [RemoveWatchlistTV].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveWatchlistTV extends _i1.Mock implements _i16.RemoveWatchlistTV {
  MockRemoveWatchlistTV() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.TVRepository get repository => (super.noSuchMethod(
        Invocation.getter(#repository),
        returnValue: _FakeTVRepository_0(
          this,
          Invocation.getter(#repository),
        ),
      ) as _i2.TVRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, String>> execute(_i11.TVDetail? tv) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [tv],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, String>>.value(
            _FakeEither_1<_i6.Failure, String>(
          this,
          Invocation.method(
            #execute,
            [tv],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, String>>);
}
