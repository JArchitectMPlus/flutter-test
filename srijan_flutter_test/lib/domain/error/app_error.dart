import 'package:srijan_flutter_test/domain/constants/error_type.dart';
import 'package:srijan_flutter_test/domain/model/base/error_info.dart';

class AppError implements Exception {
  ErrorType type;
  ErrorInfo error;
  Exception throwable;

  AppError({
    required this.throwable,
    required this.error,
    required this.type,
  });
}
