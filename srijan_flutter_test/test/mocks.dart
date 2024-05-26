import 'package:mockito/annotations.dart';
import 'package:srijan_flutter_test/data/network/rest/api_service.dart';
import 'package:srijan_flutter_test/data/source/quotes/quotes_data_sources.dart';
import 'package:srijan_flutter_test/domain/repository/quotes/quotes_repository.dart';
import 'package:srijan_flutter_test/domain/usecase/quotes/quotes_detail_usecase.dart';
import 'package:srijan_flutter_test/domain/usecase/quotes/quotes_usecase.dart';
import 'package:dio/dio.dart';

/// Add new class that you want to mock here
/// Then run (dart run build_runner build)
/// It will create YourClassMock
@GenerateMocks([
  QuotesUseCase,
  QuotesDetailUseCase,
  QuotesRepository,
  QuotesRemoteDS,
  ApiService,
  Dio,
])
main() async {}
