import 'package:fluttertoast/fluttertoast.dart';
import 'package:srijan_flutter_test/presentation/base/base_page.dart';
import 'package:srijan_flutter_test/presentation/ui/app_toast.dart';

extension PageExtensions on BaseStatefulPage {
  showShortToast(String? message) {
    AppToast.showToast(message ?? "", duration: Toast.LENGTH_SHORT);
  }

  showLongToast(String? message) {
    AppToast.showToast(message ?? "", duration: Toast.LENGTH_LONG);
  }
}
