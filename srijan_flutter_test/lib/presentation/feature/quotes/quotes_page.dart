import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/di/viewmodels.dart';
import 'package:srijan_flutter_test/generated/l10n.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_view.dart';

class QuotesPage extends BasePage<QuotesViewModel> {
  const QuotesPage({super.key});

  @override
  QuotesPageState createState() => QuotesPageState();
}

class QuotesPageState extends BaseStatefulPage<QuotesViewModel, QuotesPage> {
  @override
  ProviderBase<QuotesViewModel> provideBase() {
    return quotesViewModelProvider;
  }

  @override
  Widget buildView(BuildContext context, QuotesViewModel model) {
    return QuotesPageView(provideBase());
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar(
      elevation: 5,
      centerTitle: true,
      title: Text(
        S.of(context).home,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
