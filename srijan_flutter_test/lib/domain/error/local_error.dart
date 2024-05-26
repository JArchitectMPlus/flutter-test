import 'package:srijan_flutter_test/domain/constants/error_type.dart';
import 'package:srijan_flutter_test/domain/error/app_error.dart';
import 'package:srijan_flutter_test/domain/error/base_error.dart';
import 'package:srijan_flutter_test/domain/model/base/error_info.dart';

class LocalError extends BaseError {
  LocalError({
    required String message,
    required int localError,
    required super.cause,
  }) : super(
            error: ErrorInfo(message: message, code: localError));

  @override
  String getFriendlyMessage() {
    return error.message;
  }

  @override
  AppError transform() {
    switch (error.code) {
      default:
        return AppError(
            error: error, throwable: cause, type: ErrorType.ioException);
    }
  }
}
