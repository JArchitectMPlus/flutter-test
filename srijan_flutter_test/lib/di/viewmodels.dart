import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/di/usecase/quotes_detail_usecase.dart';
import 'package:srijan_flutter_test/presentation/app/app_viewmodel.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quote_detail_args_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page_model.dart';

import 'usecase/quotes_usecase.dart';

/// Application
final appViewModelProvider = ChangeNotifierProvider.autoDispose<AppViewModel>(
  (ref) => AppViewModel(),
);

final quotesViewModelProvider =
    ChangeNotifierProvider.autoDispose<QuotesViewModel>(
        (ref) => QuotesViewModel(ref.read(getQuotesUseCaseProvider)));

final quotesDetailViewModelProvider = ChangeNotifierProvider.family.autoDispose
    <QuotesDetailViewModel, QuoteDetailCallArgument>((ref, arguments) =>
        QuotesDetailViewModel(ref.read(getQuotesDetailUseCaseProvider),arguments));
