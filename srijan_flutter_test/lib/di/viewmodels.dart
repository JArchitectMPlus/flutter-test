import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/presentation/app/app_viewmodel.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_model.dart';

import 'usecase/quotes_usecase.dart';

/// Application
final appViewModelProvider = ChangeNotifierProvider.autoDispose<AppViewModel>(
  (ref) => AppViewModel(),
);

final quotesViewModelProvider =
ChangeNotifierProvider.autoDispose((ref) =>
QuotesViewModel(ref.read(getQuotesUseCaseProvider)));
