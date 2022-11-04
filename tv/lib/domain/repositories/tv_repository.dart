import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tv/domain/entities/tv.dart';
import 'package:tv/domain/entities/tv_detail.dart';

abstract class TVRepository {
  Future<Either<Failure, List<TV>>> getOnTheAirTv();
  Future<Either<Failure, List<TV>>> getPopularTv();
  Future<Either<Failure, List<TV>>> getTopRatedTv();
  Future<Either<Failure, TVDetail>> getTvDetail(int id);
  Future<Either<Failure, List<TV>>> getTvRecommendations(int id);
  Future<Either<Failure, List<TV>>> searchTv(String query);
  Future<Either<Failure, String>> saveWatchlistTv(TVDetail tv);
  Future<Either<Failure, String>> removeWatchlistTv(TVDetail tv);
  Future<bool> isAddedToWatchlistTv(int id);
  Future<Either<Failure, List<TV>>> getWatchlistTv();
}
