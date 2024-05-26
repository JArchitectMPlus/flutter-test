import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/di/repository_module.dart';
import 'package:srijan_flutter_test/domain/usecase/quotes/quotes_detail_usecase.dart';

final getQuotesDetailUseCaseProvider = Provider<QuotesDetailUseCase>(
      (ref) => QuotesDetailUseCase(ref.read(quoteDetailRepoProvider)),
);
