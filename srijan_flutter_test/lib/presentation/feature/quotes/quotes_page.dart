import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/di/viewmodels.dart';
import 'package:srijan_flutter_test/presentation/app/navigation/route_paths.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_view.dart';
import 'package:srijan_flutter_test/presentation/utils/color_utils.dart';

class QuotesPage extends BasePage<QuotesViewModel> {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  QuotesPageState createState() => QuotesPageState();
}

class QuotesPageState extends BaseStatefulPage<QuotesViewModel, QuotesPage> {
  @override
  ProviderBase<QuotesViewModel> provideBase() {
    return quotesViewModelProvider;
  }

  @override
  void onModelReady(QuotesViewModel model) {

  }

  @override
  bool extendBodyBehindAppBar() {
    return true;
  }

  @override
  Color scaffoldBackgroundColor() {
    return AppColors.color1;
  }

  @override
  Widget buildView(BuildContext context, QuotesViewModel model) {
    return QuotesPageView(provideBase());
  }
}
