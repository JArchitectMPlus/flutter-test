import 'package:flutter/cupertino.dart';
import 'package:srijan_flutter_test/presentation/app/navigation/route_paths.dart';
import 'package:srijan_flutter_test/presentation/feature/quotes/quotes_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.quotes:
        return CupertinoPageRoute(
          builder: (context) => QuotesPage(),
          settings: const RouteSettings(name: RoutePaths.quotes),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => Container(),
        );
    }
  }
}
