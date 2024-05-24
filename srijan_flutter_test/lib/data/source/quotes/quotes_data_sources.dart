import 'package:retrofit/retrofit.dart';
import 'package:srijan_flutter_test/data/entity/quotes_detail_response_entity.dart';
import 'package:srijan_flutter_test/data/entity/quotes_response_entity.dart';

abstract class QuotesRemoteDS {
  Future<HttpResponse<List<QuotesResponseEntity>>> getQuotes({int limit = 50});

  Future<HttpResponse<QuotesDetailResponseEntity>> getQuoteDetails({required String id});
}
