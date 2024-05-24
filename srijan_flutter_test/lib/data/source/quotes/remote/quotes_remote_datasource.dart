import 'package:retrofit/dio.dart';
import 'package:srijan_flutter_test/data/entity/quotes_response_entity.dart';
import 'package:srijan_flutter_test/data/network/rest/api_service.dart';
import 'package:srijan_flutter_test/data/source/quotes/quotes_data_sources.dart';

class QuotesRemoteDSImpl extends QuotesRemoteDS {
  final ApiService _apiService;

  QuotesRemoteDSImpl(this._apiService);

  @override
  Future<HttpResponse<String>> getQuoteDetails({required String id}) {
    return _apiService.getQuoteDetails(id);
  }

  @override
  Future<HttpResponse<List<QuotesResponseEntity>>> getQuotes({int limit = 50}) {
    return _apiService.getQuotes(limit);
  }
}
