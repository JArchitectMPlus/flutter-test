import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';

abstract class QuotesRepository {
  Future<Either<NetworkError, Quotes>> getQuoteDetail(
      {required String id});

  Future<Either<NetworkError, List<Quotes>>> getQuotes({int limit = 50});
}
