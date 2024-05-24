import 'package:dartz/dartz.dart';
import 'package:srijan_flutter_test/data/network/rest/utils/safe_api_call.dart';
import 'package:srijan_flutter_test/data/source/quotes/quotes_data_sources.dart';
import 'package:srijan_flutter_test/domain/error/network_error.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes_response.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quote_detail_response.dart';
import 'package:srijan_flutter_test/domain/repository/quotes/quotes_repository.dart';

class QuotesRepositoryImpl extends QuotesRepository {
  final QuotesRemoteDS _remoteDS;

  QuotesRepositoryImpl(
    this._remoteDS,
  );

  @override
  Future<Either<NetworkError, QuotesDetailResponse>> getQuoteDetail(
      {required String id}) async {
    final loginResponse = await safeApiCall(
      _remoteDS.getQuoteDetails(id: id),
    );

    return loginResponse.fold((l) => Left(l), (r) {
      return Right(QuotesDetailResponse());
    });
  }

  @override
  Future<Either<NetworkError, List<QuotesResponse>>> getQuotes({int limit = 50}) async {
    var response = await safeApiCall(_remoteDS.getQuotes(limit: limit),);
    return response.fold(
          (l) => Left(l),
          (r) => Right(r.data.map((e) => e.transform()).toList(),
      ),
    );
  }
}
