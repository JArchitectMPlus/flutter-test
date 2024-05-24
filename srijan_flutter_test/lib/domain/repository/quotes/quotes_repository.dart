import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/data/entity/quotes_response_entity.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes_response.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quote_detail_response.dart';

abstract class QuotesRepository {
  Future<Either<NetworkError, QuotesDetailResponse>> getQuoteDetail(
      {required String id});

  Future<Either<NetworkError, List<QuotesResponse>>> getQuotes({int limit = 50});
}
