import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
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

  group('GetQuotes', () {
    test(
      'is successful with return of quotes',
      () async {
        //arrange
        final List<QuotesResponseEntity> quoteResponseList = [];
        final HttpResponse<List<QuotesResponseEntity>> response = HttpResponse(
          quoteResponseList,
          Response(
            requestOptions: RequestOptions(),
            statusCode: HttpStatus.ok,
          ),
        );
        when(remoteDataSource.getQuotes(limit: 50))
            .thenAnswer((realInvocation) async => response);
        //act
        final result = await repositoryImpl.getQuotes(limit: 50);
        //assert
        result.fold(
          (l) {
            expect(l, isNull);
          },
          (r) {
            expect(r, []);
          },
        );
      },
    );
  });
}
