import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';
import 'package:srijan_flutter_test/data/entity/quotes_response_entity.dart';
import 'package:srijan_flutter_test/data/source/quotes/remote/quotes_remote_datasource.dart';
import 'package:dio/dio.dart';

import '../../mocks.mocks.dart';

Future<void> main() async {
  late MockApiService mockApiService;
  late QuotesRemoteDSImpl quotesRemoteDSImpl;

  setUp(() {
    mockApiService = MockApiService();
    quotesRemoteDSImpl = QuotesRemoteDSImpl(mockApiService);
  });

  group('getQuotes', () {
    test('is successful with return of quotes',() async {
      final List<QuotesResponseEntity> quoteResponseList = [];
      final HttpResponse<List<QuotesResponseEntity>> response = HttpResponse(
        quoteResponseList,
        Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.ok,
        ),
      );
      when(quotesRemoteDSImpl.getQuotes(limit: 50))
          .thenAnswer((realInvocation) async => response);
      final result = await quotesRemoteDSImpl.getQuotes(limit: 50);
      expect(response, result);
    });
  });
}
