import 'dart:io';

import 'package:core/common/exception.dart';
import 'package:core/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:tv/data/datasource/tv_local_data_source.dart';
import 'package:tv/data/datasource/tv_remote_data_source.dart';
import 'package:tv/data/model/tv_table.dart';
import 'package:tv/domain/entities/tv.dart';
import 'package:tv/domain/entities/tv_detail.dart';
import 'package:tv/domain/repositories/tv_repository.dart';

class TVRepositoryImpl implements TVRepository {
  final TvRemoteDataSource remoteDataSourceTv;
  final TvLocalDataSource localDataSourceTv;

  TVRepositoryImpl({
    required this.remoteDataSourceTv,
    required this.localDataSourceTv,
  });

  @override
  Future<Either<Failure, List<TV>>> getOnTheAirTv() async {
    try {
      final result = await remoteDataSourceTv.getOnTheAirTv();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    }
  }

  @override
  Future<Either<Failure, TVDetail>> getTvDetail(int id) async {
    try {
      final result = await remoteDataSourceTv.getTvDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTvRecommendations(int id) async {
    try {
      final result = await remoteDataSourceTv.getTvRecommendations(id);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getPopularTv() async {
    try {
      final result = await remoteDataSourceTv.getPopularTv();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTopRatedTv() async {
    try {
      final result = await remoteDataSourceTv.getTopRatedTv();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> searchTv(String query) async {
    try {
      final result = await remoteDataSourceTv.searchTv(query);
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return const Left(SSLFailure('CERTIFICATE_VERIFY_FAILED'));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistTv(TVDetail movie) async {
    try {
      final result =
          await localDataSourceTv.insertWatchlistTv(TVTable.fromEntity(movie));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlistTv(TVDetail movie) async {
    try {
      final result =
          await localDataSourceTv.removeWatchlistTv(TVTable.fromEntity(movie));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToWatchlistTv(int id) async {
    final result = await localDataSourceTv.getTvById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<TV>>> getWatchlistTv() async {
    final result = await localDataSourceTv.getWatchlistTv();
    return Right(result.map((data) => data.toEntity()).toList());
  }
}
