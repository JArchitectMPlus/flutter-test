import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/di/repository_module.dart';
import 'package:srijan_flutter_test/domain/usecase/quotes/quotes_usecase.dart';

final getQuotesUseCaseProvider = Provider<QuotesUseCase>(
      (ref) => QuotesUseCase(ref.read(quoteRepoProvider)),
);
