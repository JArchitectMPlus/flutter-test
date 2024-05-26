import 'package:flutter/cupertino.dart';
import 'package:srijan_flutter_test/presentation/app/navigation/route_paths.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quote_detail_args_model.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes_details/quotes_detail_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.quotes:
        return CupertinoPageRoute(
          builder: (context) => const QuotesPage(),
          settings: const RouteSettings(name: RoutePaths.quotes),
        );

      case RoutePaths.quoteDetails:
        return CupertinoPageRoute(
          builder: (context) => QuotesDetailPage(
              argument: settings.arguments as QuoteDetailCallArgument),
          settings: const RouteSettings(name: RoutePaths.quoteDetails),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
