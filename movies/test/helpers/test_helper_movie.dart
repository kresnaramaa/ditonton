import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:movies/movies.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelperMovie,
], customMocks: [
  MockSpec<IOClient>(as: #MockHttpClient)
])
void main() {}
