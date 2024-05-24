import 'package:srijan_flutter_test/domain/constants/error_type.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';
import 'package:srijan_flutter_test/generated/l10n.dart';

class ErrorParser {
  ErrorParser._();

  static String? getLocalisedStringError(
      {AppError? error, required S localisedHelper}) {
    switch (error?.type) {
      case ErrorType.network:
        return localisedHelper.networkError;
      default:
        return "";
    }
  }
}
