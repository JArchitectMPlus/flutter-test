import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';
import 'package:srijan_flutter_test/data/entity/quotes_response_entity.dart';
import 'package:srijan_flutter_test/data/repositiry/quotes/quotes_repository_impl.dart';
import 'package:dio/dio.dart';

import '../../mocks.mocks.dart';


void main() {
  late MockQuotesRemoteDS remoteDataSource;
  late QuotesRepositoryImpl repositoryImpl;

  setUp(() async {
    remoteDataSource = MockQuotesRemoteDS();
    repositoryImpl = QuotesRepositoryImpl(remoteDataSource);
  });

  group('GetQuoteDetail', () {
    test(
      'is successful with return of quote detail',
      () async {
        //arrange
        final QuotesResponseEntity quoteResponse = QuotesResponseEntity();
        final HttpResponse<QuotesResponseEntity> response = HttpResponse(
          quoteResponse,
          Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.ok,
          ),
        );

        when(remoteDataSource.getQuoteDetails(id: "vbTwRyX9uu"))
            .thenAnswer((realInvocation) async => response);

        final result = await repositoryImpl.getQuoteDetail(id: "vbTwRyX9uu");

        //assert
        result.fold(
              (l) {
            expect(l, isNull);
          },
              (r) {
            expect(r, r);
          },
        );
      },
    );
  });
}
