import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:srijan_flutter_test/di/viewmodels.dart';
import 'package:srijan_flutter_test/presentation/app/navigation/route_paths.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page_view.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page_view.dart';
import 'package:srijan_flutter_test/presentation/utils/color_utils.dart';

class QuotesDetailPage extends BasePage<QuotesDetailViewModel> {
  const QuotesDetailPage({Key? key}) : super(key: key);

  @override
  QuotesDetailPageState createState() => QuotesDetailPageState();
}

class QuotesDetailPageState extends BaseStatefulPage<QuotesDetailViewModel, QuotesDetailPage> {
  @override
  ProviderBase<QuotesDetailViewModel> provideBase() {
    return quotesDetailViewModelProvider;
  }

  @override
  void onModelReady(QuotesDetailViewModel model) {
   /* model.navigate();
    model.navigateToDashboard().listen((navigateData) {
      Navigator.pushReplacementNamed(context, RoutePaths.quotes);
    });*/
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
  Widget buildView(BuildContext context, QuotesDetailViewModel model) {
    return QuotesDetailPageView(provideBase());
  }
}
