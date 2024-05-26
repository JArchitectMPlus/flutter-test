import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/data/network/rest/utils/safe_api_call.dart';
import 'package:srijan_flutter_test/data/source/quotes/quotes_data_sources.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';
import 'package:srijan_flutter_test/domain/repository/quotes/quotes_repository.dart';

class QuotesRepositoryImpl extends QuotesRepository {
  final QuotesRemoteDS _remoteDS;

  QuotesRepositoryImpl(
    this._remoteDS,
  );

  @override
  Future<Either<NetworkError, Quotes>> getQuoteDetail(
      {required String id}) async {
    final response = await safeApiCall(
      _remoteDS.getQuoteDetails(id: id),
    );

    return response.fold((l) {
      return Left(l);
    } ,(r) {
      return Right(r.data.transform());
    });
  }

  @override
  Future<Either<NetworkError, List<Quotes>>> getQuotes(
      {int limit = 50}) async {
    var response = await safeApiCall(
      _remoteDS.getQuotes(limit: limit),
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(
        r.data.map((e) => e.transform()).toList(),
      ),
    );
  }
}
