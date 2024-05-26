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

  group('getQuoteDetail', () {
    test('is successful with return of quote detail',() async {
      final QuotesResponseEntity quoteResponse = QuotesResponseEntity();
      final HttpResponse<QuotesResponseEntity> response = HttpResponse(
        quoteResponse,
        Response(
          requestOptions: RequestOptions(),
          statusCode: HttpStatus.ok,
        ),
      );

      when(quotesRemoteDSImpl.getQuoteDetails(id: "vbTwRyX9uu"))
          .thenAnswer((realInvocation) async => response);

      final result = await quotesRemoteDSImpl.getQuoteDetails(id: "vbTwRyX9uu");
      expect(response, result);
    });
  });
}
