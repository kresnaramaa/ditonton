import 'package:core/common/exception.dart';
import 'package:tv/data/datasource/db/database_helper_tv.dart';
import 'package:tv/data/model/tv_table.dart';

abstract class TvLocalDataSource {
  Future<String> insertWatchlistTv(TVTable tv);
  Future<String> removeWatchlistTv(TVTable tv);
  Future<TVTable?> getTvById(int id);
  Future<List<TVTable>> getWatchlistTv();
}

class TvLocalDataSourceImpl implements TvLocalDataSource {
  final DatabaseHelperTv databaseHelperTv;

  TvLocalDataSourceImpl({required this.databaseHelperTv});

  @override
  Future<String> insertWatchlistTv(TVTable tv) async {
    try {
      await databaseHelperTv.insertWatchlistTv(tv);
      return 'Added to Watchlist Tv';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistTv(TVTable tv) async {
    try {
      await databaseHelperTv.removeWatchlistTv(tv);
      return 'Removed from Watchlist Tv';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TVTable?> getTvById(int id) async {
    final result = await databaseHelperTv.getTvById(id);
    if (result != null) {
      return TVTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TVTable>> getWatchlistTv() async {
    final result = await databaseHelperTv.getWatchlistTv();
    return result.map((data) => TVTable.fromMap(data)).toList();
  }
}
