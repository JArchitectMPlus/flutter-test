import 'package:retrofit/retrofit.dart';
import 'package:srijan_flutter_test/data/entity/quotes_response_entity.dart';

abstract class QuotesRemoteDS {
  Future<HttpResponse<List<QuotesResponseEntity>>> getQuotes({int limit = 50});

  Future<HttpResponse<String>> getQuoteDetails({required String id});
}
