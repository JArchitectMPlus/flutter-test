import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:srijan_flutter_test/domain/model/quotes/quotes.dart';

import '../../mocks.mocks.dart';


main() {
  late MockQuotesUseCase useCase;
  late MockQuotesRepository repository;
  setUpAll(() {
   repository = MockQuotesRepository();
   useCase = MockQuotesUseCase();
  });
  test('Get quotes', () async {
    when(repository.getQuotes(limit: 50)).thenAnswer((realInvocation) async {
      return const Right([]);
    });

    final result = await repository.getQuotes(limit: 50);
    //assert
    result.fold(
          (l) {},
          (r) {
            expect(r,isA<List<Quotes>>());
      },
    );

  });
}
