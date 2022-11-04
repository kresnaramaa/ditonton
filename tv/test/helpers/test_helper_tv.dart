import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:tv/data/datasource/db/database_helper_tv.dart';
import 'package:tv/data/datasource/tv_local_data_source.dart';
import 'package:tv/data/datasource/tv_remote_data_source.dart';
import 'package:tv/domain/repositories/tv_repository.dart';

@GenerateMocks([
  TVRepository,
  TvRemoteDataSource,
  TvLocalDataSource,
  DatabaseHelperTv,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
