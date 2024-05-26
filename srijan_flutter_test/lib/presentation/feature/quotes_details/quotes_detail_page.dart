import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/di/viewmodels.dart';
import 'package:srijan_flutter_test/generated/l10n.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quote_detail_args_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page_view.dart';

class QuotesDetailPage extends BasePage<QuotesDetailViewModel> {
  final QuoteDetailCallArgument argument;
  const QuotesDetailPage({super.key, required this.argument});

  @override
  QuotesDetailPageState createState() => QuotesDetailPageState();
}

class QuotesDetailPageState
    extends BaseStatefulPage<QuotesDetailViewModel, QuotesDetailPage> {
  @override
  ProviderBase<QuotesDetailViewModel> provideBase() {
    return quotesDetailViewModelProvider.call(widget.argument);
  }

  @override
  Widget buildView(BuildContext context, QuotesDetailViewModel model) {
    return QuotesDetailPageView(
        provideBase(), widget.argument.index ?? 0);
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar(
      elevation: 5,
      centerTitle: true,
      title: Text(
        S.of(context).quoteNumber(widget.argument.index??0),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
