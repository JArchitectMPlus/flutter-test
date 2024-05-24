import 'package:riverpod/riverpod.dart';
import 'package:srijan_flutter_test/di/network_module.dart';
import 'package:srijan_flutter_test/data/repositiry/quotes/quotes_repository_impl.dart';
import 'package:srijan_flutter_test/domain/repository/quotes/quotes_repository.dart';

var quoteRepoProvider = Provider<QuotesRepository>(
  (ref) => QuotesRepositoryImpl(
    ref.read(quotesRemoteDSProvider),
  ),
);

var quoteDetailRepoProvider = Provider<QuotesRepository>(
      (ref) => QuotesRepositoryImpl(
    ref.read(quotesDetailRemoteDSProvider),
  ),
);
