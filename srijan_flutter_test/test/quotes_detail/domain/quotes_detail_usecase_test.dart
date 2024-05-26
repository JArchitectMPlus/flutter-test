import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';

import '../../mocks.mocks.dart';


main() {
  late MockQuotesDetailUseCase useCase;
  late MockQuotesRepository repository;
  setUpAll(() {
   repository = MockQuotesRepository();
   useCase = MockQuotesDetailUseCase();
  });
  test('Get quote detail', () async {

    when(repository.getQuoteDetail(id: "vbTwRyX9uu")).thenAnswer((realInvocation) async {
      return Right(Quotes());
    });

    final result = await repository.getQuoteDetail(id: "vbTwRyX9uu");
    //assert
    result.fold(
          (l) {},
          (r) {
        expect(r,isA<Quotes>());
      },
    );
  });
}
